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
  String get heroEyebrow => 'OPEN SOURCE. YOURS TO RUN.';

  @override
  String get heroTitle => 'Good times.\nClear balances.';

  @override
  String get heroBody =>
      'Trips, dinners, everyday life. Keep shared expenses clear and your group\'s data on a server you own.';

  @override
  String get tryDemo => 'Try the demo';

  @override
  String get selfHost => 'Self-host Balnana';

  @override
  String get development => 'In development · Android + Web';

  @override
  String get trustSplit => 'Flexible splits';

  @override
  String get trustLanguages => '20 languages';

  @override
  String get trustOpen => 'Open source. No ads.';

  @override
  String get trustServer => 'Your own server';

  @override
  String get demoLabel => 'TRY IT TOGETHER';

  @override
  String get demoTitle => 'Make plans.\nWe\'ll do the maths.';

  @override
  String get demoBody => 'Change the amount. Choose who paid. Watch it all balance out.';

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
  String get demoNotice => 'Interactive demo · fictional data';

  @override
  String get payer => 'Who paid?';

  @override
  String get balances => 'Everyone\'s balance';

  @override
  String get payments => 'Suggested payments';

  @override
  String morePayments(int count) {
    return '+$count more';
  }

  @override
  String get reset => 'Reset demo';

  @override
  String get weightedHelp => 'Alex has 2 shares; everyone else has 1.';

  @override
  String get featureLabel => 'LITTLE DETAILS. BIG DIFFERENCE.';

  @override
  String get featureTitle => 'Less figuring out.\nMore being together.';

  @override
  String get featureSplitTitle => 'Fair doesn\'t always mean equal.';

  @override
  String get featureSplitBody =>
      'Split equally, by exact amounts or by shares. Several people can pay for the same expense.';

  @override
  String get featureSettleTitle => 'A clearer way to settle.';

  @override
  String get featureSettleBody =>
      'Know who owes whom, with suggestions that reduce the number of payments.';

  @override
  String get travelLabel => 'BUILT FOR THE NEXT TRIP';

  @override
  String get travelTitle => 'Different currencies.\nSame good company.';

  @override
  String get travelBody =>
      'Keep the original currency. Enter the rate or your card\'s actual charge. Balances stay in the group\'s currency.';

  @override
  String get screenshotsNote => 'Actual Android screens · fictional data · English';

  @override
  String get screenshotExpenses => 'Every expense';

  @override
  String get screenshotForeign => 'Original currency';

  @override
  String get screenshotStats => 'Spending insights';

  @override
  String get extraTitle => 'Everything your group needs.';

  @override
  String get recurringTitle => 'The everyday, on repeat.';

  @override
  String get recurringBody => 'Schedule rent and other recurring expenses.';

  @override
  String get receiptsTitle => 'Keep the little details.';

  @override
  String get receiptsBody => 'Attach receipts and save places alongside expenses.';

  @override
  String get liveTitle => 'Stay on the same page.';

  @override
  String get liveBody => 'Open groups refresh as others add expenses.';

  @override
  String get exportTitle => 'Take your history with you.';

  @override
  String get exportBody => 'Export CSV or import your group from Settle Up.';

  @override
  String get hostingLabel => 'YOUR PEOPLE. YOUR SERVER.';

  @override
  String get hostingTitle => 'Your balance.\nOn your terms.';

  @override
  String get hostingBody =>
      'Run Balnana with Docker Compose and PostgreSQL. You choose where your group\'s accounts live.';

  @override
  String get hostingLink => 'Read the setup guide';

  @override
  String get hostingModeLink => 'Share a private link. No sign-up in link mode.';

  @override
  String get hostingModeAccounts => 'Or enable accounts with password, Google or OIDC.';

  @override
  String get faqTitle => 'A few things worth knowing.';

  @override
  String get faqAccountQ => 'Does everyone need an account?';

  @override
  String get faqAccountA =>
      'In link mode, a private link or QR code is enough. In accounts mode, access depends on your server\'s settings.';

  @override
  String get faqOfflineQ => 'Can I use it offline?';

  @override
  String get faqOfflineA =>
      'On Android, previously cached groups and expenses remain readable when the server is unreachable. Adding or changing expenses needs a connection.';

  @override
  String get faqCurrencyQ => 'Are exchange rates automatic?';

  @override
  String get faqCurrencyA =>
      'Enter a rate yourself, or the actual amount charged to your card. Balnana does not fetch live exchange rates.';

  @override
  String get faqPlatformQ => 'Which platforms are supported?';

  @override
  String get faqPlatformA =>
      'Android and the web are supported today. An iOS release is not currently available.';

  @override
  String get faqCostQ => 'Is Balnana free?';

  @override
  String get faqCostA =>
      'Balnana is open-source software under AGPL-3.0. There is no app subscription; running your own server may have hosting costs.';

  @override
  String get endTitle => 'Your next good time\nstarts here.';

  @override
  String get endBody => 'Bring your people. We\'ll help with the numbers.';

  @override
  String get github => 'View source';

  @override
  String get reportIssue => 'Report an issue';

  @override
  String get footerNote => 'An open-source project, made for sharing.';

  @override
  String get backHome => 'Back to home';

  @override
  String get notFound => 'That page isn\'t here.';

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
