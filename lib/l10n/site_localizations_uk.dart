// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'site_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Ukrainian (`uk`).
class SiteLocalizationsUk extends SiteLocalizations {
  SiteLocalizationsUk([String locale = 'uk']) : super(locale);

  @override
  String get navFeatures => 'Можливості';

  @override
  String get navDemo => 'Спробувати';

  @override
  String get navHosting => 'Власний сервер';

  @override
  String get navFaq => 'Питання';

  @override
  String get navDocs => 'Документація';

  @override
  String get heroEyebrow => 'ВІДКРИТИЙ КОД. ВАШ КОНТРОЛЬ.';

  @override
  String get heroTitle => 'Гарні миті.\nЗрозумілі розрахунки.';

  @override
  String get heroBody =>
      'Подорожі, вечері та щоденні справи. Ведіть спільні витрати й зберігайте дані на власному сервері.';

  @override
  String get tryDemo => 'Спробувати демо';

  @override
  String get selfHost => 'Розгорнути Balnana';

  @override
  String get development => 'У розробці · Android + Web';

  @override
  String get trustSplit => 'Гнучкий розподіл';

  @override
  String get trustLanguages => '20 мов';

  @override
  String get trustOpen => 'Відкритий код. Без реклами.';

  @override
  String get trustServer => 'Ваш сервер';

  @override
  String get demoLabel => 'СПРОБУЙТЕ РАЗОМ';

  @override
  String get demoTitle => 'Плануйте.\nМи порахуємо.';

  @override
  String get demoBody => 'Змініть суму й платника. Подивіться, як сходиться баланс.';

  @override
  String get scenarioTravel => 'Подорож';

  @override
  String get scenarioHome => 'Співмешканці';

  @override
  String get scenarioDinner => 'Вечеря';

  @override
  String get groupTravel => 'Вихідні в Кіото';

  @override
  String get groupHome => 'Наша квартира';

  @override
  String get groupDinner => 'П\'ятнична вечеря';

  @override
  String get demoNotice => 'Інтерактивне демо · вигадані дані';

  @override
  String get payer => 'Хто заплатив?';

  @override
  String get balances => 'Баланс кожного';

  @override
  String get payments => 'Запропоновані платежі';

  @override
  String morePayments(int count) {
    return 'ще $count';
  }

  @override
  String get reset => 'Скинути демо';

  @override
  String get weightedHelp => 'Alex має 2 частки, решта — по 1.';

  @override
  String get featureLabel => 'МАЛІ ДЕТАЛІ. ВЕЛИКА РІЗНИЦЯ.';

  @override
  String get featureTitle => 'Менше підрахунків.\nБільше часу разом.';

  @override
  String get featureSplitTitle => 'Справедливо не завжди означає порівну.';

  @override
  String get featureSplitBody =>
      'Діліть порівну, за точними сумами чи частками. За одну витрату можуть платити кілька людей.';

  @override
  String get featureSettleTitle => 'Зрозуміліші розрахунки.';

  @override
  String get featureSettleBody =>
      'Бачте, хто кому винен, з пропозиціями зменшити кількість переказів.';

  @override
  String get travelLabel => 'ДЛЯ НАСТУПНОЇ ПОДОРОЖІ';

  @override
  String get travelTitle => 'Різні валюти.\nТа сама добра компанія.';

  @override
  String get travelBody =>
      'Зберігайте початкову валюту та вводьте курс або фактичне списання з картки. Баланси залишаються у валюті групи.';

  @override
  String get screenshotsNote => 'Справжні екрани Android · вигадані дані · англійська';

  @override
  String get screenshotExpenses => 'Кожна витрата';

  @override
  String get screenshotForeign => 'Початкова валюта';

  @override
  String get screenshotStats => 'Аналіз витрат';

  @override
  String get extraTitle => 'Усе для вашої групи.';

  @override
  String get recurringTitle => 'Щоденні витрати за розкладом.';

