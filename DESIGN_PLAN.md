# Balnana 官方網站設計計畫

日期：2026-10-30 · 本文件保留原始設計提案。Flutter 官網已開始實作，最新功能、驗證與執行方式見 [README](README.md)；尚未部署。

研究來源：`/home/willie/storage/balnana`，commit `c869ad9`。本計畫以 README、實作程式、`docs/DESIGN.md`、`docs/PLAN.md`、ARB 語言檔與既有 Android 示範截圖為依據。

## 1. 目標與定位

讓第一次認識 Balnana 的人，在第一屏理解三件事：這是團體分帳工具、可以減少結算時的轉帳、資料放在自己管理的伺服器。

優先使用情境：朋友旅行、室友合租、聚餐與日常共同開銷。第二層受眾是想為朋友或家庭自行架設服務的人。

建議品牌主張：

> **一起玩，輕鬆算清。**
>
> 旅行、聚餐、合租，讓 Balnana 整理共同開銷、算清彼此餘額。
> 分帳更輕鬆，資料也由你掌握。

英文方向：**Good times. Clear balances.**

目標是讓訪客願意操作分帳示範，再了解如何自行架設與取得 App。專案目前 README 標示為早期開發、準備首次發佈；首次官網應如實標示開發狀態。

## 2. 視覺方向：Warm balance

保留 App 的品牌辨識，轉成適合網頁的大尺度排版。

| 元素 | 設計規則 |
| --- | --- |
| 主色 | 沿用香蕉黃 seed `#E8A800`，重點放在主按鈕、選取狀態與圖形 |
| 淺色 | 暖白背景、米色層次、深褐黑文字，避免滿版高飽和黃 |
| 深色 | 暖炭黑背景、低明度表面、柔和金黃重點；依 App 暗色方案產生色階 |
| 字型 | 沿用 Plus Jakarta Sans；中文與其他文字系統補適當 fallback |
| 造型 | 16 / 24 / 32 圓角、膠囊按鈕、圓形人物 initials、清楚的數字 |
| 語意色 | 沿用應收綠、應付紅；同時有正負號與文字說明 |
| 留白 | 桌面較大段落間距；內容寬約 1200px，長文閱讀欄約 720px |
| 品牌圖形 | 從原有 Logo 的雙半圓延伸成香蕉弧線，串連「支出 → 餘額 → 結清」 |
| 圖像 | 真實介面與示範資料為主；重點人物用 App 的 initials 圓形頭像 |

概念稿：

- [桌面淺色](design/home-desktop-light.png)
- [桌面深色](design/home-desktop-dark.png)
- [手機版](design/home-mobile.png)

這些是靜態方向稿，文案、數字與卡片供評估視覺層次；不是已完成的 Flutter 元件。稿上的深色卡片是依 App 風格繪製的官網示範，不是實機深色截圖。顏色與字型 fallback 在 Flutter 第一版再與真實主題逐項比對。

## 3. 首頁內容與互動

| 順序 | 區塊 | 內容與目的 |
| --- | --- | --- |
| 1 | 頂部導覽 | Logo、功能、分帳示範、自行架設、GitHub、語言、外觀；手機保留語言/外觀入口，其餘收進選單 |
| 2 | Hero | 大標題、簡短說明；主 CTA「體驗分帳」移至本頁互動示範，次 CTA「自行架設」移至架設區 |
| 3 | 信任資訊列 | 開源、自行架設、無 App 廣告；Android + Web；開發中標記放在 CTA 附近 |
| 4 | 情境式分帳示範 | 旅行 / 合租 / 聚餐切換；呈現支出、各人餘額、建議轉帳。訪客可改一個付款人或金額，看結果更新 |
| 5 | 三個主要優點 | 彈性分攤、清楚結算、資料自主管理；用不同寬度的展示面板，避免重複小卡堆疊 |
| 6 | 一起去旅行 | 以京都週末為故事：支出列表、不同幣別、分類統計；桌面圖文交錯、手機垂直排列 |
| 7 | 完整功能 | 多人付款、等分/指定金額/份數、週期性支出、收據與地點、即時更新、匯入匯出 |
| 8 | 你的群組，你的伺服器 | 簡圖說明 Android / Web 連至自己的 Balnana 伺服器；區分免註冊連結模式與帳號模式 |
| 9 | 開始使用 | 一般使用者加入已架設服務；自行架設者開啟完整文件。首次上線以原始碼/架設文件為真實目的地 |
| 10 | FAQ | 是否需帳號、能否離線、匯率如何處理、是否免費、是否支援 iOS、官網與資料伺服器的關係 |
| 11 | Footer | 原始碼、問題回報、架設說明、授權資訊、專案狀態 |

