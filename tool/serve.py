"""Local static preview with the same extensionless SPA fallback as Pages.

Directories with an index.html, such as the docs under /docs/, are served as they are."""
import argparse
import os
from http.server import SimpleHTTPRequestHandler,ThreadingHTTPServer
from pathlib import Path
from urllib.parse import urlparse

class Handler(SimpleHTTPRequestHandler):
    def do_GET(self):
        path=urlparse(self.path).path
        target=Path(self.translate_path(path))
        if not target.exists() and not Path(path).suffix:
            # Like Pages: /en is served from en.html, everything else falls back to the app.
            page=target.with_name(target.name+'.html')
            self.path=f'{path.rstrip("/")}.html' if page.is_file() else '/index.html'
        super().do_GET()

if __name__=='__main__':
    parser=argparse.ArgumentParser()
    parser.add_argument('--port',type=int,default=4173)
    args=parser.parse_args()
    os.chdir(Path(__file__).resolve().parents[1]/'build/web')
    print(f'Local: http://127.0.0.1:{args.port}',flush=True)
    ThreadingHTTPServer(('127.0.0.1',args.port),Handler).serve_forever()
