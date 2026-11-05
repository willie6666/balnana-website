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
  /// **'Try it out'**
  String get navDemo;

  /// Official website: navHosting. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Self-host'**
  String get navHosting;

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
  /// **'Keep track of\nwho paid what.'**
  String get heroTitle;

  /// Official website: heroBody. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Away for the weekend or sharing a flat? Add what everyone paid, and Balnana works out each person\'s share and who owes whom.'**
  String get heroBody;

  /// Official website: tryDemo. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Try the demo'**
  String get tryDemo;

  /// Official website: selfHost. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Self-host'**
  String get selfHost;

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

  /// Official website: trustServer. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Run on your own server'**
  String get trustServer;

  /// Official website: demoLabel. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Try splitting a bill'**
  String get demoLabel;

  /// Official website: demoTitle. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'How would you\nsplit this one?'**
  String get demoTitle;

  /// Official website: demoBody. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Change the amount, pick who paid, or adjust each person\'s shares. The balances below update as you go.'**
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
  /// **'Sample data — change anything you like'**
  String get demoNotice;

  /// Official website: payer. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Who paid?'**
  String get payer;

  /// Official website: balances. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Everyone\'s balance'**
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
  /// **'Reset demo'**
  String get reset;

  /// Official website: help under the share counters in the demo's Shares mode.
  ///
  /// In en, this message translates to:
  /// **'Choose how many shares each person pays. Set it to 0 if they\'re sitting this one out.'**
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
  /// **'Ways to split'**
  String get featureLabel;

  /// Official website: featureTitle. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'You don\'t have to\nsplit every bill equally.'**
  String get featureTitle;

  /// Official website: featureSplitTitle. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Equal shares or different amounts'**
  String get featureSplitTitle;

  /// Official website: featureSplitBody. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Someone had a smaller meal? Adjust their share or enter an exact amount. You can also record several people paying for one expense.'**
  String get featureSplitBody;

  /// Official website: featureSettleTitle. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'See who needs to pay whom'**
  String get featureSettleTitle;

  /// Official website: featureSettleBody. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'When it is time to settle up, Balnana suggests payments so everyone can make fewer transfers.'**
  String get featureSettleBody;

  /// Official website: travelLabel. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'For trips abroad'**
  String get travelLabel;

  /// Official website: travelTitle. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Keep different currencies\nin the same group.'**
  String get travelTitle;

  /// Official website: travelBody. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Record an expense in the currency you paid, then enter the exchange rate or the amount charged to your card. Balances use the group\'s currency.'**
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
  /// **'A few more useful things'**
  String get extraTitle;

  /// Official website: recurringTitle. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Recurring expenses'**
  String get recurringTitle;

  /// Official website: recurringBody. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Schedule rent and other regular bills instead of adding them each time.'**
  String get recurringBody;

  /// Official website: receiptsTitle. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Receipts and places'**
  String get receiptsTitle;

  /// Official website: receiptsBody. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Attach a receipt to find it later, and save where you spent the money.'**
  String get receiptsBody;

  /// Official website: liveTitle. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Live updates'**
  String get liveTitle;

  /// Official website: liveBody. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'While your group is open, new expenses appear as others add them.'**
  String get liveBody;

  /// Official website: exportTitle. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Import and export'**
  String get exportTitle;

  /// Official website: exportBody. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Export your expenses as CSV, or bring over a group from Settle Up.'**
  String get exportBody;

  /// Official website: hostingLabel. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Self-host'**
  String get hostingLabel;

  /// Official website: hostingTitle. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Run your own server.\nInvite your friends.'**
  String get hostingTitle;

  /// Official website: hostingBody. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Start Balnana with Docker Compose. Expenses are stored in PostgreSQL on your server, and the setup steps are in the Docs.'**
  String get hostingBody;

  /// Official website: hostingLink. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Self-host guide'**
  String get hostingLink;

  /// Official website: hostingModeLink. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Share a private link or QR code so people can join without signing up.'**
  String get hostingModeLink;

  /// Official website: hostingModeAccounts. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Prefer accounts? Enable sign-in with a password, Google or OIDC.'**
  String get hostingModeAccounts;

  /// Official website: faqTitle. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Common questions'**
  String get faqTitle;

  /// Official website: faqAccountQ. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Does everyone need an account?'**
  String get faqAccountQ;

  /// Official website: faqAccountA. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'With link mode, a private link or QR code is enough to join. Accounts mode requires sign-in, with access controlled by your server\'s settings.'**
  String get faqAccountA;

  /// Official website: faqOfflineQ. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Can I use it offline?'**
  String get faqOfflineQ;

  /// Official website: faqOfflineA. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'On Android, you can read cached expenses and add new expenses or payments offline. They upload when you reconnect. Editing existing expenses and uploading receipts still need a connection.'**
  String get faqOfflineA;

  /// Official website: faqCurrencyQ. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Are exchange rates automatic?'**
  String get faqCurrencyQ;

  /// Official website: faqCurrencyA. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'If your server has exchange-rate lookup enabled, Balnana fills in a reference rate when you pick a foreign currency. You can change it or enter the amount charged to your card.'**
  String get faqCurrencyA;

  /// Official website: faqPlatformQ. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Which platforms are supported?'**
  String get faqPlatformQ;

  /// Official website: faqPlatformA. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'There is an Android app and a web app. There is no iOS app yet.'**
  String get faqPlatformA;

  /// Official website: faqCostQ. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Is Balnana free?'**
  String get faqCostQ;

  /// Official website: faqCostA. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Balnana is open source under AGPL-3.0, with no app subscription. You cover any hosting costs when you run your own server.'**
  String get faqCostA;

  /// Official website: endTitle. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Want to give it a go?'**
  String get endTitle;

  /// Official website: endBody. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Follow the Docs to start your server, then invite your friends to a group.'**
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
  /// **'Balnana is an open-source app for shared expenses.'**
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
