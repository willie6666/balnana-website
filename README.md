# Balnana official website

以 Flutter Web 製作的 Balnana 官方介紹網站。暖白／香蕉黃與深色外觀、20 語系、響應式版型，以及純前端的分帳互動示範。

## 本機預覽

Flutter **3.47.8** / Dart **3.13.7**、Node.js **22.12+**、Python 3。依賴版本已記錄於 `pubspec.lock` 與 `docs-site/package-lock.json`。

```bash
flutter pub get
bash tool/build.sh
python3 tool/serve.py
```

開啟 `http://127.0.0.1:4173/zh-Hant`。若 Flutter 未加入 PATH，可用：

```bash
FLUTTER_BIN=/home/willie/flutter/bin/flutter bash tool/build.sh
```

開發時也可執行 `flutter run -d web-server`，依終端顯示的網址預覽。文件網站另外以 `cd docs-site && npm install && npm run dev` 預覽（`http://localhost:4321/docs/`）。這個專案只建立 Web 平台，不需要 Android 模擬器即可執行。

## 已實作

- 品牌首頁、功能介紹、真實 Android 截圖放大檢視、自架服務說明、FAQ 與原始碼連結。
- 旅行／合租／聚餐示範，可修改金額、切換付款人、等分／份數分攤與重設；以整數最小單位計算，產生可結清的建議付款。
- App 的全部 20 個語系；獨立 ARB 網站文案，包含阿拉伯文 RTL、繁體與簡體中文。
- 語系網址、瀏覽器上一頁／下一頁、區塊連結；根目錄依儲存選擇、瀏覽器語言、英文順序選語系。
- 系統／淺色／深色主題，偏好存於瀏覽器，載入畫面同步外觀。
- 真正的逐語系 HTML 入口 metadata、Open Graph、分享圖；提供正式網域後產生 canonical、hreflang、sitemap 與 robots。

網站示範不連帳目伺服器，不建立真正群組。產品仍標示開發中，沒有捏造商店下載連結。20 語系已補齊文案，但尚未經所有語言的母語使用者校稿。

## 文件網站（/docs）

使用者文件以 Markdown 撰寫，由 [Astro Starlight](https://starlight.astro.build/) 建置在 `docs-site/`，與 Flutter 首頁一起輸出到 `build/web/docs/`：

- 頁面放在 `docs-site/src/content/docs/`（英文）與 `docs-site/src/content/docs/zh-hant/`（繁體中文），側欄在 `docs-site/astro.config.mjs`。
- `docs-site/src/styles/brand.css` 套用與首頁相同的香蕉黃配色、Plus Jakarta Sans 字型與圓角；頁首的 balnana 標誌連回首頁。
- 深淺色偏好與首頁共用（`flutter.site.theme`），在任一邊切換，另一邊也會跟著。
- 新增頁面時兩種語言各寫一份，並加入側欄。

`dev-docs/` 則是本專案的開發紀錄（部署、QA、語系清單），不會發佈。

## 檢查與建置

```bash
python3 tool/check_locales.py
python3 -m unittest test_web_metadata.py
flutter analyze
flutter test
bash tool/build.sh
```

測試涵蓋整數分攤／餘額與結清、各語系金額輸入、20 語系的 360／390／768／1024／1440 寬度、320px + 200% 文字縮放、主題與語言保存，以及 metadata 生成。這些不是全面的螢幕閱讀器或所有瀏覽器相容性認證。

CI 定義於 `.github/workflows/ci.yml`：安裝固定 Flutter SDK 與 Node.js、檢查、測試、建置首頁與文件並保存網站產物；不會自動發佈。

## Cloudflare Pages

輸出資料夾為 `build/web`，依 [部署指南](dev-docs/DEPLOYMENT.md) 使用 Cloudflare Pages Direct Upload。尚未連接 Cloudflare 帳戶或實際部署。

沒有正式網域時，建置預設為 **preview / noindex**。正式上線前設定真實網域再建置：

```bash
SITE_URL=https://your-real-domain.example bash tool/build.sh
```

`SITE_URL` 必須是純 origin，不能包含子路徑、query 或帳密。站台以網域根目錄部署。Flutter 主介面仍有正文搜尋索引限制；metadata 與 sitemap 不代表完整 SEO。

## 原始碼結構

- `lib/core/`：語系、外觀偏好及網頁 metadata 同步。
- `lib/design/`：品牌、主題、可重用元件與 light/dark widget previews。
- `lib/features/demo/`：純計算模型與互動示範。
- `lib/features/home/`：首頁、導覽、功能、截圖、架設說明及 FAQ。
- `lib/l10n/`：20 份 ARB 與 Flutter 產生的本地化程式。
- `tool/`：建置、語系檢查、metadata 與本機預覽工具。
- `docs-site/`：Starlight 文件網站，發佈在 `/docs`。
- `dev-docs/`：部署指南、QA 紀錄與語系清單。
- `design/`：上一階段的靜態概念稿，保留供對照。

修改翻譯以 `lib/l10n/site_*.arb` 為準，再執行 `flutter gen-l10n`。

[驗證紀錄](dev-docs/QA.md) · [原始設計計畫](DESIGN_PLAN.md) · [素材來源與授權](NOTICE.md) · [部署指南](dev-docs/DEPLOYMENT.md)
