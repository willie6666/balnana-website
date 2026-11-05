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
  String get navDemo => '试算一下';

  @override
  String get navHosting => 'Self-host';

  @override
  String get navFaq => '常见问题';

  @override
  String get navDocs => 'Docs';

  @override
  String get heroEyebrow => '开源分账 App';

  @override
  String get heroTitle => '一起花的钱，\n一笔笔算清楚。';

  @override
  String get heroBody => '朋友出游、室友分房租，先把谁付了多少记下来。Balnana 会算好每个人该出多少、最后要付给谁。';

  @override
  String get tryDemo => '试算一下';

  @override
  String get selfHost => 'Self-host';

  @override
  String get development => '开发中 · Android 和 Web';

  @override
  String get trustSplit => '多种分账方式';

  @override
  String get trustLanguages => '支持 20 种语言';

  @override
  String get trustOpen => '开源、无广告';

  @override
  String get trustServer => '可用自己的服务器';

  @override
  String get demoLabel => '分账演示';

  @override
  String get demoTitle => '先试试看，\n这笔要怎么分。';

  @override
  String get demoBody => '改改金额、换个付款人，或调整每个人的份数，下方会跟着重新计算。';

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
  String get demoNotice => '这是演示数据，可以随意调整';

  @override
  String get payer => '谁先付款？';

  @override
  String get balances => '每个人的余额';

  @override
  String get payments => '谁要付给谁';

  @override
  String morePayments(int count) {
    return '还有 $count 笔';
  }

  @override
  String get reset => '重置演示';

  @override
  String get weightedHelp => '调整每个人要分几份，设成 0 就不用分这笔。';

  @override
  String fewerShares(String name) {
    return '$name 减少一份';
  }

  @override
  String moreShares(String name) {
    return '$name 增加一份';
  }

  @override
  String get featureLabel => '分账方式';

  @override
  String get featureTitle => '不用每笔钱\n都平均分。';

  @override
  String get featureSplitTitle => '平分、按金额，或按份数';

  @override
  String get featureSplitBody => '吃得比较少就少付一点，或直接填好每个人的金额。同一笔支出也能记录多位付款人。';

  @override
  String get featureSettleTitle => '算好谁要付给谁';

  @override
  String get featureSettleBody => '结算时会列出建议的付款方式，让大家少转几笔账。';

  @override
  String get travelLabel => '出国也能用';

  @override
  String get travelTitle => '不同币种，\n记在同一个群组。';

  @override
  String get travelBody => '用什么币种付款就记什么币种，再填入汇率或信用卡实际入账金额。结算时，统一用群组设置的币种。';

  @override
  String get screenshotsNote => 'Android App 实际画面，使用英文和演示数据';

  @override
  String get screenshotExpenses => '支出记录';

  @override
  String get screenshotForeign => '外币支出';

  @override
  String get screenshotStats => '支出统计';

  @override
  String get extraTitle => '还有这些常用功能';

  @override
  String get recurringTitle => '定期支出';

  @override
  String get recurringBody => '设置房租等固定支出，不用每次重新添加。';

  @override
  String get receiptsTitle => '收据与地点';

  @override
  String get receiptsBody => '把收据附在支出里，之后对账比较好找，也能记下消费地点。';

  @override
  String get liveTitle => '实时更新';

  @override
  String get liveBody => '群组开着时，其他人添加的支出会实时出现。';

  @override
  String get exportTitle => '导入与导出';

  @override
  String get exportBody => '账目可以导出成 CSV。原本用 Settle Up 的话，也能把群组导入。';

  @override
  String get hostingLabel => 'Self-host';

  @override
  String get hostingTitle => '用自己的服务器，\n和朋友一起记账。';

  @override
  String get hostingBody =>
      '用 Docker Compose 启动 Balnana，账目会保存在你服务器上的 PostgreSQL 数据库。设置步骤都放在 Docs 里。';

  @override
  String get hostingLink => 'Self-host 指南';

  @override
  String get hostingModeLink => '只想分享链接？用私人链接或二维码就能加入，不用注册。';

  @override
  String get hostingModeAccounts => '想用账号管理，也能开启密码、Google 或 OIDC 登录。';

  @override
  String get faqTitle => '你可能会想问';

  @override
  String get faqAccountQ => '每个人都需要账号吗？';

  @override
  String get faqAccountA => '使用链接模式时，有私人链接或二维码就能加入，不用注册。账号模式则需要登录，加入方式取决于服务器设置。';

  @override
  String get faqOfflineQ => '可以离线使用吗？';

  @override
  String get faqOfflineA => 'Android 可以离线查看已缓存的账目，也能先添加支出和转账，连上服务器后再上传。修改已有支出和上传收据仍需要联网。';

  @override
  String get faqCurrencyQ => '会自动获取汇率吗？';

  @override
  String get faqCurrencyA => '服务器开启汇率查询时，选外币会先填入参考汇率。你也可以改成自己的汇率，或填信用卡实际入账金额。';

  @override
  String get faqPlatformQ => '支持哪些平台？';

  @override
  String get faqPlatformA => '目前有 Android 和网页版，还没有 iOS App。';

  @override
  String get faqCostQ => 'Balnana 免费吗？';

  @override
  String get faqCostA => 'Balnana 开源，采用 AGPL-3.0 许可证，App 本身不用付订阅费。Self-host 的主机费用则要自己承担。';

  @override
  String get endTitle => '想试试吗？';

  @override
  String get endBody => '跟着 Docs 把 Balnana 跑起来，再邀朋友一起记账。';

  @override
  String get github => '查看源代码';

  @override
  String get reportIssue => '报告问题';

  @override
  String get footerNote => 'Balnana，一个开源的分账 App。';

  @override
  String get backHome => '返回首页';

  @override
  String get notFound => '找不到这个页面。';

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
  String get navDemo => '試算看看';

  @override
  String get navHosting => 'Self-host';

  @override
  String get navFaq => '常見問題';

  @override
  String get navDocs => 'Docs';

  @override
  String get heroEyebrow => '開源分帳 App';

  @override
  String get heroTitle => '一起花的錢，\n一筆筆算清楚。';

  @override
  String get heroBody => '朋友出遊、室友分房租，先把誰付了多少記下來。Balnana 會算好每個人該出多少、最後要付給誰。';

  @override
  String get tryDemo => '試算看看';

  @override
  String get selfHost => 'Self-host';

  @override
  String get development => '開發中 · Android 與 Web';

  @override
  String get trustSplit => '多種分帳方式';

  @override
  String get trustLanguages => '支援 20 種語言';

  @override
  String get trustOpen => '開源、無廣告';

  @override
  String get trustServer => '可用自己的伺服器';

  @override
  String get demoLabel => '分帳示範';

  @override
  String get demoTitle => '先試試看，\n這筆要怎麼分。';

  @override
  String get demoBody => '改改金額、換個付款人，或調整每個人的份數，下方會跟著重新計算。';

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
  String get demoNotice => '這是示範資料，可以隨意調整';

  @override
  String get payer => '誰先付款？';

  @override
  String get balances => '每個人的餘額';

  @override
  String get payments => '誰要付給誰';

  @override
  String morePayments(int count) {
    return '還有 $count 筆';
  }

  @override
  String get reset => '重設示範';

  @override
  String get weightedHelp => '調整每個人要分幾份，設成 0 就不用分這筆。';

  @override
  String fewerShares(String name) {
    return '$name 減少一份';
  }

  @override
  String moreShares(String name) {
    return '$name 增加一份';
  }

  @override
  String get featureLabel => '分帳方式';

  @override
  String get featureTitle => '不用每筆錢\n都平均分。';

  @override
  String get featureSplitTitle => '平分、按金額，或按份數';

  @override
  String get featureSplitBody => '吃得比較少就少付一點，或直接填好每個人的金額。同一筆支出也能記錄多位付款人。';

  @override
  String get featureSettleTitle => '算好誰要付給誰';

  @override
  String get featureSettleBody => '結算時會列出建議的付款方式，讓大家少轉幾筆帳。';

  @override
  String get travelLabel => '出國也能用';

  @override
  String get travelTitle => '不同幣別，\n記在同一個群組。';

  @override
  String get travelBody => '用什麼幣別付款就記什麼幣別，再填入匯率或信用卡實際入帳金額。結算時，統一用群組設定的幣別。';

  @override
  String get screenshotsNote => 'Android App 實際畫面，使用英文與示範資料';

  @override
  String get screenshotExpenses => '支出紀錄';

  @override
  String get screenshotForeign => '外幣支出';

  @override
  String get screenshotStats => '支出統計';

  @override
  String get extraTitle => '還有這些常用功能';

  @override
  String get recurringTitle => '定期支出';

  @override
  String get recurringBody => '設定房租等固定支出，不用每次重新新增。';

  @override
  String get receiptsTitle => '收據與地點';

  @override
  String get receiptsBody => '把收據附在支出裡，之後對帳比較好找，也能記下消費地點。';

  @override
  String get liveTitle => '即時更新';

  @override
  String get liveBody => '群組開著時，其他人新增的支出會即時出現。';

  @override
  String get exportTitle => '匯入與匯出';

  @override
  String get exportBody => '帳目可以匯出成 CSV。原本用 Settle Up 的話，也能把群組匯入。';

  @override
  String get hostingLabel => 'Self-host';

  @override
  String get hostingTitle => '用自己的伺服器，\n和朋友一起記帳。';

  @override
  String get hostingBody =>
      '用 Docker Compose 啟動 Balnana，帳目會存在你伺服器上的 PostgreSQL 資料庫。設定步驟都放在 Docs 裡。';

  @override
  String get hostingLink => 'Self-host 指南';

  @override
  String get hostingModeLink => '只想分享連結？用私人連結或 QR code 就能加入，不用註冊。';

  @override
  String get hostingModeAccounts => '想用帳號管理，也能開啟密碼、Google 或 OIDC 登入。';

  @override
  String get faqTitle => '你可能會想問';

  @override
  String get faqAccountQ => '每個人都需要帳號嗎？';

  @override
  String get faqAccountA => '使用連結模式時，有私人連結或 QR code 就能加入，不用註冊。帳號模式則需要登入，加入方式依伺服器設定而定。';

  @override
  String get faqOfflineQ => '可以離線使用嗎？';

  @override
  String get faqOfflineA => 'Android 可以離線查看已快取的帳目，也能先新增支出和轉帳，連上伺服器後再上傳。修改既有支出和上傳收據仍需要連線。';

  @override
  String get faqCurrencyQ => '會自動取得匯率嗎？';

  @override
  String get faqCurrencyA => '伺服器開啟匯率查詢時，選外幣會先帶入參考匯率。你也可以改成自己的匯率，或填信用卡實際入帳金額。';

  @override
  String get faqPlatformQ => '支援哪些平台？';

  @override
  String get faqPlatformA => '目前有 Android 和網頁版，還沒有 iOS App。';

  @override
  String get faqCostQ => 'Balnana 免費嗎？';

  @override
  String get faqCostA => 'Balnana 開源，採用 AGPL-3.0 授權，App 本身不用付訂閱費。Self-host 的主機費用則要自己負擔。';

  @override
  String get endTitle => '想用看看？';

  @override
  String get endBody => '跟著 Docs 把 Balnana 跑起來，再邀朋友一起記帳。';

  @override
  String get github => '查看原始碼';

  @override
  String get reportIssue => '回報問題';

  @override
  String get footerNote => 'Balnana，一個開源的分帳 App。';

  @override
  String get backHome => '回到首頁';

  @override
  String get notFound => '找不到這個頁面。';

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
