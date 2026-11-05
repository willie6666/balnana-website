// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'site_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class SiteLocalizationsEn extends SiteLocalizations {
  SiteLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get navFeatures => 'Features';

  @override
  String get navDemo => 'Try it out';

  @override
  String get navHosting => 'Self-host';

  @override
  String get navFaq => 'FAQ';

  @override
  String get navDocs => 'Docs';

  @override
  String get heroEyebrow => 'Open-source expense splitting';

  @override
  String get heroTitle => 'Keep track of\nwho paid what.';

  @override
  String get heroBody =>
      'Away for the weekend or sharing a flat? Add what everyone paid, and Balnana works out each person\'s share and who owes whom.';

  @override
  String get tryDemo => 'Try the demo';

  @override
  String get selfHost => 'Self-host';

  @override
  String get development => 'In development · Android + Web';

  @override
  String get trustSplit => 'Flexible splits';

  @override
  String get trustLanguages => '20 languages';

  @override
  String get trustOpen => 'Open source, no ads';

  @override
  String get trustServer => 'Run on your own server';

  @override
  String get demoLabel => 'Try splitting a bill';

  @override
  String get demoTitle => 'How would you\nsplit this one?';

  @override
  String get demoBody =>
      'Change the amount, pick who paid, or adjust each person\'s shares. The balances below update as you go.';

  @override
  String get scenarioTravel => 'Travel';

  @override
  String get scenarioHome => 'Flatmates';

  @override
  String get scenarioDinner => 'Dinner';

  @override
  String get groupTravel => 'Kyoto weekend';

  @override
  String get groupHome => 'Our apartment';

  @override
  String get groupDinner => 'Friday dinner';

  @override
  String get demoNotice => 'Sample data — change anything you like';

  @override
  String get payer => 'Who paid?';

  @override
  String get balances => 'Everyone\'s balance';

  @override
  String get payments => 'Who pays whom';

  @override
  String morePayments(int count) {
    return '+$count more';
  }

  @override
  String get reset => 'Reset demo';

  @override
  String get weightedHelp =>
      'Choose how many shares each person pays. Set it to 0 if they\'re sitting this one out.';

  @override
  String fewerShares(String name) {
    return 'Fewer shares for $name';
  }

  @override
  String moreShares(String name) {
    return 'More shares for $name';
  }

  @override
  String get featureLabel => 'Ways to split';

  @override
  String get featureTitle => 'You don\'t have to\nsplit every bill equally.';

  @override
  String get featureSplitTitle => 'Equal shares or different amounts';

  @override
  String get featureSplitBody =>
      'Someone had a smaller meal? Adjust their share or enter an exact amount. You can also record several people paying for one expense.';

  @override
  String get featureSettleTitle => 'See who needs to pay whom';

  @override
  String get featureSettleBody =>
      'When it is time to settle up, Balnana suggests payments so everyone can make fewer transfers.';

  @override
  String get travelLabel => 'For trips abroad';

  @override
  String get travelTitle => 'Keep different currencies\nin the same group.';

  @override
  String get travelBody =>
      'Record an expense in the currency you paid, then enter the exchange rate or the amount charged to your card. Balances use the group\'s currency.';

  @override
  String get screenshotsNote => 'Screens from the Android app, in English with sample data';

  @override
  String get screenshotExpenses => 'Expense history';

  @override
  String get screenshotForeign => 'Foreign currency expenses';

  @override
  String get screenshotStats => 'Spending statistics';

  @override
  String get extraTitle => 'A few more useful things';

  @override
  String get recurringTitle => 'Recurring expenses';

  @override
  String get recurringBody =>
      'Schedule rent and other regular bills instead of adding them each time.';

  @override
  String get receiptsTitle => 'Receipts and places';

  @override
  String get receiptsBody =>
      'Attach a receipt to find it later, and save where you spent the money.';

  @override
  String get liveTitle => 'Live updates';

  @override
  String get liveBody => 'While your group is open, new expenses appear as others add them.';

  @override
  String get exportTitle => 'Import and export';

  @override
  String get exportBody => 'Export your expenses as CSV, or bring over a group from Settle Up.';

  @override
  String get hostingLabel => 'Self-host';

  @override
  String get hostingTitle => 'Run your own server.\nInvite your friends.';

  @override
  String get hostingBody =>
      'Start Balnana with Docker Compose. Expenses are stored in PostgreSQL on your server, and the setup steps are in the Docs.';

  @override
  String get hostingLink => 'Self-host guide';

  @override
  String get hostingModeLink =>
      'Share a private link or QR code so people can join without signing up.';

  @override
  String get hostingModeAccounts =>
      'Prefer accounts? Enable sign-in with a password, Google or OIDC.';

  @override
  String get faqTitle => 'Common questions';

  @override
  String get faqAccountQ => 'Does everyone need an account?';

  @override
  String get faqAccountA =>
      'With link mode, a private link or QR code is enough to join. Accounts mode requires sign-in, with access controlled by your server\'s settings.';

  @override
  String get faqOfflineQ => 'Can I use it offline?';

  @override
  String get faqOfflineA =>
      'On Android, you can read cached expenses and add new expenses or payments offline. They upload when you reconnect. Editing existing expenses and uploading receipts still need a connection.';

  @override
  String get faqCurrencyQ => 'Are exchange rates automatic?';

  @override
  String get faqCurrencyA =>
      'If your server has exchange-rate lookup enabled, Balnana fills in a reference rate when you pick a foreign currency. You can change it or enter the amount charged to your card.';

  @override
  String get faqPlatformQ => 'Which platforms are supported?';

  @override
  String get faqPlatformA => 'There is an Android app and a web app. There is no iOS app yet.';

  @override
  String get faqCostQ => 'Is Balnana free?';

  @override
  String get faqCostA =>
      'Balnana is open source under AGPL-3.0, with no app subscription. You cover any hosting costs when you run your own server.';

  @override
  String get endTitle => 'Want to give it a go?';

  @override
  String get endBody =>
      'Follow the Docs to start your server, then invite your friends to a group.';

  @override
  String get github => 'View source';

  @override
  String get reportIssue => 'Report an issue';

  @override
  String get footerNote => 'Balnana is an open-source app for shared expenses.';

  @override
  String get backHome => 'Back to home';

  @override
  String get notFound => 'We couldn\'t find that page.';

  @override
  String get screenshotOpen => 'View screenshot';

  @override
  String get settled => 'Everyone is settled up.';

  @override
  String get retry => 'Retry';

  @override
  String owed(String name) {
    return '$name is owed';
  }

  @override
  String get languageEndonym => 'English';

  @override
  String get languageLabel => 'Language';

  @override
  String get themeLabel => 'Theme';

  @override
  String get themeSystem => 'System default';

  @override
  String get themeLight => 'Light';

  @override
  String get themeDark => 'Dark';

  @override
  String get amountLabel => 'Amount';

  @override
  String get splitEqual => 'Equally';

  @override
  String get splitShares => 'Shares';

  @override
  String get cancel => 'Cancel';

  @override
  String get invalidAmount => 'Enter an amount greater than zero.';

  @override
  String get amountTooLarge => 'That amount is too large.';
}
