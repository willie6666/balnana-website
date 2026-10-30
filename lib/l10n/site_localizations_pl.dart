// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'site_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class SiteLocalizationsPl extends SiteLocalizations {
  SiteLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get navFeatures => 'Funkcje';

  @override
  String get navDemo => 'Wypróbuj';

  @override
  String get navHosting => 'Własny serwer';

  @override
  String get navFaq => 'FAQ';

  @override
  String get navDocs => 'Dokumentacja';

  @override
  String get heroEyebrow => 'OTWARTY KOD. TWOJA KONTROLA.';

  @override
  String get heroTitle => 'Dobre chwile.\nJasne rozliczenia.';

  @override
  String get heroBody =>
      'Podróże, kolacje i codzienność. Porządkuj wspólne wydatki i przechowuj dane na własnym serwerze.';

  @override
  String get tryDemo => 'Wypróbuj demo';

  @override
  String get selfHost => 'Hostuj Balnana';

  @override
  String get development => 'W rozwoju · Android + Web';

  @override
  String get trustSplit => 'Elastyczny podział';

  @override
  String get trustLanguages => '20 języków';

  @override
  String get trustOpen => 'Otwarty kod. Bez reklam.';

  @override
  String get trustServer => 'Twój serwer';

  @override
  String get demoLabel => 'WYPRÓBUJCIE RAZEM';

  @override
  String get demoTitle => 'Planujcie.\nMy policzymy.';

  @override
  String get demoBody => 'Zmień kwotę i osobę płacącą. Zobacz, jak bilans się wyrównuje.';

  @override
  String get scenarioTravel => 'Podróż';

  @override
  String get scenarioHome => 'Współlokatorzy';

  @override
  String get scenarioDinner => 'Kolacja';

  @override
  String get groupTravel => 'Weekend w Kioto';

  @override
  String get groupHome => 'Nasze mieszkanie';

  @override
  String get groupDinner => 'Piątkowa kolacja';

  @override
  String get demoNotice => 'Interaktywne demo · fikcyjne dane';

  @override
  String get payer => 'Kto zapłacił?';

  @override
  String get balances => 'Saldo każdej osoby';

  @override
  String get payments => 'Sugerowane płatności';

  @override
  String morePayments(int count) {
    return '+$count więcej';
  }

  @override
  String get reset => 'Resetuj demo';

  @override
  String get weightedHelp =>
      'Ustaw liczbę udziałów każdej osoby. 0 oznacza, że ktoś nie uczestniczy.';

  @override
  String fewerShares(String name) {
    return 'Mniej udziałów: $name';
  }

  @override
  String moreShares(String name) {
    return 'Więcej udziałów: $name';
  }

  @override
  String get featureLabel => 'MAŁE DETALE. DUŻA RÓŻNICA.';

  @override
  String get featureTitle => 'Mniej liczenia.\nWięcej bycia razem.';

  @override
  String get featureSplitTitle => 'Sprawiedliwie nie zawsze znaczy po równo.';

  @override
  String get featureSplitBody =>
      'Dziel po równo, według kwot lub udziałów. Kilka osób może zapłacić za ten sam wydatek.';

  @override
  String get featureSettleTitle => 'Prostsze rozliczenia.';

  @override
  String get featureSettleBody =>
      'Sprawdź, kto komu jest winien, i skorzystaj z sugestii ograniczających liczbę przelewów.';

  @override
  String get travelLabel => 'NA NASTĘPNĄ PODRÓŻ';

  @override
  String get travelTitle => 'Różne waluty.\nTo samo towarzystwo.';

  @override
  String get travelBody =>
      'Zachowaj oryginalną walutę i podaj kurs lub faktyczne obciążenie karty. Salda pozostają w walucie grupy.';

  @override
  String get screenshotsNote => 'Prawdziwe ekrany Android · fikcyjne dane · angielski';

  @override
  String get screenshotExpenses => 'Każdy wydatek';

  @override
  String get screenshotForeign => 'Oryginalna waluta';

  @override
  String get screenshotStats => 'Analiza wydatków';

  @override
  String get extraTitle => 'Wszystko dla waszej grupy.';

  @override
  String get recurringTitle => 'Codzienność w cyklu.';

  @override
  String get recurringBody => 'Zaplanuj czynsz i inne wydatki cykliczne.';

  @override
  String get receiptsTitle => 'Zachowaj szczegóły.';

  @override
  String get receiptsBody => 'Dołącz paragony i miejsca do wydatków.';

  @override
  String get liveTitle => 'Wszyscy na bieżąco.';

  @override
  String get liveBody => 'Otwarte grupy odświeżają się po dodaniu wydatków.';

  @override
  String get exportTitle => 'Zabierz historię ze sobą.';

  @override
  String get exportBody => 'Eksportuj CSV lub importuj grupę z Settle Up.';

  @override
  String get hostingLabel => 'TWOI LUDZIE. TWÓJ SERWER.';

  @override
  String get hostingTitle => 'Twoje rozliczenia.\nTwoje zasady.';

  @override
  String get hostingBody =>
      'Uruchom Balnana z Docker Compose i PostgreSQL. Ty wybierasz, gdzie są dane grupy.';

  @override
  String get hostingLink => 'Przeczytaj instrukcję';

  @override
  String get hostingModeLink => 'Udostępnij prywatny link. W trybie linków bez rejestracji.';

  @override
  String get hostingModeAccounts => 'Lub włącz konta z hasłem, Google albo OIDC.';

  @override
  String get faqTitle => 'Warto wiedzieć.';

  @override
  String get faqAccountQ => 'Czy każdy musi mieć konto?';

  @override
  String get faqAccountA =>
      'W trybie linków wystarczy prywatny link lub kod QR. W trybie kont dostęp zależy od ustawień serwera.';

  @override
  String get faqOfflineQ => 'Czy działa offline?';

  @override
  String get faqOfflineA =>
      'Na Androidzie zapisane w pamięci podręcznej grupy i wydatki są czytelne, gdy serwer jest niedostępny. Dodawanie i edycja wymagają połączenia.';

  @override
  String get faqCurrencyQ => 'Czy kursy są automatyczne?';

  @override
  String get faqCurrencyA =>
      'Wpisz kurs lub rzeczywistą kwotę obciążenia karty. Balnana nie pobiera kursów na żywo.';

  @override
  String get faqPlatformQ => 'Jakie platformy są obsługiwane?';

  @override
  String get faqPlatformA =>
      'Obecnie Android i przeglądarka. Wersja na iOS nie jest jeszcze dostępna.';

  @override
  String get faqCostQ => 'Czy Balnana jest darmowe?';

  @override
  String get faqCostA =>
      'To oprogramowanie open source na licencji AGPL-3.0. Bez subskrypcji aplikacji; własny serwer może generować koszty hostingu.';

  @override
  String get endTitle => 'Kolejne dobre chwile\nzaczynają się tutaj.';

  @override
  String get endBody => 'Zbierz swoich ludzi. Pomożemy z liczbami.';

  @override
  String get github => 'Zobacz kod';

  @override
  String get reportIssue => 'Zgłoś problem';

  @override
  String get footerNote => 'Otwarty projekt stworzony do dzielenia się.';

  @override
  String get backHome => 'Strona główna';

  @override
  String get notFound => 'Tej strony tu nie ma.';

  @override
  String get screenshotOpen => 'Zobacz zrzut ekranu';

  @override
  String get settled => 'Wszyscy są rozliczeni.';

  @override
  String get retry => 'Ponów';

  @override
  String owed(String name) {
    return '$name ma do odebrania';
  }

  @override
  String get languageEndonym => 'Polski';

  @override
  String get languageLabel => 'Język';

  @override
  String get themeLabel => 'Motyw';

  @override
  String get themeSystem => 'Domyślny systemowy';

  @override
  String get themeLight => 'Jasny';

  @override
  String get themeDark => 'Ciemny';

  @override
  String get amountLabel => 'Kwota';

  @override
  String get splitEqual => 'Po równo';

  @override
  String get splitShares => 'Udziały';

  @override
  String get cancel => 'Anuluj';

  @override
  String get invalidAmount => 'Wpisz kwotę większą od zera.';

  @override
  String get amountTooLarge => 'Ta kwota jest za duża.';
}
