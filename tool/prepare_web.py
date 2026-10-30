"""Generate real per-locale entry documents after a Flutter web build."""
import argparse
import html
import json
import re
import shutil
from pathlib import Path
from urllib.parse import urlparse

ROOT=Path(__file__).resolve().parents[1]
# Open Graph wants language_TERRITORY; pick the region each translation is written for.
OG_LOCALES={'ar':'ar_AR','de':'de_DE','en':'en_US','es':'es_ES','fr':'fr_FR','hi':'hi_IN','id':'id_ID','it':'it_IT','ja':'ja_JP','ko':'ko_KR','nl':'nl_NL','pl':'pl_PL','pt':'pt_BR','ru':'ru_RU','th':'th_TH','tr':'tr_TR','uk':'uk_UA','vi':'vi_VN','zh':'zh_CN','zh-Hant':'zh_TW'}

def prepare(site_url=None, output=None):
    output=output or ROOT/'build/web'
    assert (output/'flutter_bootstrap.js').is_file(), 'Run a Flutter web build first.'
    template=(ROOT/'web/index.html').read_text().replace('$FLUTTER_BASE_HREF','/')
    locales={}
    for file in sorted((ROOT/'lib/l10n').glob('*.arb')):
        data=json.loads(file.read_text())
        locales[data['@@locale'].replace('_','-')]=data
    if site_url:
        parsed=urlparse(site_url)
        if parsed.scheme not in ['http','https'] or not parsed.netloc or parsed.path not in ['', '/'] or parsed.query or parsed.fragment or parsed.username or parsed.password:
            raise ValueError('SITE_URL must be an origin, e.g. https://balnana.example (no path or credentials)')
        site_url=site_url.rstrip('/')
    def document(tag,path):
        copy=locales[tag]
        title='Balnana — '+copy['heroTitle'].replace('\n',' ')
        description=copy['heroBody']
        content=re.sub(r'<html lang="[^"]*">',f'<html lang="{tag}" dir="{"rtl" if tag=="ar" else "ltr"}">',template)
        content=re.sub(r'<title>.*?</title>',f'<title>{html.escape(title)}</title>',content)
        for attr,name,value in [('name','description',description),('property','og:title',title),('property','og:description',description)]:
            content=re.sub(f'<meta {attr}="{name}" content="[^"]*">',f'<meta {attr}="{name}" content="{html.escape(value,quote=True)}">',content)
        content=content.replace('>Retry</button>',f'>{html.escape(copy["retry"])}</button>')
        content=re.sub(r'<noscript>.*?</noscript>',f'<noscript><style>#loading{{display:none}}</style><h1>{html.escape(title)}</h1><p>{html.escape(description)}</p><a href="https://github.com/willie6666/balnana">{html.escape(copy["github"])}</a></noscript>',content,flags=re.S)
        metadata=[f'<meta property="og:locale" content="{OG_LOCALES[tag]}">']
        if site_url:
            # The router drops trailing slashes, so /en (served from en.html) is the real URL.
            canonical=f'{site_url}{path}'
            metadata += [f'<link rel="canonical" href="{canonical}">',f'<meta property="og:url" content="{canonical}">']
            metadata += [f'<link rel="alternate" hreflang="{other}" href="{site_url}/{other}">' for other in locales]
            metadata.append(f'<link rel="alternate" hreflang="x-default" href="{site_url}/">')
            content=content.replace('content="/social-preview.png"',f'content="{site_url}/social-preview.png"')
        else:
            metadata.append('<meta name="robots" content="noindex, nofollow">')
        return content.replace('<!-- LOCALIZED_METADATA -->','\n'.join(metadata))
    for tag in locales:
        # Older builds wrote <tag>/index.html, which would make Pages redirect /en to /en/.
        shutil.rmtree(output/tag,ignore_errors=True)
        (output/f'{tag}.html').write_text(document(tag,f'/{tag}'))
    # The root picks the visitor's language in the app; it is the x-default entry.
    (output/'index.html').write_text(document('en','/'))
    if site_url:
        urls=''.join(f'<url><loc>{html.escape(site_url)}/{tag}</loc></url>' for tag in locales)
        (output/'sitemap.xml').write_text('<?xml version="1.0" encoding="UTF-8"?><urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">'+urls+'</urlset>')
        sitemaps=[f'{site_url}/sitemap.xml']
        if (output/'docs/sitemap-index.xml').is_file():
            sitemaps.append(f'{site_url}/docs/sitemap-index.xml')
        (output/'robots.txt').write_text('User-agent: *\nAllow: /\n'+''.join(f'Sitemap: {url}\n' for url in sitemaps))
    else:
        (output/'robots.txt').write_text('User-agent: *\nDisallow: /\n')
        (output/'sitemap.xml').unlink(missing_ok=True)
    print(f'Prepared {len(locales)} localized entry pages; '+('production metadata enabled.' if site_url else 'preview mode (noindex).'))

if __name__=='__main__':
    parser=argparse.ArgumentParser()
    parser.add_argument('--site-url')
    args=parser.parse_args()
    prepare(args.site_url)
