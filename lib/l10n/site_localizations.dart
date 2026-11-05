import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'site_localizations_en.dart';
import 'site_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of SiteLocalizations
/// returned by `SiteLocalizations.of(context)`.
///
/// Applications need to include `SiteLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/site_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: SiteLocalizations.localizationsDelegates,
///   supportedLocales: SiteLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the SiteLocalizations.supportedLocales
/// property.
abstract class SiteLocalizations {
  SiteLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static SiteLocalizations of(BuildContext context) {
    return Localizations.of<SiteLocalizations>(context, SiteLocalizations)!;
  }

  static const LocalizationsDelegate<SiteLocalizations> delegate = _SiteLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('zh'),
    Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'),
  ];

  /// Official website: navFeatures. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Features'**
  String get navFeatures;

  /// Official website: navDemo. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Try it'**
  String get navDemo;

  /// Official website: short navigation label for the FAQ section.
  ///
  /// In en, this message translates to:
  /// **'FAQ'**
  String get navFaq;

  /// Official website: short navigation label for the documentation site at /docs.
  ///
  /// In en, this message translates to:
  /// **'Docs'**
  String get navDocs;

  /// Official website: heroEyebrow. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Open-source expense splitting'**
  String get heroEyebrow;

  /// Official website: heroTitle. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Pay now,\nsort it out later.'**
  String get heroTitle;

  /// Official website: heroBody. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'On a trip, in a shared flat or out for dinner, whoever\'s handy pays and adds it to the group. At the end, Balnana adds everything up and tells each person who to pay and how much.'**
  String get heroBody;

  /// Official website: tryDemo. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Try the demo'**
  String get tryDemo;

  /// Official website: development. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'In development · Android + Web'**
  String get development;

  /// Official website: trustSplit. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Flexible splits'**
  String get trustSplit;

  /// Official website: trustLanguages. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'20 languages'**
  String get trustLanguages;

  /// Official website: trustOpen. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Open source, no ads'**
  String get trustOpen;

  /// Official website: demoLabel. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Sample group'**
  String get demoLabel;

  /// Official website: demoTitle. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Lots of bills.\nJust a few transfers.'**
  String get demoTitle;

  /// Official website: demoBody. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Four friends, four expenses, each paid by someone different. Tap an expense to change the amount, who paid or how it\'s split, and see how the balances and transfers change.'**
  String get demoBody;

  /// Official website: scenarioTravel. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Travel'**
  String get scenarioTravel;

  /// Official website: scenarioHome. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Flatmates'**
  String get scenarioHome;

  /// Official website: scenarioDinner. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Dinner'**
  String get scenarioDinner;

  /// Official website: groupTravel. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Kyoto weekend'**
  String get groupTravel;

  /// Official website: groupHome. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Our apartment'**
  String get groupHome;

  /// Official website: groupDinner. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Friday dinner'**
  String get groupDinner;

  /// Official website: demoNotice. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Sample data. Change whatever you like.'**
  String get demoNotice;

  /// Official website: payer. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Who paid?'**
  String get payer;

  /// Official website: balances. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Balances'**
  String get balances;

  /// Official website: payments. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Who pays whom'**
  String get payments;

  /// Official website: shown after the first suggested payment when more are hidden.
  ///
  /// In en, this message translates to:
  /// **'+{count} more'**
  String morePayments(int count);

  /// Official website: reset. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get reset;

  /// Official website: help under the share counters in the demo's Shares mode.
  ///
  /// In en, this message translates to:
  /// **'Give someone more shares if they had more, or 0 if they weren\'t there.'**
  String get weightedHelp;

  /// Official website: accessibility label of the demo button that removes one share from a member.
  ///
  /// In en, this message translates to:
  /// **'Fewer shares for {name}'**
  String fewerShares(String name);

  /// Official website: accessibility label of the demo button that adds one share to a member.
  ///
  /// In en, this message translates to:
  /// **'More shares for {name}'**
  String moreShares(String name);

  /// Official website: featureLabel. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Splitting'**
  String get featureLabel;

  /// Official website: featureTitle. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Not every bill\nis split evenly.'**
  String get featureTitle;

  /// Official website: featureSplitTitle. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Equally, by shares or exact amounts'**
  String get featureSplitTitle;

  /// Official website: featureSplitBody. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Leave someone off the drinks if they didn\'t have any, or give the bigger room more shares of the rent. If two people paid for the same thing, you can record that too.'**
  String get featureSplitBody;

  /// Official website: featureSettleTitle. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Fewer transfers at the end'**
  String get featureSettleTitle;

  /// Official website: featureSettleBody. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Balnana nets out everything the group owes each other before it suggests payments, so nobody has to pay back bill by bill.'**
  String get featureSettleBody;

  /// Official website: travelLabel. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Travelling abroad'**
  String get travelLabel;

  /// Official website: travelTitle. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Yen, euros and dollars\nin one group.'**
  String get travelTitle;

  /// Official website: travelBody. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Enter each expense in the currency you paid in, along with the exchange rate or what your card was charged. Balances are shown in the group\'s currency.'**
  String get travelBody;

  /// Official website: screenshotsNote. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Screens from the Android app, in English with sample data'**
  String get screenshotsNote;

  /// Official website: screenshotExpenses. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Expense history'**
  String get screenshotExpenses;

  /// Official website: screenshotForeign. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Foreign currency expenses'**
  String get screenshotForeign;

  /// Official website: screenshotStats. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Spending statistics'**
  String get screenshotStats;

  /// Official website: extraTitle. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'And a few other things'**
  String get extraTitle;

  /// Official website: recurringTitle. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Recurring expenses'**
  String get recurringTitle;

  /// Official website: recurringBody. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Set up rent and other regular bills once instead of adding them every month.'**
  String get recurringBody;

  /// Official website: receiptsTitle. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Receipts and places'**
  String get receiptsTitle;

  /// Official website: receiptsBody. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Attach a photo of the receipt and note where you spent the money, so it\'s easy to find later.'**
  String get receiptsBody;

  /// Official website: liveTitle. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Live updates'**
  String get liveTitle;

  /// Official website: liveBody. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'If someone adds an expense while you have the group open, it shows up straight away.'**
  String get liveBody;

  /// Official website: exportTitle. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Import and export'**
  String get exportTitle;

  /// Official website: exportBody. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Export your expenses to CSV, or import a group from Settle Up.'**
  String get exportBody;

  /// Official website: hostingLabel. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Self-host'**
  String get hostingLabel;

  /// Official website: hostingTitle. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Prefer to run\nyour own server?'**
  String get hostingTitle;

  /// Official website: hostingBody. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'You can. Balnana is open source and runs with Docker Compose, with your data in PostgreSQL, and the Docs cover the setup. But if you just want to split bills with friends, we\'d suggest the official server at app.balnana.com. There\'s nothing to install or keep up to date.'**
  String get hostingBody;

  /// Official website: hostingLink. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Self-host guide'**
  String get hostingLink;

  /// Official website: faqTitle. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'FAQ'**
  String get faqTitle;

  /// Official website: faqAccountQ. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Does everyone need an account?'**
  String get faqAccountQ;

  /// Official website: faqAccountA. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'You sign up on the official server to create a group. Turn on link sharing for the group, and friends can join with a private link or QR code without an account.'**
  String get faqAccountA;

  /// Official website: faqOfflineQ. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Can I use it offline?'**
  String get faqOfflineQ;

  /// Official website: faqOfflineA. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Mostly, on Android. You can look through cached expenses and add new expenses or payments, which upload once you\'re back online. Editing existing expenses and uploading receipts need a connection.'**
  String get faqOfflineA;

  /// Official website: faqCurrencyQ. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Are exchange rates automatic?'**
  String get faqCurrencyQ;

  /// Official website: faqCurrencyA. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Yes. When you pick a foreign currency, a reference rate is filled in for you. You can change it, or enter what your card was actually charged.'**
  String get faqCurrencyA;

  /// Official website: faqPlatformQ. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Which platforms are supported?'**
  String get faqPlatformQ;

  /// Official website: faqPlatformA. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Android and the web. There\'s no iOS app yet.'**
  String get faqPlatformA;

  /// Official website: faqCostQ. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Is Balnana free?'**
  String get faqCostQ;

  /// Official website: faqCostA. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Yes. Sign up on the official server and you can use it for free, with no ads. Balnana is also open source (AGPL-3.0).'**
  String get faqCostA;

  /// Official website: endTitle. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Want to try it with your friends?'**
  String get endTitle;

  /// Official website: endBody. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Sign up at app.balnana.com, create a group and send everyone the link.'**
  String get endBody;

  /// Official website: github. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'View source'**
  String get github;

  /// Official website: reportIssue. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Report an issue'**
  String get reportIssue;

  /// Official website: footerNote. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Balnana is an open-source app for splitting shared expenses.'**
  String get footerNote;

  /// Official website: backHome. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Back to home'**
  String get backHome;

  /// Official website: notFound. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'We couldn\'t find that page.'**
  String get notFound;

  /// Official website: screenshotOpen. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'View screenshot'**
  String get screenshotOpen;

  /// Official website: settled. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Everyone is settled up.'**
  String get settled;

  /// Official website: retry. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// Official website: header of the demo balance card, naming the member who gets money back.
  ///
  /// In en, this message translates to:
  /// **'{name} is owed'**
  String owed(String name);

  /// Official website: languageEndonym. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get languageEndonym;

  /// Official website: languageLabel. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get languageLabel;

  /// Official website: themeLabel. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get themeLabel;

  /// Official website: themeSystem. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'System default'**
  String get themeSystem;

  /// Official website: themeLight. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get themeLight;

  /// Official website: themeDark. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get themeDark;

  /// Official website: amountLabel. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get amountLabel;

  /// Official website: splitEqual. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Equally'**
  String get splitEqual;

  /// Official website: splitShares. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Shares'**
  String get splitShares;

  /// Official website: cancel. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// Official website: invalidAmount. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Enter an amount greater than zero.'**
  String get invalidAmount;

  /// Official website: amountTooLarge. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'That amount is too large.'**
  String get amountTooLarge;

  /// Official website: openApp. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Open the web app'**
  String get openApp;

  /// Official website: openAppShort. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Open app'**
  String get openAppShort;

  /// Official website: trustOfficial. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Official server, ready to use'**
  String get trustOfficial;

  /// Official website: hostingOfficial. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Use the official server'**
  String get hostingOfficial;

  /// Official website: donateTitle. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Like Balnana?'**
  String get donateTitle;

  /// Official website: donateBody. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'If it\'s made splitting bills a bit easier for your group, you can support us on Ko-fi. It helps pay for the official server and keeps the project going.'**
  String get donateBody;

  /// Official website: donateLink. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Support us on Ko-fi'**
  String get donateLink;

  /// Official website: heading above the list of sample expenses in the demo.
  ///
  /// In en, this message translates to:
  /// **'Expenses'**
  String get expensesLabel;

  /// Official website: heading above the demo's editor, naming the expense being edited.
  ///
  /// In en, this message translates to:
  /// **'Editing: {expense}'**
  String editing(String expense);

  /// Official website: who paid a sample expense, in the demo's expense list.
  ///
  /// In en, this message translates to:
  /// **'{name} paid'**
  String paidBy(String name);

  /// Official website: a sample expense split equally between this many people.
  ///
  /// In en, this message translates to:
  /// **'split {count} ways'**
  String splitWays(int count);

  /// Official website: a sample expense split by shares.
  ///
  /// In en, this message translates to:
  /// **'split by shares'**
  String get splitByShares;

  /// Official website: compares transfers needed when each bill is paid back on its own with the suggested payments.
  ///
  /// In en, this message translates to:
  /// **'Paying back each bill on its own would take {separate} transfers. Added up, it\'s {payments}.'**
  String demoSummary(int separate, int payments);

  /// Official website: name of a sample expense in the demo.
  ///
  /// In en, this message translates to:
  /// **'Hotel, 2 nights'**
  String get expenseHotel;

  /// Official website: name of a sample expense in the demo.
  ///
  /// In en, this message translates to:
  /// **'Car rental'**
  String get expenseCar;

  /// Official website: name of a sample expense in the demo.
  ///
  /// In en, this message translates to:
  /// **'Dinner in Gion'**
  String get expenseGionDinner;

  /// Official website: name of a sample expense in the demo.
  ///
  /// In en, this message translates to:
  /// **'Tea ceremony'**
  String get expenseTea;

  /// Official website: name of a sample expense in the demo.
  ///
  /// In en, this message translates to:
  /// **'Rent'**
  String get expenseRent;

  /// Official website: name of a sample expense in the demo.
  ///
  /// In en, this message translates to:
  /// **'Groceries'**
  String get expenseGroceries;

  /// Official website: name of a sample expense in the demo.
  ///
  /// In en, this message translates to:
  /// **'Electricity'**
  String get expensePower;

  /// Official website: name of a sample expense in the demo.
  ///
  /// In en, this message translates to:
  /// **'Internet'**
  String get expenseInternet;

  /// Official website: name of a sample expense in the demo.
  ///
  /// In en, this message translates to:
  /// **'Dinner'**
  String get expenseDinner;

  /// Official website: name of a sample expense in the demo.
  ///
  /// In en, this message translates to:
  /// **'Drinks'**
  String get expenseDrinks;

  /// Official website: name of a sample expense in the demo.
  ///
  /// In en, this message translates to:
  /// **'Dessert'**
  String get expenseDessert;

  /// Official website: name of a sample expense in the demo.
  ///
  /// In en, this message translates to:
  /// **'Taxi home'**
  String get expenseTaxi;
}

class _SiteLocalizationsDelegate extends LocalizationsDelegate<SiteLocalizations> {
  const _SiteLocalizationsDelegate();

  @override
  Future<SiteLocalizations> load(Locale locale) {
    return SynchronousFuture<SiteLocalizations>(lookupSiteLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_SiteLocalizationsDelegate old) => false;
}

SiteLocalizations lookupSiteLocalizations(Locale locale) {
  // Lookup logic when language+script codes are specified.
  switch (locale.languageCode) {
    case 'zh':
      {
        switch (locale.scriptCode) {
          case 'Hant':
            return SiteLocalizationsZhHant();
        }
        break;
      }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return SiteLocalizationsEn();
    case 'zh':
      return SiteLocalizationsZh();
  }

  throw FlutterError(
    'SiteLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
