// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'site_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class SiteLocalizationsNl extends SiteLocalizations {
  SiteLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get navFeatures => 'Functies';

  @override
  String get navDemo => 'Proberen';

  @override
  String get navHosting => 'Zelf hosten';

  @override
  String get navFaq => 'FAQ';

  @override
  String get navDocs => 'Documentatie';

  @override
  String get heroEyebrow => 'OPEN SOURCE. IN EIGEN HAND.';

  @override
  String get heroTitle => 'Mooie momenten.\nHeldere rekeningen.';

  @override
  String get heroBody =>
      'Reizen, etentjes en het dagelijks leven. Houd gezamenlijke uitgaven bij en bewaar gegevens op je eigen server.';

  @override
  String get tryDemo => 'Probeer de demo';

  @override
  String get selfHost => 'Host Balnana zelf';

  @override
  String get development => 'In ontwikkeling · Android + Web';

  @override
  String get trustSplit => 'Flexibel verdelen';

  @override
  String get trustLanguages => '20 talen';

  @override
  String get trustOpen => 'Open source. Geen reclame.';

  @override
  String get trustServer => 'Je eigen server';

  @override
  String get demoLabel => 'PROBEER HET SAMEN';

  @override
  String get demoTitle => 'Maak plannen.\nWij rekenen.';

  @override
  String get demoBody => 'Verander het bedrag en wie betaald heeft. Zie hoe alles in balans komt.';

  @override
  String get scenarioTravel => 'Reis';

  @override
  String get scenarioHome => 'Huisgenoten';

  @override
  String get scenarioDinner => 'Etentje';

  @override
  String get groupTravel => 'Weekend in Kyoto';

  @override
  String get groupHome => 'Ons appartement';

  @override
  String get groupDinner => 'Vrijdagavondeten';

  @override
  String get demoNotice => 'Interactieve demo · fictieve gegevens';

  @override
  String get payer => 'Wie heeft betaald?';

  @override
  String get balances => 'Ieders saldo';

  @override
  String get payments => 'Voorgestelde betalingen';

  @override
  String morePayments(int count) {
    return '+$count meer';
  }

  @override
  String get reset => 'Demo herstellen';

  @override
  String get weightedHelp => 'Stel per persoon het aantal delen in. Met 0 doet iemand niet mee.';

  @override
  String fewerShares(String name) {
    return 'Minder delen voor $name';
  }

  @override
  String moreShares(String name) {
    return 'Meer delen voor $name';
  }

  @override
  String get featureLabel => 'KLEINE DETAILS. GROOT VERSCHIL.';

  @override
  String get featureTitle => 'Minder rekenen.\nMeer samen zijn.';

  @override
  String get featureSplitTitle => 'Eerlijk is niet altijd gelijk.';

  @override
  String get featureSplitBody =>
      'Verdeel gelijk, met exacte bedragen of delen. Meerdere personen kunnen dezelfde uitgave betalen.';

  @override
  String get featureSettleTitle => 'Duidelijker verrekenen.';

  @override
  String get featureSettleBody =>
      'Zie wie aan wie moet betalen, met suggesties voor minder betalingen.';

  @override
  String get travelLabel => 'VOOR DE VOLGENDE REIS';

  @override
  String get travelTitle => 'Andere valuta.\nHetzelfde fijne gezelschap.';

  @override
  String get travelBody =>
      'Bewaar de oorspronkelijke valuta en vul de koers of de echte kaartafschrijving in. Saldo\'s blijven in de groepsvaluta.';

  @override
  String get screenshotsNote => 'Echte Android-schermen · fictieve gegevens · Engels';

  @override
  String get screenshotExpenses => 'Elke uitgave';

  @override
  String get screenshotForeign => 'Oorspronkelijke valuta';

  @override
  String get screenshotStats => 'Uitgavenoverzicht';

  @override
  String get extraTitle => 'Alles voor je groep.';

  @override
  String get recurringTitle => 'Elke dag, opnieuw.';

  @override
  String get recurringBody => 'Plan huur en andere terugkerende uitgaven.';

  @override
  String get receiptsTitle => 'Bewaar de details.';

  @override
  String get receiptsBody => 'Voeg bonnetjes en locaties toe aan uitgaven.';

  @override
  String get liveTitle => 'Iedereen op de hoogte.';

  @override
  String get liveBody => 'Open groepen vernieuwen zodra iemand uitgaven toevoegt.';

  @override
  String get exportTitle => 'Neem je historie mee.';

  @override
  String get exportBody => 'Exporteer CSV of importeer je groep uit Settle Up.';

  @override
  String get hostingLabel => 'JOUW MENSEN. JOUW SERVER.';

  @override
  String get hostingTitle => 'Jouw rekeningen.\nJouw voorwaarden.';

  @override
  String get hostingBody =>
      'Draai Balnana met Docker Compose en PostgreSQL. Jij kiest waar de groepsrekeningen staan.';

  @override
  String get hostingLink => 'Lees de handleiding';

  @override
  String get hostingModeLink => 'Deel een privélink. Zonder registratie in linkmodus.';

  @override
  String get hostingModeAccounts => 'Of schakel accounts in met wachtwoord, Google of OIDC.';

  @override
  String get faqTitle => 'Goed om te weten.';

  @override
  String get faqAccountQ => 'Heeft iedereen een account nodig?';

  @override
  String get faqAccountA =>
      'In linkmodus is een privélink of QR-code genoeg. In accountmodus hangt toegang af van de serverinstellingen.';

  @override
  String get faqOfflineQ => 'Werkt het offline?';

  @override
  String get faqOfflineA =>
      'Op Android blijven gecachte groepen en uitgaven leesbaar als de server onbereikbaar is. Toevoegen of wijzigen vereist verbinding.';

  @override
  String get faqCurrencyQ => 'Zijn wisselkoersen automatisch?';

  @override
  String get faqCurrencyA =>
      'Vul een koers of de werkelijke kaartafschrijving in. Balnana haalt geen live wisselkoersen op.';

  @override
  String get faqPlatformQ => 'Welke platforms werken?';

  @override
  String get faqPlatformA => 'Momenteel Android en het web. Er is nog geen iOS-versie.';

  @override
  String get faqCostQ => 'Is Balnana gratis?';

  @override
  String get faqCostA =>
      'Balnana is open source onder AGPL-3.0. Geen app-abonnement; je eigen server hosten kan kosten meebrengen.';

  @override
  String get endTitle => 'Het volgende mooie moment\nbegint hier.';

  @override
  String get endBody => 'Breng je mensen samen. Wij helpen met de cijfers.';

  @override
  String get github => 'Bekijk de code';

  @override
  String get reportIssue => 'Meld een probleem';

  @override
  String get footerNote => 'Een open-sourceproject, gemaakt om te delen.';

  @override
  String get backHome => 'Naar de homepage';

  @override
  String get notFound => 'Deze pagina bestaat niet.';

  @override
  String get screenshotOpen => 'Bekijk screenshot';

  @override
  String get settled => 'Iedereen heeft het saldo verrekend.';

  @override
  String get retry => 'Opnieuw proberen';

  @override
  String owed(String name) {
    return '$name krijgt nog';
  }

  @override
  String get languageEndonym => 'Nederlands';

  @override
  String get languageLabel => 'Taal';

  @override
  String get themeLabel => 'Thema';

  @override
  String get themeSystem => 'Standaard van apparaat';

  @override
  String get themeLight => 'Licht';

  @override
  String get themeDark => 'Donker';

  @override
  String get amountLabel => 'Bedrag';

  @override
  String get splitEqual => 'Gelijk verdelen';

  @override
  String get splitShares => 'Aandelen';

  @override
  String get cancel => 'Annuleren';

  @override
  String get invalidAmount => 'Vul een bedrag groter dan nul in.';

  @override
  String get amountTooLarge => 'Dat bedrag is te hoog.';
}
