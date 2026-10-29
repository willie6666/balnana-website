// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'site_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class SiteLocalizationsJa extends SiteLocalizations {
  SiteLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get navFeatures => '機能';

  @override
  String get navDemo => '試してみる';

  @override
  String get navHosting => 'セルフホスト';

  @override
  String get navFaq => 'よくある質問';

  @override
  String get heroEyebrow => 'オープンソース。管理はあなたに。';

  @override
  String get heroTitle => '楽しい時間。\nすっきり割り勘。';

  @override
  String get heroBody => '旅行も食事も日々の暮らしも。共同の支出を整理し、自分のサーバーでデータを管理。';

  @override
  String get tryDemo => 'デモを試す';

  @override
  String get selfHost => 'Balnana を構築';

  @override
  String get development => '開発中 · Android と Web';

  @override
  String get trustSplit => '柔軟な分担';

  @override
  String get trustLanguages => '20 の言語';

  @override
  String get trustOpen => 'オープンソース、広告なし';

  @override
  String get trustServer => '自分のサーバー';

  @override
  String get demoLabel => '一緒に試そう';

  @override
  String get demoTitle => '予定を立てよう。\n計算はおまかせ。';

  @override
  String get demoBody => '金額や支払った人を変えて、残高の変化を確認。';

  @override
  String get scenarioTravel => '旅行';

  @override
  String get scenarioHome => 'ルームメイト';

  @override
  String get scenarioDinner => '食事';

  @override
  String get groupTravel => '京都の週末';

  @override
  String get groupHome => '私たちの部屋';

  @override
  String get groupDinner => '金曜日の食事';

  @override
  String get demoNotice => '操作できるデモ · 架空のデータ';

  @override
  String get payer => '支払った人';

  @override
  String get balances => 'みんなの残高';

  @override
  String get payments => '精算の提案';

  @override
  String morePayments(int count) {
    return '他 $count 件';
  }

  @override
  String get reset => 'デモをリセット';

  @override
  String get weightedHelp => 'Alex は 2 口、ほかの人は 1 口ずつ。';

  @override
  String get featureLabel => '小さな工夫、大きな違い';

  @override
  String get featureTitle => '計算は少なく。\n一緒の時間は多く。';

  @override
  String get featureSplitTitle => '公平は、均等とは限らない。';

  @override
  String get featureSplitBody => '均等、金額指定、口数で分担。同じ支出を複数人で支払うこともできます。';

  @override
  String get featureSettleTitle => '精算を、もっとわかりやすく。';

  @override
  String get featureSettleBody => '誰が誰にいくら払うかを整理し、送金の回数を減らす提案を表示。';

  @override
  String get travelLabel => '次の旅のために';

  @override
  String get travelTitle => '通貨が違っても、\n仲間は同じ。';

  @override
  String get travelBody => '元の通貨を残し、為替レートかカードの実際の請求額を入力。残高はグループの通貨で統一。';

  @override
  String get screenshotsNote => '実際の Android 画面 · 架空のデータ · 英語';

  @override
  String get screenshotExpenses => 'すべての支出';

  @override
  String get screenshotForeign => '元の通貨';

  @override
  String get screenshotStats => '支出の分析';

  @override
  String get extraTitle => 'グループに必要なものを。';

  @override
  String get recurringTitle => '毎月の支出も。';

  @override
  String get recurringBody => '家賃などの定期的な支出を予約。';

  @override
  String get receiptsTitle => '細かな情報も一緒に。';

  @override
  String get receiptsBody => '支出にレシートや場所を添付。';

  @override
  String get liveTitle => 'いつも同じ情報を。';

  @override
  String get liveBody => 'ほかの人が支出を追加すると、開いているグループが更新。';

  @override
  String get exportTitle => '履歴を持ち出そう。';

  @override
  String get exportBody => 'CSV にエクスポート、Settle Up からのインポートに対応。';

  @override
  String get hostingLabel => 'あなたの仲間。あなたのサーバー。';

  @override
  String get hostingTitle => 'あなたの残高を、\nあなたの管理で。';

  @override
  String get hostingBody => 'Docker Compose と PostgreSQL で構築。グループのデータをどこに置くかはあなた次第。';

  @override
  String get hostingLink => '構築ガイドを読む';

  @override
  String get hostingModeLink => 'リンクモードは非公開リンクを共有するだけ。登録不要。';

  @override
  String get hostingModeAccounts => 'パスワード、Google、OIDC によるアカウントも利用可能。';

  @override
  String get faqTitle => 'よくある質問';

  @override
  String get faqAccountQ => '全員にアカウントが必要ですか？';

  @override
  String get faqAccountA => 'リンクモードでは非公開リンクか QR コードで参加できます。アカウントモードのアクセスはサーバーの設定によります。';

  @override
  String get faqOfflineQ => 'オフラインでも使えますか？';

  @override
  String get faqOfflineA => 'Android ではサーバーに接続できないときも、キャッシュ済みのグループや支出を閲覧できます。追加・変更には接続が必要です。';

  @override
  String get faqCurrencyQ => '為替レートは自動ですか？';

  @override
  String get faqCurrencyA => 'レートを入力するか、カードの実際の請求額を指定します。リアルタイムのレート取得は行いません。';

  @override
  String get faqPlatformQ => '対応プラットフォームは？';

  @override
  String get faqPlatformA => '現在は Android と Web に対応しています。iOS 版はまだありません。';

  @override
  String get faqCostQ => '無料で使えますか？';

  @override
  String get faqCostA => 'AGPL-3.0 のオープンソースです。アプリの定額料金はありませんが、サーバーの運用には費用がかかる場合があります。';

  @override
  String get endTitle => '次の楽しい時間を、\nここから。';

  @override
  String get endBody => '仲間を集めよう。計算は一緒に整理しよう。';

  @override
  String get github => 'ソースを見る';

  @override
  String get reportIssue => '問題を報告';

  @override
  String get footerNote => '分かち合うためのオープンソース。';

  @override
  String get backHome => 'ホームに戻る';

  @override
  String get notFound => 'このページは見つかりません。';

  @override
  String get screenshotOpen => '画面を見る';

  @override
  String get settled => '全員の精算が完了しました。';

  @override
  String get retry => '再試行';

  @override
  String owed(String name) {
    return '$nameの受け取り予定';
  }

  @override
  String get languageEndonym => '日本語';

  @override
  String get languageLabel => '言語';

  @override
  String get themeLabel => 'テーマ';

  @override
  String get themeSystem => 'システム設定に合わせる';

  @override
  String get themeLight => 'ライト';

  @override
  String get themeDark => 'ダーク';

  @override
  String get amountLabel => '金額';

  @override
  String get splitEqual => '均等に分ける';

  @override
  String get splitShares => '割合で分ける';

  @override
  String get cancel => 'キャンセル';

  @override
  String get invalidAmount => '0より大きい金額を入力してください。';

  @override
  String get amountTooLarge => '金額が大きすぎます。';
}
