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
  String get navFaq => '常见问题';

  @override
  String get navDocs => 'Docs';

  @override
  String get heroEyebrow => '开源分账 App';

  @override
  String get heroTitle => '先付再说，\n回头一次算清。';

  @override
  String get heroBody => '出去玩、合租、聚餐，谁方便谁先付，付完记进群组就好。最后 Balnana 会把所有账加起来互相抵掉，告诉每个人该转多少给谁。';

  @override
  String get tryDemo => '试算一下';

  @override
  String get development => '开发中 · Android 和 Web';

  @override
  String get trustSplit => '多种分账方式';

  @override
  String get trustLanguages => '支持 20 种语言';

  @override
  String get trustOpen => '开源、没有广告';

  @override
  String get demoLabel => '示例群组';

  @override
  String get demoTitle => '账再多，\n也不用一笔笔还。';

  @override
  String get demoBody => '四个朋友、四笔支出，每笔都是不同的人付的。点一笔可以改金额、换人付，或改成按份数分，看看余额和转账会怎么变。';

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
  String get demoNotice => '示例数据，随便改没关系';

  @override
  String get payer => '谁付的？';

  @override
  String get balances => '每个人的余额';

  @override
  String get payments => '谁转给谁';

  @override
  String morePayments(int count) {
    return '还有 $count 笔';
  }

  @override
  String get reset => '重置';

  @override
  String get weightedHelp => '吃得多的多算几份，没参加的设成 0。';

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
  String get featureTitle => '不是每笔钱\n都适合平分。';

  @override
  String get featureSplitTitle => '平分、按份数或指定金额';

  @override
  String get featureSplitBody => '有人没喝酒，就不用分酒钱；房间大一点的，房租多分一点。两个人一起付同一笔，也记得下来。';

  @override
  String get featureSettleTitle => '结账时少转几次';

  @override
  String get featureSettleBody => 'Balnana 会先把整个群组的账互相抵掉，再建议怎么转，不用每笔账都各自还一次。';

  @override
  String get travelLabel => '出国旅行';

  @override
  String get travelTitle => '日元、欧元、人民币，\n记在同一个群组。';

  @override
  String get travelBody => '每笔用当时付的币种记，再填汇率，或直接填信用卡实际扣了多少。余额会换算成群组设置的币种。';

  @override
  String get screenshotsNote => 'Android App 实际画面，使用英文和演示数据';

  @override
  String get screenshotExpenses => '支出记录';

  @override
  String get screenshotForeign => '外币支出';

  @override
  String get screenshotStats => '支出统计';

  @override
  String get extraTitle => '其他功能';

  @override
  String get recurringTitle => '定期支出';

  @override
  String get recurringBody => '房租这类每个月都有的支出，设置一次就好，不用每次重新记。';

  @override
  String get receiptsTitle => '收据与地点';

  @override
  String get receiptsBody => '可以拍收据附上去，也能记下在哪里花的，之后找起来比较快。';

  @override
  String get liveTitle => '实时更新';

  @override
  String get liveBody => '群组开着的时候，别人新添加的支出会直接出现。';

  @override
  String get exportTitle => '导入与导出';

  @override
  String get exportBody => '账目可以导出成 CSV；之前用 Settle Up 的群组也能导进来。';

  @override
  String get hostingLabel => 'Self-host';

  @override
  String get hostingTitle => '想自己部署，\n也可以。';

  @override
  String get hostingBody =>
      'Balnana 是开源的，用 Docker Compose 就能部署，数据存在你自己的 PostgreSQL 数据库中，步骤都写在 Docs 里。不过如果只是想和朋友分账，我们更推荐直接用官方服务器 app.balnana.com，不用安装，也不用自己维护更新。';

  @override
  String get hostingLink => 'Self-host 指南';

  @override
  String get faqTitle => '常见问题';

  @override
  String get faqAccountQ => '每个人都需要账号吗？';

  @override
  String get faqAccountA => '在官方服务器上，创建群组要先注册。群组开启链接分享后，朋友用私人链接或二维码就能加入，不用注册。';

  @override
  String get faqOfflineQ => '可以离线使用吗？';

  @override
  String get faqOfflineA => 'Android 大部分可以：能看之前加载过的账，也能添加支出和转账，等有网络再上传。不过修改已有支出和上传收据还是要联网。';

  @override
  String get faqCurrencyQ => '会自动获取汇率吗？';

  @override
  String get faqCurrencyA => '会。选了外币就会自动带入参考汇率，你可以自己改，或者直接填刷卡实际扣的金额。';

  @override
  String get faqPlatformQ => '支持哪些平台？';

  @override
  String get faqPlatformA => '目前有 Android 和网页版，iOS 还没有。';

  @override
  String get faqCostQ => 'Balnana 免费吗？';

  @override
  String get faqCostA => '免费。在官方服务器注册就能用，也没有广告。Balnana 是开源项目（AGPL-3.0）。';

  @override
  String get endTitle => '想跟朋友一起用？';

  @override
  String get endBody => '到 app.balnana.com 注册，建个群组，把链接发给大家就行了。';

  @override
  String get github => '查看源代码';

  @override
  String get reportIssue => '报告问题';

  @override
  String get footerNote => 'Balnana 是一个开源的分账 App。';

  @override
  String get backHome => '返回首页';

  @override
  String get notFound => '找不到这个页面。';

  @override
  String get screenshotOpen => '查看截图';

  @override
  String get settled => '大家都结清了。';

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

  @override
  String get openApp => '打开网页版';

  @override
  String get openAppShort => '开始使用';

  @override
  String get trustOfficial => '官方服务器，注册就能用';

  @override
  String get hostingOfficial => '使用官方服务器';

  @override
  String get donateTitle => '喜欢 Balnana 吗？';

  @override
  String get donateBody => '如果它让你们分账轻松了一点，欢迎到 Ko-fi 支持我们。这些钱会用来支付官方服务器的费用，也让这个项目能继续做下去。';

  @override
  String get donateLink => '到 Ko-fi 支持我们';

  @override
  String get expensesLabel => '支出';

  @override
  String editing(String expense) {
    return '正在改：$expense';
  }

  @override
  String paidBy(String name) {
    return '$name 付';
  }

  @override
  String splitWays(int count) {
    return '$count 人平分';
  }

  @override
  String get splitByShares => '按份数分';

  @override
  String demoSummary(int separate, int payments) {
    return '一笔一笔还要转 $separate 次，合起来算只要 $payments 次。';
  }

  @override
  String get expenseHotel => '酒店两晚';

  @override
  String get expenseCar => '租车';

  @override
  String get expenseGionDinner => '祇园晚餐';

  @override
  String get expenseTea => '茶道体验';

  @override
  String get expenseRent => '房租';

  @override
  String get expenseGroceries => '买菜';

  @override
  String get expensePower => '电费';

  @override
  String get expenseInternet => '网费';

  @override
  String get expenseDinner => '晚餐';

  @override
  String get expenseDrinks => '酒水';

  @override
  String get expenseDessert => '甜点';

  @override
  String get expenseTaxi => '回家的出租车';
}

