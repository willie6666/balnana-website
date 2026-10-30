// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'site_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class SiteLocalizationsIt extends SiteLocalizations {
  SiteLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get navFeatures => 'Funzioni';

  @override
  String get navDemo => 'Prova';

  @override
  String get navHosting => 'Self-hosting';

  @override
  String get navFaq => 'FAQ';

  @override
  String get navDocs => 'Documentazione';

  @override
  String get heroEyebrow => 'OPEN SOURCE. SOTTO IL TUO CONTROLLO.';

  @override
  String get heroTitle => 'Bei momenti.\nConti chiari.';

  @override
  String get heroBody =>
      'Viaggi, cene e vita quotidiana. Organizza le spese condivise e conserva i dati sul tuo server.';

  @override
  String get tryDemo => 'Prova la demo';

  @override
  String get selfHost => 'Ospita Balnana';

  @override
  String get development => 'In sviluppo · Android + Web';

  @override
  String get trustSplit => 'Divisione flessibile';

  @override
  String get trustLanguages => '20 lingue';

  @override
  String get trustOpen => 'Open source. Senza pubblicità.';

  @override
  String get trustServer => 'Il tuo server';

  @override
  String get demoLabel => 'PROVATE INSIEME';

  @override
  String get demoTitle => 'Voi fate i programmi.\nNoi facciamo i conti.';

  @override
  String get demoBody => 'Cambia l\'importo e chi ha pagato. Guarda come tornano i conti.';

  @override
  String get scenarioTravel => 'Viaggio';

  @override
  String get scenarioHome => 'Coinquilini';

  @override
  String get scenarioDinner => 'Cena';

  @override
  String get groupTravel => 'Weekend a Kyoto';

  @override
  String get groupHome => 'Il nostro appartamento';

  @override
  String get groupDinner => 'Cena del venerdì';

  @override
  String get demoNotice => 'Demo interattiva · dati fittizi';

  @override
  String get payer => 'Chi ha pagato?';

  @override
  String get balances => 'Il saldo di ciascuno';

  @override
  String get payments => 'Pagamenti suggeriti';

  @override
  String morePayments(int count) {
    return '+$count altri';
  }

  @override
  String get reset => 'Reimposta demo';

  @override
  String get weightedHelp => 'Imposta le quote di ciascuno. Con 0 la persona è esclusa.';

  @override
  String fewerShares(String name) {
    return 'Meno quote per $name';
  }

  @override
  String moreShares(String name) {
    return 'Più quote per $name';
  }

  @override
  String get featureLabel => 'PICCOLI DETTAGLI. GRANDE DIFFERENZA.';

  @override
  String get featureTitle => 'Meno calcoli.\nPiù tempo insieme.';

  @override
  String get featureSplitTitle => 'Giusto non significa sempre uguale.';

  @override
  String get featureSplitBody =>
      'Dividi in parti uguali, per importi esatti o per quote. Più persone possono pagare la stessa spesa.';

  @override
  String get featureSettleTitle => 'Un modo più chiaro di saldare.';

  @override
  String get featureSettleBody =>
      'Scopri chi deve a chi, con suggerimenti che riducono i pagamenti.';

  @override
  String get travelLabel => 'PER IL PROSSIMO VIAGGIO';

  @override
  String get travelTitle => 'Valute diverse.\nLa stessa bella compagnia.';

  @override
  String get travelBody =>
      'Conserva la valuta originale e inserisci il cambio o l\'addebito effettivo della carta. I saldi restano nella valuta del gruppo.';

  @override
  String get screenshotsNote => 'Schermate Android reali · dati fittizi · inglese';

  @override
  String get screenshotExpenses => 'Ogni spesa';

  @override
  String get screenshotForeign => 'Valuta originale';

  @override
  String get screenshotStats => 'Analisi delle spese';

  @override
  String get extraTitle => 'Tutto per il tuo gruppo.';

  @override
  String get recurringTitle => 'Il quotidiano, ricorrente.';

  @override
  String get recurringBody => 'Programma affitto e altre spese ricorrenti.';

  @override
  String get receiptsTitle => 'Conserva i dettagli.';

  @override
  String get receiptsBody => 'Allega ricevute e luoghi alle spese.';

  @override
  String get liveTitle => 'Tutti aggiornati.';

  @override
  String get liveBody => 'I gruppi aperti si aggiornano quando qualcuno aggiunge spese.';

  @override
  String get exportTitle => 'Porta con te la cronologia.';

  @override
  String get exportBody => 'Esporta CSV o importa il gruppo da Settle Up.';

  @override
  String get hostingLabel => 'LE TUE PERSONE. IL TUO SERVER.';

  @override
  String get hostingTitle => 'I tuoi conti.\nAlle tue condizioni.';

  @override
  String get hostingBody =>
      'Esegui Balnana con Docker Compose e PostgreSQL. Decidi tu dove conservare i conti del gruppo.';

  @override
  String get hostingLink => 'Leggi la guida';

  @override
  String get hostingModeLink =>
      'Condividi un link privato. Nessuna registrazione in modalità link.';

  @override
  String get hostingModeAccounts => 'Oppure attiva account con password, Google o OIDC.';

  @override
  String get faqTitle => 'Qualche risposta utile.';

  @override
  String get faqAccountQ => 'Serve un account per tutti?';

  @override
  String get faqAccountA =>
      'In modalità link basta un link privato o un codice QR. In modalità account, l\'accesso dipende dalle impostazioni del server.';

  @override
  String get faqOfflineQ => 'Funziona offline?';

  @override
  String get faqOfflineA =>
      'Su Android i gruppi e le spese in cache restano leggibili quando il server non è raggiungibile. Per aggiungere o modificare serve una connessione.';

  @override
  String get faqCurrencyQ => 'I cambi sono automatici?';

  @override
  String get faqCurrencyA =>
      'Inserisci il cambio o l\'addebito reale della carta. Balnana non recupera cambi in tempo reale.';

  @override
  String get faqPlatformQ => 'Quali piattaforme sono supportate?';

  @override
  String get faqPlatformA =>
      'Attualmente Android e il Web. Non è ancora disponibile una versione iOS.';

  @override
  String get faqCostQ => 'Balnana è gratuito?';

  @override
  String get faqCostA =>
      'È software open source sotto AGPL-3.0. L\'app non richiede abbonamenti; il tuo server può avere costi di hosting.';

  @override
  String get endTitle => 'Il prossimo bel momento\ninizia qui.';

  @override
  String get endBody => 'Riunisci le tue persone. Ti aiutiamo con i numeri.';

  @override
  String get github => 'Vedi il codice';

  @override
  String get reportIssue => 'Segnala un problema';

  @override
  String get footerNote => 'Un progetto open source, fatto per condividere.';

  @override
  String get backHome => 'Torna alla home';

  @override
  String get notFound => 'Questa pagina non c\'è.';

  @override
  String get screenshotOpen => 'Vedi schermata';

  @override
  String get settled => 'Tutti hanno saldato.';

  @override
  String get retry => 'Riprova';

  @override
  String owed(String name) {
    return '$name deve ricevere';
  }

  @override
  String get languageEndonym => 'Italiano';

  @override
  String get languageLabel => 'Lingua';

  @override
  String get themeLabel => 'Tema';

  @override
  String get themeSystem => 'Predefinito di sistema';

  @override
  String get themeLight => 'Chiaro';

  @override
  String get themeDark => 'Scuro';

  @override
  String get amountLabel => 'Importo';

  @override
  String get splitEqual => 'In parti uguali';

  @override
  String get splitShares => 'Quote';

  @override
  String get cancel => 'Annulla';

  @override
  String get invalidAmount => 'Inserisci un importo maggiore di zero.';

  @override
  String get amountTooLarge => 'L\'importo è troppo alto.';
}
