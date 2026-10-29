"""Generate static SVG design studies; this is not the Flutter website."""

import base64
import html
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parent
SOURCE = Path('/home/willie/storage/balnana')


def text(x, y, value, size=18, fill='ink', weight=400, **attrs):
    extra = ' '.join(f'{k.replace("_", "-")}="{v}"' for k, v in attrs.items())
    return (f'<text x="{x}" y="{y}" font-size="{size}" font-weight="{weight}" '
            f'fill="{PALETTE.get(fill, fill)}" {extra}>{html.escape(value)}</text>')


def rect(x, y, w, h, fill='panel', r=24, **attrs):
    extra = ' '.join(f'{k.replace("_", "-")}="{v}"' for k, v in attrs.items())
    return f'<rect x="{x}" y="{y}" width="{w}" height="{h}" rx="{r}" fill="{PALETTE.get(fill, fill)}" {extra}/>'


def circle(x, y, r, fill):
    return f'<circle cx="{x}" cy="{y}" r="{r}" fill="{PALETTE.get(fill, fill)}"/>'


def logo(x, y, scale=0.65):
    return (f'<g transform="translate({x} {y}) scale({scale})">'
            '<circle cx="36" cy="36" r="36" fill="#E8A800"/>'
            '<path transform="translate(-18 -18)" fill="#3A2C00" '
            'd="M51.5,33.131A24,24 0,0 0 51.5,80.869ZM56.5,27.131A24,24 0,0 1 56.5,74.869Z"/></g>')


def pill(x, y, label, width, primary=False, height=52, size=17):
    return (rect(x, y, width, height, 'yellow' if primary else 'panel2', height/2)
            + text(x+width/2, y+height/2+6, label, size, '#352900' if primary else 'ink', 700, text_anchor='middle'))


def avatar(x, y, label, color, r=21):
    return circle(x, y, r, color) + text(x, y+6, label, 17, '#FFFFFF', 700, text_anchor='middle')


def card(x, y, scale=1):
    parts = [f'<g transform="translate({x} {y}) scale({scale})">',
             rect(0, 0, 464, 466, 'panel', 32),
             text(28, 43, '京都週末', 25, weight=700),
             text(434, 41, '4 人', 14, 'muted', text_anchor='end'),
             rect(24, 66, 416, 112, 'accentSoft', 24),
             text(46, 101, '你將收到', 16, 'accentInk', 600),
             text(46, 151, '¥35,113', 45, 'accentInk', 800),
             text(28, 213, '大家的餘額', 15, 'muted', 600)]
    members = [('A', 'Alex', '+35,113', '#8A5A3C', 'green'),
               ('J', 'Jamie', '−10,287', '#8E5BC8', 'red'),
               ('M', 'Morgan', '−20,888', '#3E8EDE', 'red'),
               ('S', 'Sam', '−3,938', '#F07C2E', 'red')]
    for i, (initial, name, amount, color, semantic) in enumerate(members):
        xx = 56+i*115
        parts += [avatar(xx, 246, initial, color, 19),
                  text(xx, 283, name, 13, 'muted', text_anchor='middle'),
                  text(xx, 309, amount, 15, semantic, 700, text_anchor='middle')]
    parts += [rect(24, 334, 416, 106, 'panel2', 23),
              text(46, 367, '結算建議', 15, weight=700),
              avatar(66, 402, 'M', '#3E8EDE', 17),
              text(94, 408, '→', 21, 'muted'),
              avatar(140, 402, 'A', '#8A5A3C', 17),
              text(172, 408, '¥20,888', 21, weight=700),
              text(418, 408, '+ 2 筆', 14, 'muted', text_anchor='end'), '</g>']
    return ''.join(parts)


def screenshot(name, x, y, w, h, clip):
    path = SOURCE/'assets/screenshots'/f'{name}.png'
    uri = base64.b64encode(path.read_bytes()).decode()
    return (f'<defs><clipPath id="{clip}">{rect(x,y,w,h,"#FFF",18)}</clipPath></defs>'
            f'<image href="data:image/png;base64,{uri}" x="{x}" y="{y}" '
            f'width="{w}" height="{h}" preserveAspectRatio="xMidYMin slice" clip-path="url(#{clip})"/>')


def start(w, h, label):
    return [f'<svg xmlns="http://www.w3.org/2000/svg" width="{w}" height="{h}" viewBox="0 0 {w} {h}">',
            f'<title>{html.escape(label)}</title>',
            '<desc>Static website concept. The interface card is illustrative; embedded App screenshots contain fictional demo data.</desc>',
            '<style>text{font-family:"Plus Jakarta Sans","Noto Sans CJK TC",sans-serif} .number{font-variant-numeric:tabular-nums}</style>',
            rect(0, 0, w, h, 'bg', 0)]


