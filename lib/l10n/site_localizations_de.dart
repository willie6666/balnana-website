// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'site_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class SiteLocalizationsDe extends SiteLocalizations {
  SiteLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get navFeatures => 'Funktionen';

  @override
  String get navDemo => 'Ausprobieren';

  @override
  String get navHosting => 'Selbst hosten';

  @override
  String get navFaq => 'FAQ';

  @override
  String get navDocs => 'Doku';

  @override
  String get heroEyebrow => 'OPEN SOURCE. IN DEINER HAND.';

  @override
  String get heroTitle => 'Gute Zeiten.\nKlare Abrechnung.';

  @override
  String get heroBody =>
      'Reisen, Essen, Alltag. Behalte gemeinsame Ausgaben im Blick und eure Daten auf deinem eigenen Server.';

  @override
  String get tryDemo => 'Demo ausprobieren';

  @override
  String get selfHost => 'Balnana selbst hosten';

  @override
  String get development => 'In Entwicklung · Android + Web';

  @override
  String get trustSplit => 'Flexibel aufteilen';

  @override
  String get trustLanguages => '20 Sprachen';

  @override
  String get trustOpen => 'Open Source. Ohne Werbung.';

  @override
  String get trustServer => 'Dein eigener Server';

  @override
  String get demoLabel => 'GEMEINSAM AUSPROBIEREN';

  @override
  String get demoTitle => 'Ihr macht die Pläne.\nWir rechnen.';

  @override
  String get demoBody => 'Ändere den Betrag und wer bezahlt hat. Sieh zu, wie alles aufgeht.';

  @override
  String get scenarioTravel => 'Reise';

  @override
  String get scenarioHome => 'Wohngemeinschaft';

  @override
  String get scenarioDinner => 'Abendessen';

  @override
  String get groupTravel => 'Wochenende in Kyoto';

  @override
  String get groupHome => 'Unsere Wohnung';

  @override
  String get groupDinner => 'Freitagabend';

  @override
  String get demoNotice => 'Interaktive Demo · fiktive Daten';

  @override
  String get payer => 'Wer hat bezahlt?';

  @override
  String get balances => 'Alle Salden';

  @override
  String get payments => 'Zahlungsvorschläge';

  @override
  String morePayments(int count) {
    return '+$count weitere';
  }

  @override
  String get reset => 'Demo zurücksetzen';

  @override
  String get weightedHelp =>
      'Lege die Anteile jeder Person fest. Mit 0 ist jemand nicht beteiligt.';

  @override
  String fewerShares(String name) {
    return 'Weniger Anteile für $name';
  }

  @override
  String moreShares(String name) {
    return 'Mehr Anteile für $name';
  }

  @override
  String get featureLabel => 'KLEINE DETAILS. GROSSER UNTERSCHIED.';

  @override
  String get featureTitle => 'Weniger rechnen.\nMehr zusammen sein.';

  @override
  String get featureSplitTitle => 'Fair heißt nicht immer gleich.';

  @override
  String get featureSplitBody =>
      'Gleichmäßig, nach genauen Beträgen oder Anteilen aufteilen. Auch mehrere Personen können eine Ausgabe bezahlen.';

  @override
  String get featureSettleTitle => 'Einfacher ausgleichen.';

  @override
  String get featureSettleBody =>
      'Sieh, wer wem etwas schuldet, mit Vorschlägen für weniger Zahlungen.';

  @override
  String get travelLabel => 'FÜR DIE NÄCHSTE REISE';

  @override
  String get travelTitle => 'Andere Währungen.\nDieselbe gute Gesellschaft.';

  @override
  String get travelBody =>
      'Behalte die Originalwährung und gib den Kurs oder die tatsächliche Kartenbelastung ein. Salden bleiben in der Gruppenwährung.';

  @override
  String get screenshotsNote => 'Echte Android-Ansichten · fiktive Daten · Englisch';

  @override
  String get screenshotExpenses => 'Jede Ausgabe';

  @override
  String get screenshotForeign => 'Originalwährung';

  @override
  String get screenshotStats => 'Ausgaben im Überblick';

  @override
  String get extraTitle => 'Alles für eure Gruppe.';

  @override
  String get recurringTitle => 'Alltag, der sich wiederholt.';

  @override
  String get recurringBody => 'Plane Miete und andere wiederkehrende Ausgaben.';

  @override
  String get receiptsTitle => 'Details behalten.';

  @override
  String get receiptsBody => 'Belege und Orte zu Ausgaben hinzufügen.';

  @override
  String get liveTitle => 'Alle auf dem gleichen Stand.';

  @override
  String get liveBody => 'Offene Gruppen aktualisieren sich bei neuen Ausgaben.';

  @override
  String get exportTitle => 'Deine Historie zum Mitnehmen.';

  @override
  String get exportBody => 'CSV exportieren oder aus Settle Up importieren.';

  @override
  String get hostingLabel => 'DEINE LEUTE. DEIN SERVER.';

  @override
  String get hostingTitle => 'Deine Abrechnung.\nDeine Bedingungen.';

  @override
  String get hostingBody =>
      'Betreibe Balnana mit Docker Compose und PostgreSQL. Du entscheidest, wo eure Konten liegen.';

  @override
  String get hostingLink => 'Anleitung lesen';

  @override
  String get hostingModeLink => 'Privaten Link teilen. Im Link-Modus ohne Anmeldung.';

  @override
  String get hostingModeAccounts => 'Oder Konten mit Passwort, Google oder OIDC aktivieren.';

  @override
  String get faqTitle => 'Gut zu wissen.';

  @override
  String get faqAccountQ => 'Brauchen alle ein Konto?';

  @override
  String get faqAccountA =>
      'Im Link-Modus reicht ein privater Link oder QR-Code. Im Kontomodus hängt der Zugriff von den Servereinstellungen ab.';

  @override
  String get faqOfflineQ => 'Geht das auch offline?';

  @override
  String get faqOfflineA =>
      'Unter Android bleiben zwischengespeicherte Gruppen und Ausgaben lesbar, wenn der Server nicht erreichbar ist. Hinzufügen und Ändern erfordert eine Verbindung.';

  @override
  String get faqCurrencyQ => 'Sind Wechselkurse automatisch?';

  @override
  String get faqCurrencyA =>
      'Gib den Kurs oder die tatsächliche Kartenbelastung ein. Balnana ruft keine Live-Wechselkurse ab.';

  @override
  String get faqPlatformQ => 'Welche Plattformen werden unterstützt?';

  @override
  String get faqPlatformA =>
      'Aktuell Android und das Web. Eine iOS-Version ist noch nicht verfügbar.';

  @override
  String get faqCostQ => 'Ist Balnana kostenlos?';

  @override
  String get faqCostA =>
      'Balnana ist Open Source unter AGPL-3.0, ohne App-Abo. Für deinen eigenen Server können Hostingkosten anfallen.';

  @override
  String get endTitle => 'Die nächste gute Zeit\nbeginnt hier.';

  @override
  String get endBody => 'Bring deine Leute mit. Wir helfen mit den Zahlen.';

  @override
  String get github => 'Quellcode ansehen';

  @override
  String get reportIssue => 'Problem melden';

  @override
  String get footerNote => 'Ein Open-Source-Projekt zum Teilen.';

  @override
  String get backHome => 'Zur Startseite';

  @override
  String get notFound => 'Diese Seite gibt es nicht.';

  @override
  String get screenshotOpen => 'Screenshot ansehen';

  @override
  String get settled => 'Alle Salden sind ausgeglichen.';

  @override
  String get retry => 'Erneut versuchen';

  @override
  String owed(String name) {
    return '$name bekommt noch';
  }

  @override
  String get languageEndonym => 'Deutsch';

  @override
  String get languageLabel => 'Sprache';

  @override
  String get themeLabel => 'Design';

  @override
  String get themeSystem => 'Wie im System';

  @override
  String get themeLight => 'Hell';

  @override
  String get themeDark => 'Dunkel';

  @override
  String get amountLabel => 'Betrag';

  @override
  String get splitEqual => 'Gleichmäßig';

  @override
  String get splitShares => 'Anteile';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get invalidAmount => 'Gib einen Betrag größer als null ein.';

  @override
  String get amountTooLarge => 'Dieser Betrag ist zu groß.';
}