### 展示的創意細節

- **帳目收攏動態**：用人物間的弧線轉換為建議付款路徑，視覺化結算。只表達此示範的付款關係，不暗示演算法保證數學最少筆數。
- **情境一起換**：切換旅行/合租/聚餐時，更換帳本名稱、分類、幣別與文案，維持同一套操作方式。
- **主題即時預覽**：切換網站深淺色時，Flutter 繪製的展示卡同步變色；真實截圖若無對應暗色版，保留真實外觀並註明。
- **幣別小故事**：原始 USD 支出與 JPY 入帳並排，以實際填入的匯率/入帳金額解釋，不做即時匯率假象。
- **輕微入場**：150 / 300 / 450ms 為基礎；不用持續旋轉、強制視差或捲動劫持。遵循系統減少動畫設定。

### 分帳互動的資料規則

這是純前端示範，不連使用者的 Balnana 伺服器、不建立真實群組。

第一版用四個虛構人物與少量可編輯支出，只支援目前產品已具備的分攤方式。金額使用整數最小單位或 BigInt；總支出、付款、分攤、餘額、建議付款必須一致。金額輸入錯誤以原位訊息顯示；示範設重設動作。

可先用固定 fixture 完成視覺，再加入即時計算。互動只能宣稱已在官網實作且通過測試的行為。

## 4. 功能文案與實作核對

| 官網可介紹的內容 | 依據 | 必須保留的界線 |
| --- | --- | --- |
| 等分、指定金額、依份數分攤；多人付款 | `app/lib/features/expense/expense_editor_page.dart`、domain split | 不加入未實作的百分比分攤模式 |
| 結算建議減少轉帳 | `docs/PLAN.md`、`server/internal/domain/` | n 個非零餘額最多 n−1 筆；不宣稱全域最少 |
| 外幣支出、群組統一幣別 | expense editor、`docs/PLAN.md` | 手動匯率或實際入帳額；不抓即時匯率；週期支出與轉帳用群組幣別 |
| Android 離線查看 | `app/lib/core/offline_cache.dart` | 已快取的資料、唯讀；不宣稱離線新增/同步寫入，也不宣稱 Web 離線 |
| 分享連結或 QR code | `app/lib/features/group/share_sheet.dart` | 免註冊適用連結模式；帳號模式受伺服器與群組設定影響 |
| 密碼、Google、OIDC 登入 | account features、server configuration | 由架設者啟用，不保證每個公開伺服器都有 |
| 即時更新、Android UnifiedPush | live / push implementation | Web 推播尚未實作；通知依伺服器與裝置配置 |
| 分類/成員/月份統計 | `app/lib/features/group/spending_tab.dart` | 真實介面目前是長條圖；不把概念圖描述成已實作圓餅圖 |
| CSV 匯出、Settle Up 匯入 | import page、API、`docs/PLAN.md` | 不宣稱所有同類 App 格式皆可匯入 |
| 週期性支出、收據、地點 | recurring page、receipt / location | 地圖與服務設定由架設者管理 |
| 自行架設、開源 | README、`docs/SELF_HOSTING.md` | 雲端/主機仍可能有成本；不說資料端到端加密或完全沒有第三方連線 |
| Android 與 Web | README、pubspec、平台目錄 | 不放未驗證的 iOS / App Store / Play 商店下載徽章 |