def desktop(dark=False):
    label = 'DARK' if dark else 'LIGHT'
    p = start(1440, 1830, f'Balnana website concept — desktop {label.lower()}')
    p += [text(64, 35, f'BALNANA  /  WEBSITE CONCEPT  /  {label}', 12, 'muted', 700, letter_spacing=2),
          text(1376, 35, '2026.10 · 靜態視覺方向稿', 12, 'muted', text_anchor='end'),
          f'<path d="M1090 144 C1450 245 1300 696 1015 667" fill="none" stroke="{PALETTE["arc"]}" stroke-width="100" stroke-linecap="round"/>',
          logo(66, 76), text(126, 110, 'balnana', 29, weight=800),
          text(678, 106, '功能', 16, 'muted', 600), text(764, 106, '分帳示範', 16, 'muted', 600),
          text(892, 106, '自行架設 ↗', 16, 'muted', 600),
          pill(1068, 75, '繁體中文 ▾', 138, False, 46, 14),
          pill(1220, 75, '◐', 50, False, 46, 21),
          text(1290, 105, 'GitHub ↗', 14, weight=700),
          rect(96, 206, 267, 34, 'accentSoft', 17),
          text(113, 229, 'OPEN SOURCE · SELF-HOSTED', 11, 'accentInk', 800, letter_spacing=1.1),
          text(92, 346, '一起玩，', 91, weight=800),
          text(92, 456, '輕鬆算清。', 91, weight=800),
          text(100, 515, '旅行、聚餐、合租，讓共同開銷一目了然。', 20, 'muted'),
          text(100, 550, '分帳更輕鬆，資料也由你掌握。', 20, 'muted'),
          pill(98, 595, '體驗分帳  ↗', 183, True, 58),
          pill(295, 595, '自行架設', 156, False, 58),
          text(100, 686, '開發中 · Android 與 Web', 13, 'muted'),
          rect(806, 188, 224, 34, 'panel2', 17),
          text(824, 211, '示範資料 · 京都週末', 13, 'muted', 600),
          card(804, 238),
          rect(96, 752, 1248, 63, 'panel', 24),
          text(140, 791, '分帳方式，由你決定', 15, weight=700),
          text(459, 791, '20 個語系', 15, weight=700),
          text(744, 791, '開源 · 無 App 廣告', 15, weight=700),
          text(1084, 791, '你的伺服器', 15, weight=700),
          text(98, 915, '每筆都清楚，玩得更盡興。', 46, weight=800),
          text(100, 957, '從第一筆支出，到最後一筆結算。', 19, 'muted'),
          rect(96, 995, 748, 320, 'accentSoft', 32),
          text(130, 1044, '支出不一樣，分法也可以不一樣。', 25, 'accentInk', 700),
          text(132, 1078, '等分、指定金額、依份數，還能多人一起付款。', 16, 'accentInk'),
          pill(132, 1103, '旅行', 91, True, 39, 14),
          pill(233, 1103, '合租', 91, False, 39, 14),
          pill(334, 1103, '聚餐', 91, False, 39, 14)]
    rows = [('住宿', 'Alex 先付', '¥48,000'), ('晚餐', 'Jamie + Sam 付款', '¥14,400'), ('咖啡', 'Alex 先付', '¥1,800')]
    for i, (title, caption, amount) in enumerate(rows):
        yy=1165+i*42
        p += [rect(131, yy-20, 676, 37, 'bg', 12), text(149, yy+5, title, 14, weight=700),
              text(235, yy+5, caption, 13, 'muted'), text(786, yy+5, amount, 15, weight=700, text_anchor='end')]
    p += [rect(866, 995, 478, 150, 'panel', 32),
          text(897, 1040, '少一點轉帳，多一點輕鬆。', 23, weight=700),
          text(898, 1077, '清楚的餘額與結算建議。', 17, 'muted'),
          text(898, 1111, '此示範：4 人 → 3 筆建議付款', 14, 'accentText', 600),
          rect(866, 1165, 478, 150, 'panel', 32),
          text(897, 1211, '你的群組，你的伺服器。', 23, weight=700),
          text(898, 1248, '自行架設，掌握群組帳目。', 17, 'muted'),
          text(898, 1282, '認識自行架設  ↗', 14, 'accentText', 700),
          rect(96, 1353, 1248, 364, 'panel2', 32),
          text(132, 1417, '下一站，', 42, weight=800),
          text(132, 1472, '一起出發。', 42, weight=800),
          text(134, 1522, '不同幣別、收據、分類統計，', 17, 'muted'),
          text(134, 1552, '把旅行記憶和帳目都整理好。', 17, 'muted'),
          text(134, 1615, '真實 App 介面 · 虛構示範資料', 12, 'muted'),
          text(134, 1645, '截圖保留原始淺色外觀', 12, 'muted')]
    for i, name in enumerate(['expenses', 'foreign', 'statistics']):
        p.append(screenshot(name, 690+i*207, 1375, 180, 320, f'shot{i}'))
    p += [logo(97, 1765, 0.37), text(138, 1788, 'balnana', 20, weight=800),
          text(1344, 1787, 'Good times. Clear balances.', 16, 'muted', text_anchor='end'), '</svg>']
    (ROOT/f'home-desktop-{label.lower()}.svg').write_text(''.join(p))


