// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'site_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class SiteLocalizationsRu extends SiteLocalizations {
  SiteLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get navFeatures => 'Возможности';

  @override
  String get navDemo => 'Попробовать';

  @override
  String get navHosting => 'Свой сервер';

  @override
  String get navFaq => 'Вопросы';

  @override
  String get navDocs => 'Документация';

  @override
  String get heroEyebrow => 'ОТКРЫТЫЙ КОД. ВАШ КОНТРОЛЬ.';

  @override
  String get heroTitle => 'Хорошие моменты.\nПонятные расчёты.';

  @override
  String get heroBody =>
      'Поездки, ужины и повседневность. Учитывайте общие расходы и храните данные на своём сервере.';

  @override
  String get tryDemo => 'Попробовать демо';

  @override
  String get selfHost => 'Развернуть Balnana';

  @override
  String get development => 'В разработке · Android + Web';

  @override
  String get trustSplit => 'Гибкое разделение';

  @override
  String get trustLanguages => '20 языков';

  @override
  String get trustOpen => 'Открытый код. Без рекламы.';

  @override
  String get trustServer => 'Свой сервер';

  @override
  String get demoLabel => 'ПОПРОБУЙТЕ ВМЕСТЕ';

  @override
  String get demoTitle => 'Стройте планы.\nМы всё посчитаем.';

  @override
  String get demoBody => 'Измените сумму и плательщика. Посмотрите, как сходится баланс.';

  @override
  String get scenarioTravel => 'Поездка';

  @override
  String get scenarioHome => 'Соседи';

  @override
  String get scenarioDinner => 'Ужин';

  @override
  String get groupTravel => 'Выходные в Киото';

  @override
  String get groupHome => 'Наша квартира';

  @override
  String get groupDinner => 'Пятничный ужин';

  @override
  String get demoNotice => 'Интерактивное демо · вымышленные данные';

  @override
  String get payer => 'Кто заплатил?';

  @override
  String get balances => 'Баланс каждого';

  @override
  String get payments => 'Предлагаемые платежи';

  @override
  String morePayments(int count) {
    return 'ещё $count';
  }

  @override
  String get reset => 'Сбросить демо';

  @override
  String get weightedHelp => 'Укажите доли каждого. 0 — человек не участвует.';

  @override
  String fewerShares(String name) {
    return 'Меньше долей: $name';
  }

  @override
  String moreShares(String name) {
    return 'Больше долей: $name';
  }

  @override
  String get featureLabel => 'МАЛЕНЬКИЕ ДЕТАЛИ. БОЛЬШАЯ РАЗНИЦА.';

  @override
  String get featureTitle => 'Меньше подсчётов.\nБольше времени вместе.';

  @override
  String get featureSplitTitle => 'Справедливо не всегда значит поровну.';

  @override
  String get featureSplitBody =>
      'Делите поровну, по точным суммам или долям. Один расход могут оплатить несколько человек.';

  @override
  String get featureSettleTitle => 'Расчёты без путаницы.';

  @override
  String get featureSettleBody =>
      'Видно, кто кому должен, а рекомендации помогают сократить переводы.';

  @override
  String get travelLabel => 'ДЛЯ СЛЕДУЮЩЕЙ ПОЕЗДКИ';

  @override
  String get travelTitle => 'Разные валюты.\nТа же хорошая компания.';

  @override
  String get travelBody =>
      'Сохраните исходную валюту и введите курс или фактическое списание с карты. Балансы остаются в валюте группы.';

  @override
  String get screenshotsNote => 'Настоящие экраны Android · вымышленные данные · английский';

  @override
  String get screenshotExpenses => 'Каждый расход';

  @override
  String get screenshotForeign => 'Исходная валюта';

  @override
  String get screenshotStats => 'Анализ расходов';

  @override
  String get extraTitle => 'Всё для вашей группы.';

  @override
  String get recurringTitle => 'Повседневное — по расписанию.';

  @override
  String get recurringBody => 'Планируйте аренду и другие регулярные расходы.';

  @override
  String get receiptsTitle => 'Сохраняйте детали.';

  @override
  String get receiptsBody => 'Прикрепляйте чеки и места к расходам.';

  @override
  String get liveTitle => 'Все в курсе.';

  @override
  String get liveBody => 'Открытые группы обновляются при добавлении расходов.';

  @override
  String get exportTitle => 'История всегда с вами.';

  @override
  String get exportBody => 'Экспортируйте CSV или импортируйте группу из Settle Up.';

  @override
  String get hostingLabel => 'ВАШИ ЛЮДИ. ВАШ СЕРВЕР.';

  @override
  String get hostingTitle => 'Ваши расчёты.\nНа ваших условиях.';

  @override
  String get hostingBody =>
      'Запускайте Balnana с Docker Compose и PostgreSQL. Вы выбираете, где хранятся счета группы.';

  @override
  String get hostingLink => 'Читать руководство';

  @override
  String get hostingModeLink => 'Делитесь приватной ссылкой. В режиме ссылок регистрация не нужна.';

  @override
  String get hostingModeAccounts => 'Или включите аккаунты с паролем, Google или OIDC.';

  @override
  String get faqTitle => 'Полезно знать.';

  @override
  String get faqAccountQ => 'Всем нужен аккаунт?';

  @override
  String get faqAccountA =>
      'В режиме ссылок достаточно приватной ссылки или QR-кода. В режиме аккаунтов доступ зависит от настроек сервера.';

  @override
  String get faqOfflineQ => 'Работает ли офлайн?';

  @override
  String get faqOfflineA =>
      'На Android кэшированные группы и расходы доступны для чтения, когда сервер недоступен. Добавление и изменение требуют подключения.';

  @override
  String get faqCurrencyQ => 'Курсы валют автоматические?';

  @override
  String get faqCurrencyA =>
      'Введите курс или фактическую сумму списания с карты. Balnana не загружает курсы в реальном времени.';

  @override
  String get faqPlatformQ => 'Какие платформы поддерживаются?';

  @override
  String get faqPlatformA => 'Сейчас Android и браузер. Версия для iOS пока недоступна.';

  @override
  String get faqCostQ => 'Balnana бесплатна?';

  @override
  String get faqCostA =>
      'Это открытое ПО под AGPL-3.0. Подписки на приложение нет; собственный сервер может требовать затрат на хостинг.';

  @override
  String get endTitle => 'Следующие хорошие моменты\nначинаются здесь.';

  @override
  String get endBody => 'Собирайте друзей. Мы поможем с цифрами.';

  @override
  String get github => 'Исходный код';

  @override
  String get reportIssue => 'Сообщить о проблеме';

  @override
  String get footerNote => 'Открытый проект для совместного использования.';

  @override
  String get backHome => 'На главную';

  @override
  String get notFound => 'Такой страницы нет.';

  @override
  String get screenshotOpen => 'Открыть снимок экрана';

  @override
  String get settled => 'Все рассчитались.';

  @override
  String get retry => 'Повторить';

  @override
  String owed(String name) {
    return '$name получит';
  }

  @override
  String get languageEndonym => 'Русский';

  @override
  String get languageLabel => 'Язык';

  @override
  String get themeLabel => 'Тема';

  @override
  String get themeSystem => 'Как в системе';

  @override
  String get themeLight => 'Светлая';

  @override
  String get themeDark => 'Тёмная';

  @override
  String get amountLabel => 'Сумма';

  @override
  String get splitEqual => 'Поровну';

  @override
  String get splitShares => 'По долям';

  @override
  String get cancel => 'Отмена';

  @override
  String get invalidAmount => 'Введите сумму больше нуля.';

  @override
  String get amountTooLarge => 'Сумма слишком большая.';
}