  @override
  String get recurringBody => 'Плануйте оренду та інші регулярні витрати.';

  @override
  String get receiptsTitle => 'Зберігайте деталі.';

  @override
  String get receiptsBody => 'Додавайте чеки та місця до витрат.';

  @override
  String get liveTitle => 'Усі в курсі.';

  @override
  String get liveBody => 'Відкриті групи оновлюються, коли хтось додає витрати.';

  @override
  String get exportTitle => 'Історія завжди з вами.';

  @override
  String get exportBody => 'Експортуйте CSV або імпортуйте групу із Settle Up.';

  @override
  String get hostingLabel => 'ВАШІ ЛЮДИ. ВАШ СЕРВЕР.';

  @override
  String get hostingTitle => 'Ваші розрахунки.\nНа ваших умовах.';

  @override
  String get hostingBody =>
      'Запускайте Balnana з Docker Compose та PostgreSQL. Ви обираєте, де зберігаються рахунки групи.';

  @override
  String get hostingLink => 'Читати посібник';

  @override
  String get hostingModeLink =>
      'Діліться приватним посиланням. У режимі посилань реєстрація не потрібна.';

  @override
  String get hostingModeAccounts => 'Або ввімкніть облікові записи з паролем, Google чи OIDC.';

  @override
  String get faqTitle => 'Корисно знати.';

  @override
  String get faqAccountQ => 'Усім потрібен обліковий запис?';

  @override
  String get faqAccountA =>
      'У режимі посилань достатньо приватного посилання або QR-коду. У режимі облікових записів доступ залежить від налаштувань сервера.';

  @override
  String get faqOfflineQ => 'Чи працює офлайн?';

  @override
  String get faqOfflineA =>
      'На Android кешовані групи та витрати доступні для читання, коли сервер недоступний. Додавання й зміни потребують з\'єднання.';

  @override
  String get faqCurrencyQ => 'Курси валют автоматичні?';

  @override
  String get faqCurrencyA =>
      'Введіть курс або фактичну суму списання з картки. Balnana не завантажує курси в реальному часі.';

  @override
  String get faqPlatformQ => 'Які платформи підтримуються?';

  @override
  String get faqPlatformA => 'Наразі Android і браузер. Версія для iOS ще недоступна.';

  @override
  String get faqCostQ => 'Balnana безкоштовна?';

  @override
  String get faqCostA =>
      'Це відкрите ПЗ під AGPL-3.0. Підписки на застосунок немає; власний сервер може потребувати витрат на хостинг.';

  @override
  String get endTitle => 'Наступні гарні миті\nпочинаються тут.';

  @override
  String get endBody => 'Збирайте друзів. Ми допоможемо з числами.';

  @override
  String get github => 'Переглянути код';

  @override
  String get reportIssue => 'Повідомити про проблему';

  @override
  String get footerNote => 'Відкритий проєкт, створений для спільного користування.';

  @override
  String get backHome => 'На головну';

  @override
  String get notFound => 'Такої сторінки немає.';

  @override
  String get screenshotOpen => 'Переглянути знімок екрана';

  @override
  String get settled => 'Усі розрахувалися.';

  @override
  String get retry => 'Повторити';

  @override
  String owed(String name) {
    return '$name отримає';
  }

  @override
  String get languageEndonym => 'Українська';

  @override
  String get languageLabel => 'Мова';

  @override
  String get themeLabel => 'Тема';

  @override
  String get themeSystem => 'Як у системі';

  @override
  String get themeLight => 'Світла';

  @override
  String get themeDark => 'Темна';

  @override
  String get amountLabel => 'Сума';

  @override
  String get splitEqual => 'Порівну';

  @override
  String get splitShares => 'За частками';

  @override
  String get cancel => 'Скасувати';

  @override
  String get invalidAmount => 'Введіть суму більшу за нуль.';

  @override
  String get amountTooLarge => 'Ця сума завелика.';
}
