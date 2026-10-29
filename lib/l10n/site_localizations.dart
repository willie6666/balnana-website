import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'site_localizations_ar.dart';
import 'site_localizations_de.dart';
import 'site_localizations_en.dart';
import 'site_localizations_es.dart';
import 'site_localizations_fr.dart';
import 'site_localizations_hi.dart';
import 'site_localizations_id.dart';
import 'site_localizations_it.dart';
import 'site_localizations_ja.dart';
import 'site_localizations_ko.dart';
import 'site_localizations_nl.dart';
import 'site_localizations_pl.dart';
import 'site_localizations_pt.dart';
import 'site_localizations_ru.dart';
import 'site_localizations_th.dart';
import 'site_localizations_tr.dart';
import 'site_localizations_uk.dart';
import 'site_localizations_vi.dart';
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
    Locale('ar'),
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('hi'),
    Locale('id'),
    Locale('it'),
    Locale('ja'),
    Locale('ko'),
    Locale('nl'),
    Locale('pl'),
    Locale('pt'),
    Locale('ru'),
    Locale('th'),
    Locale('tr'),
    Locale('uk'),
    Locale('vi'),
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

  /// Official website: heroEyebrow. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'OPEN SOURCE. YOURS TO RUN.'**
  String get heroEyebrow;

  /// Official website: heroTitle. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Good times.\nClear balances.'**
  String get heroTitle;

  /// Official website: heroBody. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Trips, dinners, everyday life. Keep shared expenses clear and your group\'s data on a server you own.'**
  String get heroBody;

  /// Official website: tryDemo. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Try the demo'**
  String get tryDemo;

  /// Official website: selfHost. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Self-host Balnana'**
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
  /// **'Open source. No ads.'**
  String get trustOpen;

  /// Official website: trustServer. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Your own server'**
  String get trustServer;

  /// Official website: demoLabel. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'TRY IT TOGETHER'**
  String get demoLabel;

  /// Official website: demoTitle. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Make plans.\nWe\'ll do the maths.'**
  String get demoTitle;

  /// Official website: demoBody. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Change the amount. Choose who paid. Watch it all balance out.'**
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
  /// **'Interactive demo · fictional data'**
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
  /// **'Suggested payments'**
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

  /// Official website: weightedHelp. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Alex has 2 shares; everyone else has 1.'**
  String get weightedHelp;

  /// Official website: featureLabel. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'LITTLE DETAILS. BIG DIFFERENCE.'**
  String get featureLabel;

  /// Official website: featureTitle. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Less figuring out.\nMore being together.'**
  String get featureTitle;

  /// Official website: featureSplitTitle. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Fair doesn\'t always mean equal.'**
  String get featureSplitTitle;

  /// Official website: featureSplitBody. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Split equally, by exact amounts or by shares. Several people can pay for the same expense.'**
  String get featureSplitBody;

  /// Official website: featureSettleTitle. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'A clearer way to settle.'**
  String get featureSettleTitle;

  /// Official website: featureSettleBody. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Know who owes whom, with suggestions that reduce the number of payments.'**
  String get featureSettleBody;

  /// Official website: travelLabel. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'BUILT FOR THE NEXT TRIP'**
  String get travelLabel;

  /// Official website: travelTitle. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Different currencies.\nSame good company.'**
  String get travelTitle;

  /// Official website: travelBody. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Keep the original currency. Enter the rate or your card\'s actual charge. Balances stay in the group\'s currency.'**
  String get travelBody;

  /// Official website: screenshotsNote. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Actual Android screens · fictional data · English'**
  String get screenshotsNote;

  /// Official website: screenshotExpenses. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Every expense'**
  String get screenshotExpenses;

  /// Official website: screenshotForeign. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Original currency'**
  String get screenshotForeign;

  /// Official website: screenshotStats. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Spending insights'**
  String get screenshotStats;

  /// Official website: extraTitle. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Everything your group needs.'**
  String get extraTitle;

  /// Official website: recurringTitle. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'The everyday, on repeat.'**
  String get recurringTitle;

  /// Official website: recurringBody. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Schedule rent and other recurring expenses.'**
  String get recurringBody;

  /// Official website: receiptsTitle. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Keep the little details.'**
  String get receiptsTitle;

  /// Official website: receiptsBody. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Attach receipts and save places alongside expenses.'**
  String get receiptsBody;

  /// Official website: liveTitle. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Stay on the same page.'**
  String get liveTitle;

  /// Official website: liveBody. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Open groups refresh as others add expenses.'**
  String get liveBody;

  /// Official website: exportTitle. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Take your history with you.'**
  String get exportTitle;

  /// Official website: exportBody. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Export CSV or import your group from Settle Up.'**
  String get exportBody;

  /// Official website: hostingLabel. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'YOUR PEOPLE. YOUR SERVER.'**
  String get hostingLabel;

  /// Official website: hostingTitle. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Your balance.\nOn your terms.'**
  String get hostingTitle;

  /// Official website: hostingBody. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Run Balnana with Docker Compose and PostgreSQL. You choose where your group\'s accounts live.'**
  String get hostingBody;

  /// Official website: hostingLink. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Read the setup guide'**
  String get hostingLink;

  /// Official website: hostingModeLink. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Share a private link. No sign-up in link mode.'**
  String get hostingModeLink;

  /// Official website: hostingModeAccounts. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Or enable accounts with password, Google or OIDC.'**
  String get hostingModeAccounts;

  /// Official website: faqTitle. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'A few things worth knowing.'**
  String get faqTitle;

  /// Official website: faqAccountQ. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Does everyone need an account?'**
  String get faqAccountQ;

  /// Official website: faqAccountA. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'In link mode, a private link or QR code is enough. In accounts mode, access depends on your server\'s settings.'**
  String get faqAccountA;

  /// Official website: faqOfflineQ. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Can I use it offline?'**
  String get faqOfflineQ;

  /// Official website: faqOfflineA. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'On Android, previously cached groups and expenses remain readable when the server is unreachable. Adding or changing expenses needs a connection.'**
  String get faqOfflineA;

  /// Official website: faqCurrencyQ. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Are exchange rates automatic?'**
  String get faqCurrencyQ;

  /// Official website: faqCurrencyA. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Enter a rate yourself, or the actual amount charged to your card. Balnana does not fetch live exchange rates.'**
  String get faqCurrencyA;

  /// Official website: faqPlatformQ. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Which platforms are supported?'**
  String get faqPlatformQ;

  /// Official website: faqPlatformA. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Android and the web are supported today. An iOS release is not currently available.'**
  String get faqPlatformA;

  /// Official website: faqCostQ. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Is Balnana free?'**
  String get faqCostQ;

  /// Official website: faqCostA. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Balnana is open-source software under AGPL-3.0. There is no app subscription; running your own server may have hosting costs.'**
  String get faqCostA;

  /// Official website: endTitle. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Your next good time\nstarts here.'**
  String get endTitle;

  /// Official website: endBody. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Bring your people. We\'ll help with the numbers.'**
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
  /// **'An open-source project, made for sharing.'**
  String get footerNote;

  /// Official website: backHome. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'Back to home'**
  String get backHome;

  /// Official website: notFound. Keep product names and named services unchanged.
  ///
  /// In en, this message translates to:
  /// **'That page isn\'t here.'**
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
  bool isSupported(Locale locale) => <String>[
    'ar',
    'de',
    'en',
    'es',
    'fr',
    'hi',
    'id',
    'it',
    'ja',
    'ko',
    'nl',
    'pl',
    'pt',
    'ru',
    'th',
    'tr',
    'uk',
    'vi',
    'zh',
  ].contains(locale.languageCode);

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
    case 'ar':
      return SiteLocalizationsAr();
    case 'de':
      return SiteLocalizationsDe();
    case 'en':
      return SiteLocalizationsEn();
    case 'es':
      return SiteLocalizationsEs();
    case 'fr':
      return SiteLocalizationsFr();
    case 'hi':
      return SiteLocalizationsHi();
    case 'id':
      return SiteLocalizationsId();
    case 'it':
      return SiteLocalizationsIt();
    case 'ja':
      return SiteLocalizationsJa();
    case 'ko':
      return SiteLocalizationsKo();
    case 'nl':
      return SiteLocalizationsNl();
    case 'pl':
      return SiteLocalizationsPl();
    case 'pt':
      return SiteLocalizationsPt();
    case 'ru':
      return SiteLocalizationsRu();
    case 'th':
      return SiteLocalizationsTh();
    case 'tr':
      return SiteLocalizationsTr();
    case 'uk':
      return SiteLocalizationsUk();
    case 'vi':
      return SiteLocalizationsVi();
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