/// The translations for Chinese, using the Han script (`zh_Hant`).
class SiteLocalizationsZhHant extends SiteLocalizationsZh {
  SiteLocalizationsZhHant() : super('zh_Hant');

  @override
  String get navFeatures => '功能';

  @override
  String get navDemo => '試算看看';

  @override
  String get navFaq => '常見問題';

  @override
  String get navDocs => 'Docs';

  @override
  String get heroEyebrow => '開源分帳 App';

  @override
  String get heroTitle => '先付再說，\n回頭一次算清。';

  @override
  String get heroBody => '出去玩、合租、聚餐，誰方便誰先付，付完記進群組就好。最後 Balnana 會把所有帳加起來互相抵掉，告訴每個人該轉多少給誰。';

  @override
  String get tryDemo => '試算看看';

  @override
  String get development => '開發中 · Android 與 Web';

  @override
  String get trustSplit => '多種分帳方式';

  @override
  String get trustLanguages => '支援 20 種語言';

  @override
  String get trustOpen => '開源、沒有廣告';

  @override
  String get demoLabel => '範例群組';

  @override
  String get demoTitle => '帳再多，\n也不用一筆筆還。';

  @override
  String get demoBody => '四個朋友、四筆支出，每筆都是不同的人付的。點一筆可以改金額、換人付，或改成按份數分，看看餘額和轉帳會怎麼變。';

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
  String get demoNotice => '範例資料，隨便改沒關係';

  @override
  String get payer => '誰付的？';

  @override
  String get balances => '每個人的餘額';

  @override
  String get payments => '誰轉給誰';

  @override
  String morePayments(int count) {
    return '還有 $count 筆';
  }

  @override
  String get reset => '重設';

  @override
  String get weightedHelp => '吃比較多的多算幾份，沒參加的設成 0。';

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
  String get featureTitle => '不是每筆錢\n都適合平分。';

  @override
  String get featureSplitTitle => '平分、按份數或指定金額';

  @override
  String get featureSplitBody => '有人沒喝酒，就不用分酒錢；房間比較大的，房租多分一點。兩個人一起付同一筆，也記得起來。';

  @override
  String get featureSettleTitle => '結帳時少轉幾次';

  @override
  String get featureSettleBody => 'Balnana 會先把整個群組的帳互相抵掉，再建議怎麼轉，不用每筆帳都各自還一次。';

  @override
  String get travelLabel => '出國旅行';

  @override
  String get travelTitle => '日圓、歐元、台幣，\n記在同一個群組。';

  @override
  String get travelBody => '每筆用當下付的幣別記，再填匯率，或直接填信用卡實際扣了多少。餘額會換算成群組設定的幣別。';

  @override
  String get screenshotsNote => 'Android App 實際畫面，使用英文與示範資料';