def mobile():
    p=start(430, 1810, 'Balnana website concept — mobile')
    p += [text(24, 25, 'BALNANA / MOBILE CONCEPT', 9, 'muted', 700, letter_spacing=1.5),
          logo(24, 53, 0.5), text(71, 82, 'balnana', 25, weight=800),
          pill(279, 52, '語言', 60, False, 38, 12), pill(347, 52, '◐', 38, False, 38, 18),
          text(396, 79, '≡', 25, 'ink', text_anchor='middle'),
          rect(24, 137, 259, 31, 'accentSoft', 16),
          text(39, 158, 'OPEN SOURCE · SELF-HOSTED', 10, 'accentInk', 800, letter_spacing=1),
          text(20, 247, '一起玩，', 64, weight=800),
          text(20, 326, '輕鬆算清。', 64, weight=800),
          text(26, 373, '旅行、聚餐、合租，共同開銷一目了然。', 16, 'muted'),
          text(26, 404, '分帳更輕鬆，資料也由你掌握。', 16, 'muted'),
          pill(24, 439, '體驗分帳 ↗', 181, True, 53, 16),
          pill(217, 439, '自行架設', 167, False, 53, 16),
          text(26, 523, '開發中 · Android 與 Web · 20 個語系', 12, 'muted'),
          f'<path d="M298 569 C450 619 391 966 191 944" fill="none" stroke="{PALETTE["arc"]}" stroke-width="40" stroke-linecap="round"/>',
          text(26, 573, '示範資料 · 京都週末', 12, 'muted'),
          card(24, 592, 0.824),
          text(25, 1041, '一起分帳，很簡單。', 32, weight=800),
          text(26, 1077, '從第一筆支出，到最後一筆結算。', 15, 'muted'),
          rect(24, 1105, 382, 170, 'accentSoft', 28),
          text(47, 1147, '分法，由你決定。', 24, 'accentInk', 700),
          text(48, 1180, '等分、指定金額，或依份數分攤。', 15, 'accentInk'),
          pill(47, 1206, '旅行', 94, True, 40, 14),
          pill(151, 1206, '合租', 94, False, 40, 14),
          pill(255, 1206, '聚餐', 94, False, 40, 14),
          rect(24, 1293, 382, 139, 'panel', 28),
          text(47, 1336, '結算，少一點麻煩。', 24, weight=700),
          text(48, 1370, '各人餘額與建議付款，一眼就懂。', 15, 'muted'),
          text(48, 1406, '此示範：4 人 → 3 筆建議付款', 13, 'accentText', 600),
          rect(24, 1450, 382, 139, 'panel', 28),
          text(47, 1493, '你的群組，你的伺服器。', 23, weight=700),
          text(48, 1527, '開源、自行架設，掌握自己的帳目。', 15, 'muted'),
          text(48, 1563, '認識自行架設  ↗', 13, 'accentText', 700),
          rect(24, 1618, 382, 130, 'panel2', 28),
          text(48, 1662, '下一站，一起出發。', 25, weight=800),
          text(48, 1707, 'Good times. Clear balances.', 17, 'muted'),
          text(24, 1782, '靜態概念稿 · 示範卡為官網示意介面', 11, 'muted'), '</svg>']
    (ROOT/'home-mobile.svg').write_text(''.join(p))


LIGHT = dict(bg='#FCF9F4', ink='#24251E', muted='#66655C', yellow='#E8A800', panel='#F3EFE6',
             panel2='#EAE6DC', accentSoft='#F8E3AD', accentInk='#4D3900', accentText='#765800',
             arc='#F2D477', green='#1E7A46', red='#B42318')
DARK = dict(bg='#191A16', ink='#F3F0E7', muted='#C1BEB3', yellow='#E8A800', panel='#252620',
            panel2='#31322A', accentSoft='#51431E', accentInk='#F8DF9A', accentText='#ECCA6E',
            arc='#51431E', green='#7FD8A0', red='#FFB4A8')

PALETTE=LIGHT
desktop()
mobile()
PALETTE=DARK
desktop(True)

inventory=[]
for path in sorted((SOURCE/'app/lib/l10n').glob('*.arb')):
    data=json.loads(path.read_text())
    locale=path.stem.removeprefix('app_')
    inventory.append(dict(app_locale=locale, web_tag=locale.replace('_','-'),
                          endonym=data['languageEndonym'],
                          message_count=len([k for k in data if not k.startswith('@')])))
(ROOT.parent/'docs/locale-inventory.json').write_text(json.dumps(dict(
    inspected_on='2026-10-30', source_project=str(SOURCE), source_commit='c869ad9',
    locale_count=len(inventory), locales=inventory), ensure_ascii=False, indent=2)+'\n')
print('Generated three SVG concepts and the locale inventory.')
