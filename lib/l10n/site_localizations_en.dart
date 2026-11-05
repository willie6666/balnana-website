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
  String get navDemo => 'Try it';

  @override
  String get navFaq => 'FAQ';

  @override
  String get navDocs => 'Docs';

  @override
  String get heroEyebrow => 'Open-source expense splitting';

  @override
  String get heroTitle => 'Pay now,\nsort it out later.';

  @override
  String get heroBody =>
      'On a trip, in a shared flat or out for dinner, whoever\'s handy pays and adds it to the group. At the end, Balnana adds everything up and tells each person who to pay and how much.';

  @override
  String get tryDemo => 'Try the demo';

  @override
  String get development => 'In development · Android + Web';

  @override
  String get trustSplit => 'Flexible splits';

  @override
  String get trustLanguages => '20 languages';

  @override
  String get trustOpen => 'Open source, no ads';

  @override
  String get demoLabel => 'Sample group';

  @override
  String get demoTitle => 'Lots of bills.\nJust a few transfers.';

  @override
  String get demoBody =>
      'Four friends, four expenses, each paid by someone different. Tap an expense to change the amount, who paid or how it\'s split, and see how the balances and transfers change.';

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
  String get demoNotice => 'Sample data. Change whatever you like.';

  @override
  String get payer => 'Who paid?';

  @override
  String get balances => 'Balances';

  @override
  String get payments => 'Who pays whom';

  @override
  String morePayments(int count) {
    return '+$count more';
  }

  @override
  String get reset => 'Reset';

  @override
  String get weightedHelp =>
      'Give someone more shares if they had more, or 0 if they weren\'t there.';

  @override
  String fewerShares(String name) {
    return 'Fewer shares for $name';
  }

  @override
  String moreShares(String name) {
    return 'More shares for $name';
  }

  @override
  String get featureLabel => 'Splitting';

  @override
  String get featureTitle => 'Not every bill\nis split evenly.';

  @override
  String get featureSplitTitle => 'Equally, by shares or exact amounts';

  @override
  String get featureSplitBody =>
      'Leave someone off the drinks if they didn\'t have any, or give the bigger room more shares of the rent. If two people paid for the same thing, you can record that too.';

  @override
  String get featureSettleTitle => 'Fewer transfers at the end';

  @override
  String get featureSettleBody =>
      'Balnana nets out everything the group owes each other before it suggests payments, so nobody has to pay back bill by bill.';

  @override
  String get travelLabel => 'Travelling abroad';

  @override
  String get travelTitle => 'Yen, euros and dollars\nin one group.';

  @override
  String get travelBody =>
      'Enter each expense in the currency you paid in, along with the exchange rate or what your card was charged. Balances are shown in the group\'s currency.';

  @override
  String get screenshotsNote => 'Screens from the Android app, in English with sample data';

  @override
  String get screenshotExpenses => 'Expense history';

  @override
  String get screenshotForeign => 'Foreign currency expenses';

  @override
  String get screenshotStats => 'Spending statistics';

  @override
  String get extraTitle => 'And a few other things';

  @override
  String get recurringTitle => 'Recurring expenses';

  @override
  String get recurringBody =>
      'Set up rent and other regular bills once instead of adding them every month.';

  @override
  String get receiptsTitle => 'Receipts and places';

  @override
  String get receiptsBody =>
      'Attach a photo of the receipt and note where you spent the money, so it\'s easy to find later.';

  @override
  String get liveTitle => 'Live updates';

  @override
  String get liveBody =>
      'If someone adds an expense while you have the group open, it shows up straight away.';

  @override
  String get exportTitle => 'Import and export';

  @override
  String get exportBody => 'Export your expenses to CSV, or import a group from Settle Up.';

  @override
  String get hostingLabel => 'Self-host';

  @override
  String get hostingTitle => 'Prefer to run\nyour own server?';

  @override
  String get hostingBody =>
      'You can. Balnana is open source and runs with Docker Compose, with your data in PostgreSQL, and the Docs cover the setup. But if you just want to split bills with friends, we\'d suggest the official server at app.balnana.com. There\'s nothing to install or keep up to date.';

  @override
  String get hostingLink => 'Self-host guide';

  @override
  String get faqTitle => 'FAQ';

  @override
  String get faqAccountQ => 'Does everyone need an account?';

  @override
  String get faqAccountA =>
      'You sign up on the official server to create a group. Turn on link sharing for the group, and friends can join with a private link or QR code without an account.';

  @override
  String get faqOfflineQ => 'Can I use it offline?';

  @override
  String get faqOfflineA =>
      'Mostly, on Android. You can look through cached expenses and add new expenses or payments, which upload once you\'re back online. Editing existing expenses and uploading receipts need a connection.';

  @override
  String get faqCurrencyQ => 'Are exchange rates automatic?';

  @override
  String get faqCurrencyA =>
      'Yes. When you pick a foreign currency, a reference rate is filled in for you. You can change it, or enter what your card was actually charged.';

  @override
  String get faqPlatformQ => 'Which platforms are supported?';

  @override
  String get faqPlatformA => 'Android and the web. There\'s no iOS app yet.';

  @override
  String get faqCostQ => 'Is Balnana free?';

  @override
  String get faqCostA =>
      'Yes. Sign up on the official server and you can use it for free, with no ads. Balnana is also open source (AGPL-3.0).';

  @override
  String get endTitle => 'Want to try it with your friends?';

  @override
  String get endBody => 'Sign up at app.balnana.com, create a group and send everyone the link.';

  @override
  String get github => 'View source';

  @override
  String get reportIssue => 'Report an issue';

  @override
  String get footerNote => 'Balnana is an open-source app for splitting shared expenses.';

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

  @override
  String get openApp => 'Open the web app';

  @override
  String get openAppShort => 'Open app';

  @override
  String get trustOfficial => 'Official server, ready to use';

  @override
  String get hostingOfficial => 'Use the official server';

  @override
  String get donateTitle => 'Like Balnana?';

  @override
  String get donateBody =>
      'If it\'s made splitting bills a bit easier for your group, you can support us on Ko-fi. It helps pay for the official server and keeps the project going.';

  @override
  String get donateLink => 'Support us on Ko-fi';

  @override
  String get expensesLabel => 'Expenses';

  @override
  String editing(String expense) {
    return 'Editing: $expense';
  }

  @override
  String paidBy(String name) {
    return '$name paid';
  }

  @override
  String splitWays(int count) {
    return 'split $count ways';
  }

  @override
  String get splitByShares => 'split by shares';

  @override
  String demoSummary(int separate, int payments) {
    return 'Paying back each bill on its own would take $separate transfers. Added up, it\'s $payments.';
  }

  @override
  String get expenseHotel => 'Hotel, 2 nights';

  @override
  String get expenseCar => 'Car rental';

  @override
  String get expenseGionDinner => 'Dinner in Gion';

  @override
  String get expenseTea => 'Tea ceremony';

  @override
  String get expenseRent => 'Rent';

  @override
  String get expenseGroceries => 'Groceries';

  @override
  String get expensePower => 'Electricity';

  @override
  String get expenseInternet => 'Internet';

  @override
  String get expenseDinner => 'Dinner';

  @override
  String get expenseDrinks => 'Drinks';

  @override
  String get expenseDessert => 'Dessert';

  @override
  String get expenseTaxi => 'Taxi home';
}
