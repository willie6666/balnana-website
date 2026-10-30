// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'site_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class SiteLocalizationsZh extends SiteLocalizations {
  SiteLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get navFeatures => '功能';

  @override
  String get navDemo => '体验分账';

  @override
  String get navHosting => '自行部署';

  @override
  String get navFaq => '常见问题';

  @override
  String get navDocs => '文档';

  @override
  String get heroEyebrow => '开源自由，由你掌握。';

  @override
  String get heroTitle => '一起玩，\n轻松算清。';

  @override
  String get heroBody => '旅行、聚餐、合租，让共同开销一目了然。分账更轻松，数据也由你掌握。';

  @override
  String get tryDemo => '体验分账';

  @override
  String get selfHost => '自行部署 Balnana';

  @override
  String get development => '开发中 · Android 和 Web';

  @override
  String get trustSplit => '分法由你决定';

  @override
  String get trustLanguages => '20 种语言';

  @override
  String get trustOpen => '开源，没有广告';

  @override
  String get trustServer => '你的服务器';

  @override
  String get demoLabel => '一起试试看';

  @override
  String get demoTitle => '尽情安排，\n算账交给我们。';

  @override
  String get demoBody => '改个金额，选择付款人，看看账目如何平衡。';

  @override
  String get scenarioTravel => '旅行';

  @override
  String get scenarioHome => '合租';

  @override
  String get scenarioDinner => '聚餐';

  @override
  String get groupTravel => '京都周末';

  @override
  String get groupHome => '我们的公寓';

  @override
  String get groupDinner => '周五聚餐';

  @override
  String get demoNotice => '交互演示 · 虚构数据';

  @override
  String get payer => '谁先付款？';

  @override
  String get balances => '大家的余额';

  @override
  String get payments => '建议付款';

  @override
  String morePayments(int count) {
    return '还有 $count 笔';
  }

  @override
  String get reset => '重置演示';

  @override
  String get weightedHelp => 'Alex 分摊 2 份，其他人各 1 份。';

  @override
  String get featureLabel => '小细节，大不同';

  @override
  String get featureTitle => '少一点计算，\n多一点相聚。';

  @override
  String get featureSplitTitle => '公平，不一定要平均。';

  @override
  String get featureSplitBody => '均分、指定金额或按份数分摊，同一笔支出也能由多人付款。';

  @override
  String get featureSettleTitle => '结算，少一点麻烦。';

  @override
  String get featureSettleBody => '清楚看到谁该付给谁，通过结算建议减少转账次数。';

  @override
  String get travelLabel => '为下一趟旅行准备';

  @override
  String get travelTitle => '币种不同，\n好伙伴依旧。';

  @override
  String get travelBody => '保留原始币种，填入汇率或信用卡实际入账额。群组余额仍用同一种币种计算。';

  @override
  String get screenshotsNote => '真实 Android 界面 · 虚构数据 · 英文';

  @override
  String get screenshotExpenses => '每一笔开销';

  @override
  String get screenshotForeign => '原始币种';

  @override
  String get screenshotStats => '支出一目了然';

  @override
  String get extraTitle => '群组需要的，都想到了。';

  @override
  String get recurringTitle => '日常开销，自动接续。';

  @override
  String get recurringBody => '安排房租等周期性支出。';

  @override
  String get receiptsTitle => '把细节一起留下。';

  @override
  String get receiptsBody => '为支出附上收据，记录花费地点。';

  @override
  String get liveTitle => '大家看到同一本账。';

  @override
  String get liveBody => '其他人新增支出时，打开的群组会实时更新。';

  @override
  String get exportTitle => '账目，随你带走。';

  @override
  String get exportBody => '导出 CSV，也能从 Settle Up 导入群组。';

  @override
  String get hostingLabel => '你的伙伴，你的服务器';

  @override
  String get hostingTitle => '你的账目，\n由你做主。';

  @override
  String get hostingBody => '使用 Docker Compose 和 PostgreSQL 部署 Balnana。群组账目放在哪里，由你决定。';

  @override
  String get hostingLink => '阅读部署指南';

  @override
  String get hostingModeLink => '分享私人链接，链接模式无需注册。';

  @override
  String get hostingModeAccounts => '也能启用账户，以密码、Google 或 OIDC 登录。';

  @override
  String get faqTitle => '你可能想知道';

  @override
  String get faqAccountQ => '每个人都需要账户吗？';

  @override
  String get faqAccountA => '链接模式只需私人链接或二维码即可加入。账户模式则按服务器设置管理访问。';

  @override
  String get faqOfflineQ => '可以离线使用吗？';

  @override
  String get faqOfflineA => 'Android 在服务器无法连接时，仍能读取之前缓存的群组和支出。新增或修改支出需要网络。';

  @override
  String get faqCurrencyQ => '会自动获取汇率吗？';

  @override
  String get faqCurrencyA => '你可以自行输入汇率，或填写信用卡实际入账金额。Balnana 不会获取实时汇率。';

  @override
  String get faqPlatformQ => '支持哪些平台？';

  @override
  String get faqPlatformA => '目前支持 Android 和网页版，尚未提供 iOS 版本。';

  @override
  String get faqCostQ => 'Balnana 免费吗？';

  @override
  String get faqCostA => 'Balnana 是采用 AGPL-3.0 许可的开源软件，App 没有订阅费用；自行部署服务器仍可能产生主机费用。';

  @override
  String get endTitle => '下一场相聚，\n从这里开始。';

  @override
  String get endBody => '叫上你的伙伴，账目让我们一起算清。';

  @override
  String get github => '查看源代码';

  @override
  String get reportIssue => '报告问题';

  @override
  String get footerNote => '为分享而生的开源项目。';

  @override
  String get backHome => '返回首页';

  @override
  String get notFound => '这个页面不在这里。';

  @override
  String get screenshotOpen => '查看截图';

  @override
  String get settled => '所有人都已结清。';

  @override
  String get retry => '重试';

  @override
  String owed(String name) {
    return '$name 应收';
  }

  @override
  String get languageEndonym => '简体中文';

  @override
  String get languageLabel => '语言';

  @override
  String get themeLabel => '主题';

  @override
  String get themeSystem => '跟随系统';

  @override
  String get themeLight => '浅色';

  @override
  String get themeDark => '深色';

  @override
  String get amountLabel => '金额';

  @override
  String get splitEqual => '均分';

  @override
  String get splitShares => '按份额';

  @override
  String get cancel => '取消';

  @override
  String get invalidAmount => '请输入大于零的金额。';

  @override
  String get amountTooLarge => '金额过大。';
}