下載連結、版本號、線上示範主機與實際網域目前不預設。第一版用確定存在的 [GitHub 專案](https://github.com/willie6666/balnana) 及其架設說明；正式發佈時再核實 release assets 與相容性。

## 5. 多語系：與 App 一致的 20 個語系

已核對 20 份 ARB，每份目前有 784 個非 metadata 訊息項目。網站需要獨立撰寫行銷文案，不能把 App 的 UI 翻譯直接視為官網翻譯。

| App locale | 網址 tag | 語言選單名稱 |
| --- | --- | --- |
| `en` | `en` | English |
| `zh` | `zh` | 简体中文 |
| `zh_Hant` | `zh-Hant` | 繁體中文 |
| `ja` | `ja` | 日本語 |
| `ko` | `ko` | 한국어 |
| `es` | `es` | Español |
| `fr` | `fr` | Français |
| `de` | `de` | Deutsch |
| `pt` | `pt` | Português |
| `it` | `it` | Italiano |
| `ru` | `ru` | Русский |
| `uk` | `uk` | Українська |
| `pl` | `pl` | Polski |
| `nl` | `nl` | Nederlands |
| `tr` | `tr` | Türkçe |
| `vi` | `vi` | Tiếng Việt |
| `id` | `id` | Bahasa Indonesia |
| `th` | `th` | ไทย |
| `ar` | `ar` | العربية |
| `hi` | `hi` | हिन्दी |

規則：

- 使用 Flutter 官方 ARB / `gen-l10n` 流程，英文為 template，翻譯涵蓋所有可見文字、無障礙標籤、FAQ、錯誤訊息及分享 metadata。
- 首次到根目錄：明確 URL 語系 > 已儲存語系 > 瀏覽器偏好 > 英文。具語系的分享網址優先，不因裝置設定自動覆蓋。
- `zh-TW`、`zh-HK`、`zh-MO` 對應 `zh-Hant`；`zh-CN` 與無 script 的一般 `zh` 對應簡體，與 App 邏輯一致。
- 語言選單顯示原文名稱，不用國旗；桌面選單支援捲動/搜尋，手機使用 sheet。
- 阿拉伯文採 RTL，使用 directional padding/alignment；貨幣碼、網址與程式碼維持正確 LTR 顯示。
- 使用區域化日期/數字格式，不強行把 JPY 示範資料轉成使用者當地幣別。
- 不一次載入全部文字系統的大型字型；先驗證系統 fallback 與逐語系必要的 font subsets。
- CI 比對官網語系列表與可取得的 App locale inventory，檢查缺字串、placeholder 及 plural；20 語系 smoke check 不等於母語校稿。

## 6. 外觀、版型與無障礙

外觀選項：**跟隨系統 / 淺色 / 深色**。首次跟隨系統，明確選擇保存在瀏覽器；系統模式須即時回應瀏覽器外觀變更。載入畫面與 Flutter 使用同一選擇，避免白屏閃爍。

| 寬度 | 版型 |
| --- | --- |
| 360–599 | 單欄，Hero 文字先於示範卡；CTA 可換行；無強制橫向滑動 |
| 600–959 | 混合一/兩欄，導覽收合，展示卡不超出內容欄 |
| 960 以上 | Hero 雙欄，功能圖文交錯，頁面內容有最大寬度 |

驗收涵蓋 360 / 390 / 768 / 1024 / 1440；補 320px 溢位檢查。長德文、阿拉伯文、泰文與 200% 文字縮放不得遮擋 CTA。文字不轉成圖片。

以 WCAG AA 對比、可見鍵盤焦點、合理閱讀順序、至少 48px 主要操作目標為設計驗收目標；使用 Flutter Semantics 驗證螢幕閱讀器。數值同時有文字、正負號，不能只靠紅綠。這是待驗證目標，不宣稱現有 App 或概念稿已全面通過。

## 7. Flutter 實作架構

官網獨立放在 `/home/willie/storage/balnana-offical-web`，維持純前端、可靜態部署。採用與 App 相容、鎖定版本的 Flutter SDK；正式開始實作時從 SDK 與 pubspec 確認套件版本。

建議結構：

```text
lib/
  app.dart
  core/          # appearance, locale, navigation, persisted preferences
  design/        # theme, typography, spacing, motion, reusable controls
  features/
    home/        # hero, benefits, travel story, FAQ, getting started
    demo/        # fixtures, integer calculations, scenario UI
  l10n/          # site_en.arb + all 19 translations
assets/
  brand/
  screenshots/
  fonts/
web/             # bootstrap, metadata, icons, hosting headers
tool/            # locale inventory checks, metadata/sitemap generation
test/            # demo maths, locale/theme persistence, critical layout checks
```

品牌 token、Logo 與 OFL 字型可沿用，但不將原 App 全部業務程式引入官網。網站不需 PostgreSQL、Go API、認證或真實帳目資料。示範計算只抽取必要的純函式或有共同測試向量的精簡實作；涉及原碼重用時保留授權與出處。

網址方向：`/en/`、`/zh-Hant/` 等語系路徑；首頁段落可用可分享的 section 狀態，實作時驗證返回/前進/重新整理與捲動定位。未知路徑顯示有導覽的找不到頁面，未知語系合理 fallback，不能把所有錯誤路徑當作正確語系首頁。

## 8. Cloudflare Pages 部署方案

Flutter 官網先建置成靜態產物，再部署到 Pages；官方建置輸出為 `build/web`。這是依 Flutter 與 Cloudflare 的靜態部署能力組合出的方案，不假設 Cloudflare 內建 Flutter preset。

建議流程：

1. 本機完成 Flutter QA，鎖定 SDK 與依賴。
2. CI 執行語系檢查、必要測試、`flutter analyze`、`flutter build web --release`。
3. 將 metadata、sitemap、robots 與需要的 hosting 檔案放入最終輸出，確認語系路徑與靜態資源可解析。
4. 以 Cloudflare Pages Direct Upload 部署同一份 `build/web` 產物；可由 CI 管理建置，後續再配置網域。
5. 正式網域與帳戶資訊由實際設定提供；preview 與 production 的 canonical/noindex 分開驗證。

備選是 Pages Git integration 加明確的 Flutter SDK 安裝/建置步驟。建立 Pages 專案前決定採哪一種：Cloudflare 說明 Direct Upload 專案之後不能直接切成 Git integration，需新建專案。

不要將 Balnana 帳目伺服器放進官網部署：Go + PostgreSQL 的自架服務繼續獨立運作。

部署驗收：

- 語系深層路徑可直接開啟與重新整理；遵循 Pages SPA fallback 規則，若加入 root `404.html`，必須重新確認路由策略。
- 預設先採 Pages 的快取機制，不替未帶內容雜湊的 JS/HTML 套上長期 immutable cache；連續部署後驗證不會混用版本。
- 檢查手機首屏、字型、Flutter engine/JS/Wasm 的請求體積與啟動時間，再決定是否採 Wasm；不因桌面流暢就宣告手機通過。
- 截圖準備適當解析度與壓縮，第二屏以下延後載入；不在首屏預載四張完整實機大圖。
- 檢查 404、外部連結、分享縮圖、所有語系與兩種主題。

## 9. 搜尋與分享的實際限制

Flutter 官方說明其 Web 輸出偏向互動 App，搜尋引擎不容易像一般文件型 HTML 一樣索引內容。因此採 Flutter 能滿足品牌與互動需求，但不能把它當作完整的 SEO 解法。

在維持 Flutter 主介面的前提下，第一版先做：逐語系實體入口頁的 title/description、`lang`/`dir`、canonical、hreflang、Open Graph/Twitter metadata、可公開網址、sitemap 與真實可讀的載入/錯誤狀態。網址與 metadata 在建置時產生；只在 Flutter 啟動後修改 head 不足以支援多數分享預覽機器人。

這些措施改善分享與基本發現，不保證完整正文被索引；Semantics 也不能直接當作 SEO。若後續把自然搜尋列為主要流量來源，再評估公開 HTML 內容層或文章頁與 Flutter 互動嵌入的組合，另行決定範圍，不在此階段擅自更換技術。

## 10. 實作順序與完成標準

| 階段 | 交付內容 | 完成標準 |
| --- | --- | --- |
| A — 設計基準 | 本計畫、locale inventory、桌面/手機深淺色方向稿 | 功能主張有依據、資訊架構清楚、視覺可評估 |
| B — Flutter 首頁 | Theme、響應式導覽、Hero、展示卡、主要內容，先完成英文與繁中 | 桌面/手機可操作；外觀與語言可保存；沒有假 CTA |
| C — 互動與素材 | 分帳示範、完整功能/FAQ、兩種主題實機素材 | 計算正確、重設可用；所有展示資料為虛構；真實截圖有出處 |
| D — 全語系與 QA | 20 語系、RTL、縮放、鍵盤/讀屏、效能與 build | 缺譯檢查通過；各語系可切換；重要版型無溢位 |
| E — Pages 上線準備 | CI、靜態產物、metadata、快取/路由驗證、部署說明 | 可重現 release build 與可部署的 `build/web`；實際部署待後續工作 |

第一輪實作先集中完成桌面及手機的 Hero + 一個可用示範，再向下完成頁面。不要先翻譯 20 份尚未定稿的長文。

尚待後續確定的產品資訊：正式網域、已發佈的 Android 安裝來源、是否有公開示範伺服器、問題回報/聯絡入口。這些不阻礙設計與本機實作；使用可配置的真實 GitHub 入口即可先完成第一版。

## 11. 研究與素材

- App 品牌：`app/lib/ui/theme.dart`、`colors.dart`、`tokens.dart`、`app/web/icons/logo.svg`。
- 功能/限制：README、`docs/PLAN.md`、`docs/SELF_HOSTING.md` 與對應實作。
- 20 語系來源：`app/lib/l10n/app_*.arb`、`app_localizations.dart`；快照見 [locale-inventory.json](dev-docs/locale-inventory.json)。
- 既有示範截圖：`assets/screenshots/{expenses,balances,statistics,foreign}.png`，README 明確標示為虛構資料。
- 2026-10-30 模擬器觀察：目前前景為 `me.devvillie.balnana`，畫面為 Group not found，不能直接用作首頁功能圖；未更動群組、語言或主題。後續重新連至專用 demo server 再補拍。
- 沿用 App 字型需保留 OFL；沿用原碼/品牌素材需核對原專案 AGPL-3.0-only 與相關素材授權，網站自己的使用條款/隱私說明應描述網站實際行為。

## 12. 文件查核

2026-10-30 以 Context7 CLI 查詢官方 Flutter 文件，並核對以下官方頁面：

- [Flutter Web FAQ：適用情境與 SEO](https://docs.flutter.dev/platform-integration/web/faq)
- [Flutter Web 建置與部署](https://docs.flutter.dev/deployment/web)
- [Flutter 國際化](https://docs.flutter.dev/ui/internationalization)
- [Cloudflare Pages Direct Upload](https://developers.cloudflare.com/pages/get-started/direct-upload/)
- [Cloudflare Pages 建置設定](https://developers.cloudflare.com/pages/configuration/build-configuration/)
- [Cloudflare Pages SPA、路由與快取](https://developers.cloudflare.com/pages/configuration/serving-pages/)

本階段只完成設計文件與靜態視覺稿；沒有宣稱 Flutter build、互動測試、全語系翻譯或線上部署已完成。
