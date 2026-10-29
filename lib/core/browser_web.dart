import 'package:web/web.dart' as web;

void updateDocument(String tag, String title, String description, String theme) {
  web.document.documentElement?.setAttribute('lang', tag);
  web.document.documentElement?.setAttribute('dir', tag == 'ar' ? 'rtl' : 'ltr');
  web.document.documentElement?.setAttribute('data-theme', theme);
  web.document.title = title;
  web.document.querySelector('meta[name="description"]')?.setAttribute('content', description);
}