/// The translations for Chinese, using the Han script (`zh_Hant`).
class SiteLocalizationsZhHant extends SiteLocalizationsZh {
  SiteLocalizationsZhHant() : super('zh_Hant');

  @override
  String get navFeatures => '功能';

  @override
  String get navDemo => '體驗分帳';

  @override
  String get navHosting => '自行架設';

  @override
  String get navFaq => '常見問題';

  @override
  String get navDocs => '文件';

  @override
  String get heroEyebrow => '開源自由，由你掌握。';

  @override
  String get heroTitle => '一起玩，\n輕鬆算清。';

  @override
  String get heroBody => '旅行、聚餐、合租，讓共同開銷一目了然。分帳更輕鬆，資料也由你掌握。';

  @override
  String get tryDemo => '體驗分帳';

  @override
  String get selfHost => '自行架設 Balnana';

  @override
  String get development => '開發中 · Android 與 Web';

  @override
  String get trustSplit => '分法由你決定';

  @override
  String get trustLanguages => '20 個語系';

  @override
  String get trustOpen => '開源，沒有廣告';

  @override
  String get trustServer => '你的伺服器';

  @override
  String get demoLabel => '一起試試看';

  @override
  String get demoTitle => '盡情安排，\n算帳交給我們。';

  @override
  String get demoBody => '改個金額，選擇付款人，看看帳目如何平衡。';

  @override
  String get scenarioTravel => '旅行';

  @override
  String get scenarioHome => '合租';

  @override
  String get scenarioDinner => '聚餐';

  @override
  String get groupTravel => '京都週末';

  @override
  String get groupHome => '我們的公寓';

  @override
  String get groupDinner => '週五聚餐';

  @override
  String get demoNotice => '互動示範 · 虛構資料';

  @override
  String get payer => '誰先付款？';

  @override
  String get balances => '大家的餘額';

  @override
  String get payments => '建議付款';

  @override
  String morePayments(int count) {
    return '還有 $count 筆';
  }

  @override
  String get reset => '重設示範';

  @override
  String get weightedHelp => 'Alex 分攤 2 份，其他人各 1 份。';

  @override
  String get featureLabel => '小細節，大不同';

  @override
  String get featureTitle => '少一點計算，\n多一點相聚。';

  @override
  String get featureSplitTitle => '公平，不一定要平均。';