  @override
  String get screenshotExpenses => '支出紀錄';

  @override
  String get screenshotForeign => '外幣支出';

  @override
  String get screenshotStats => '支出統計';

  @override
  String get extraTitle => '其他功能';

  @override
  String get recurringTitle => '定期支出';

  @override
  String get recurringBody => '房租這類每個月都有的支出，設定一次就好，不用每次重新記。';

  @override
  String get receiptsTitle => '收據與地點';

  @override
  String get receiptsBody => '可以拍收據附上去，也能記下在哪裡花的，之後要找比較快。';

  @override
  String get liveTitle => '即時更新';

  @override
  String get liveBody => '群組開著的時候，別人新增的支出會直接出現。';

  @override
  String get exportTitle => '匯入與匯出';

  @override
  String get exportBody => '帳目可以匯出成 CSV；之前用 Settle Up 的群組也能匯進來。';

  @override
  String get hostingLabel => 'Self-host';

  @override
  String get hostingTitle => '想自己架，\n也可以。';

  @override
  String get hostingBody =>
      'Balnana 是開源的，用 Docker Compose 就能架起來，資料存在你自己的 PostgreSQL，步驟都寫在 Docs 裡。不過如果只是想跟朋友分帳，我們比較推薦直接用官方伺服器 app.balnana.com，不用安裝，也不用自己顧更新。';

  @override
  String get hostingLink => 'Self-host 指南';

  @override
  String get faqTitle => '常見問題';

  @override
  String get faqAccountQ => '每個人都需要帳號嗎？';

  @override
  String get faqAccountA => '在官方伺服器上，建立群組要先註冊。群組開啟連結分享後，朋友拿私人連結或 QR code 就能加入，不用註冊。';

  @override
  String get faqOfflineQ => '可以離線使用嗎？';

  @override
  String get faqOfflineA => 'Android 大部分可以：能看之前載入過的帳，也能新增支出和轉帳，等有網路再上傳。不過修改舊的支出和上傳收據還是要連線。';

  @override
  String get faqCurrencyQ => '會自動取得匯率嗎？';

  @override
  String get faqCurrencyA => '會。選了外幣就會自動帶入參考匯率，你可以自己改，或直接填刷卡實際扣的金額。';

  @override
  String get faqPlatformQ => '支援哪些平台？';

  @override
  String get faqPlatformA => '目前有 Android 和網頁版，iOS 還沒有。';

  @override
  String get faqCostQ => 'Balnana 免費嗎？';

  @override
  String get faqCostA => '免費。在官方伺服器註冊就能用，也沒有廣告。Balnana 是開源專案（AGPL-3.0）。';

  @override
  String get endTitle => '想跟朋友一起用？';

  @override
  String get endBody => '到 app.balnana.com 註冊，開個群組，把連結傳給大家就行了。';

  @override
  String get github => '查看原始碼';

  @override
  String get reportIssue => '回報問題';

  @override
  String get footerNote => 'Balnana 是一個開源的分帳 App。';

  @override
  String get backHome => '回到首頁';

  @override
  String get notFound => '找不到這個頁面。';

  @override
  String get screenshotOpen => '檢視截圖';

  @override
  String get settled => '大家都結清了。';

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

  @override
  String get openApp => '打開網頁版';

  @override
  String get openAppShort => '開始使用';

  @override
  String get trustOfficial => '官方伺服器，註冊就能用';

  @override
  String get hostingOfficial => '使用官方伺服器';

  @override
  String get donateTitle => '喜歡 Balnana 嗎？';

  @override
  String get donateBody => '如果它讓你們分帳輕鬆了一點，歡迎到 Ko-fi 贊助我們。這些錢會拿去付官方伺服器的費用，也讓這個專案能繼續做下去。';

  @override
  String get donateLink => '到 Ko-fi 贊助';

  @override
  String get expensesLabel => '支出';

  @override
  String editing(String expense) {
    return '正在改：$expense';
  }

  @override
  String paidBy(String name) {
    return '$name 付';
  }

  @override
  String splitWays(int count) {
    return '$count 人平分';
  }

  @override
  String get splitByShares => '按份數分';

  @override
  String demoSummary(int separate, int payments) {
    return '一筆一筆還要轉 $separate 次，合起來算只要 $payments 次。';
  }

  @override
  String get expenseHotel => '飯店兩晚';

  @override
  String get expenseCar => '租車';

  @override
  String get expenseGionDinner => '祇園晚餐';

  @override
  String get expenseTea => '茶道體驗';

  @override
  String get expenseRent => '房租';

  @override
  String get expenseGroceries => '買菜';

  @override
  String get expensePower => '電費';

  @override
  String get expenseInternet => '網路費';

  @override
  String get expenseDinner => '晚餐';

  @override
  String get expenseDrinks => '酒水';

  @override
  String get expenseDessert => '甜點';

  @override
  String get expenseTaxi => '回家的計程車';
}
