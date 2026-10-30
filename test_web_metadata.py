import json
import tempfile
import unittest
from pathlib import Path
from tool.prepare_web import prepare

class MetadataTests(unittest.TestCase):
    def test_localized_pages_and_production_metadata_can_be_regenerated(self):
        with tempfile.TemporaryDirectory() as folder:
            output=Path(folder)
            (output/'flutter_bootstrap.js').touch()
            prepare(output=output)
            self.assertIn('noindex',(output/'ar.html').read_text())
            self.assertIn('lang="ar" dir="rtl"',(output/'ar.html').read_text())
            prepare('https://website.example',output)
            text=(output/'zh-Hant.html').read_text()
            self.assertIn('一起玩',text)
            self.assertIn('<link rel="canonical" href="https://website.example/zh-Hant">',text)
            self.assertIn('<meta property="og:locale" content="zh_TW">',text)
            self.assertIn('content="https://website.example/social-preview.png"',text)
            root=(output/'index.html').read_text()
            self.assertIn('<link rel="canonical" href="https://website.example/">',root)
            self.assertIn('hreflang="x-default" href="https://website.example/"',root)
            self.assertNotIn('noindex',text)
            self.assertEqual(text.count('hreflang='),21)
            self.assertEqual((output/'sitemap.xml').read_text().count('<url>'),20)
            self.assertIn('Sitemap:',(output/'robots.txt').read_text())
            self.assertNotIn('/docs/',(output/'robots.txt').read_text())
            (output/'docs').mkdir()
            (output/'docs/sitemap-index.xml').touch()
            prepare('https://website.example',output)
            self.assertIn('Sitemap: https://website.example/docs/sitemap-index.xml',(output/'robots.txt').read_text())
            prepare(output=output)
            self.assertNotIn('website.example',(output/'en.html').read_text())
            self.assertFalse((output/'sitemap.xml').exists())
    def test_rejects_non_origin_site_urls(self):
        with tempfile.TemporaryDirectory() as folder:
            output=Path(folder)
            (output/'flutter_bootstrap.js').touch()
            for url in ['javascript:alert(1)','https://example.com/path','https://user:pass@example.com','https://example.com?key=secret']:
                with self.assertRaises(ValueError):
                    prepare(url,output)

if __name__=='__main__': unittest.main()