  @override
  String get featureSplitBody => '等分、指定金額或依份數分攤，同一筆支出也能由多人付款。';

  @override
  String get featureSettleTitle => '結算，少一點麻煩。';

  @override
  String get featureSettleBody => '清楚看見誰該付給誰，透過結算建議減少轉帳次數。';

  @override
  String get travelLabel => '為下一趟旅行準備';

  @override
  String get travelTitle => '幣別不同，\n好夥伴依舊。';

  @override
  String get travelBody => '保留原始幣別，填入匯率或信用卡實際入帳額。群組餘額依然用同一種幣別計算。';

  @override
  String get screenshotsNote => '真實 Android 介面 · 虛構資料 · 英文';

  @override
  String get screenshotExpenses => '每一筆開銷';

  @override
  String get screenshotForeign => '原始幣別';

  @override
  String get screenshotStats => '支出一目了然';

  @override
  String get extraTitle => '群組需要的，都想到了。';

  @override
  String get recurringTitle => '日常開銷，自動接續。';

  @override
  String get recurringBody => '排定房租等週期性支出。';

  @override
  String get receiptsTitle => '把細節一起留下。';

  @override
  String get receiptsBody => '為支出附上收據，記下花費地點。';

  @override
  String get liveTitle => '大家看到同一本帳。';

  @override
  String get liveBody => '其他人新增支出時，開啟中的群組會即時更新。';

  @override
  String get exportTitle => '帳目，隨你帶走。';

  @override
  String get exportBody => '匯出 CSV，也能從 Settle Up 匯入群組。';

  @override
  String get hostingLabel => '你的夥伴，你的伺服器';

  @override
  String get hostingTitle => '你的帳目，\n由你作主。';

  @override
  String get hostingBody => '使用 Docker Compose 與 PostgreSQL 架設 Balnana。群組帳目放在哪裡，由你決定。';

  @override
  String get hostingLink => '閱讀架設指南';

  @override
  String get hostingModeLink => '分享私人連結，連結模式無須註冊。';

  @override
  String get hostingModeAccounts => '也能啟用帳號，以密碼、Google 或 OIDC 登入。';

  @override
  String get faqTitle => '你可能想知道';

  @override
  String get faqAccountQ => '每個人都需要帳號嗎？';

  @override
  String get faqAccountA => '連結模式只要私人連結或 QR code 即可加入。帳號模式則依照伺服器設定管理存取。';

  @override
  String get faqOfflineQ => '可以離線使用嗎？';

  @override
  String get faqOfflineA => 'Android 在伺服器無法連線時，仍能讀取先前快取的群組與支出。新增或修改支出需要網路。';

  @override
  String get faqCurrencyQ => '會自動取得匯率嗎？';

  @override
  String get faqCurrencyA => '你可以自行輸入匯率，或填寫信用卡實際入帳金額。Balnana 不會抓取即時匯率。';

  @override
  String get faqPlatformQ => '支援哪些平台？';

  @override
  String get faqPlatformA => '目前支援 Android 與網頁版，尚未提供 iOS 版本。';

  @override
  String get faqCostQ => 'Balnana 免費嗎？';

  @override
  String get faqCostA => 'Balnana 是採 AGPL-3.0 授權的開源軟體，App 沒有訂閱費用；自行架設伺服器仍可能產生主機費用。';

  @override
  String get endTitle => '下一場相聚，\n從這裡開始。';

  @override
  String get endBody => '揪上你的夥伴，帳目讓我們一起算清。';

  @override
  String get github => '查看原始碼';

  @override
  String get reportIssue => '回報問題';

  @override
  String get footerNote => '為分享而生的開源專案。';

  @override
  String get backHome => '回到首頁';

  @override
  String get notFound => '這個頁面不在這裡。';

  @override
  String get screenshotOpen => '檢視截圖';

  @override
  String get settled => '所有人都已結清。';

  @override
  String get retry => '重試';

  @override
  String owed(String name) {
    return '$name 應收';
  }

  @override
  String get languageEndonym => '繁體中文';

  @override
  String get languageLabel => '語言';

  @override
  String get themeLabel => '主題';

  @override
  String get themeSystem => '依照系統';

  @override
  String get themeLight => '淺色';

  @override
  String get themeDark => '深色';

  @override
  String get amountLabel => '金額';

  @override
  String get splitEqual => '均分';

  @override
  String get splitShares => '份數';

  @override
  String get cancel => '取消';

  @override
  String get invalidAmount => '請輸入大於零的金額。';

  @override
  String get amountTooLarge => '金額太大。';
}
