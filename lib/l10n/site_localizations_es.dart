// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'site_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class SiteLocalizationsEs extends SiteLocalizations {
  SiteLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get navFeatures => 'Funciones';

  @override
  String get navDemo => 'Pruébalo';

  @override
  String get navHosting => 'Alojamiento propio';

  @override
  String get navFaq => 'Preguntas';

  @override
  String get navDocs => 'Documentación';

  @override
  String get heroEyebrow => 'CÓDIGO ABIERTO. BAJO TU CONTROL.';

  @override
  String get heroTitle => 'Buenos momentos.\nCuentas claras.';

  @override
  String get heroBody =>
      'Viajes, cenas y vida diaria. Organiza los gastos compartidos y guarda los datos en tu propio servidor.';

  @override
  String get tryDemo => 'Probar la demo';

  @override
  String get selfHost => 'Alojar Balnana';

  @override
  String get development => 'En desarrollo · Android + Web';

  @override
  String get trustSplit => 'Repartos flexibles';

  @override
  String get trustLanguages => '20 idiomas';

  @override
  String get trustOpen => 'Código abierto. Sin anuncios.';

  @override
  String get trustServer => 'Tu propio servidor';

  @override
  String get demoLabel => 'PROBADLO JUNTOS';

  @override
  String get demoTitle => 'Haced planes.\nNosotros calculamos.';

  @override
  String get demoBody => 'Cambia el importe y quién pagó. Mira cómo se equilibran las cuentas.';

  @override
  String get scenarioTravel => 'Viaje';

  @override
  String get scenarioHome => 'Piso compartido';

  @override
  String get scenarioDinner => 'Cena';

  @override
  String get groupTravel => 'Fin de semana en Kioto';

  @override
  String get groupHome => 'Nuestro piso';

  @override
  String get groupDinner => 'Cena del viernes';

  @override
  String get demoNotice => 'Demo interactiva · datos ficticios';

  @override
  String get payer => '¿Quién pagó?';

  @override
  String get balances => 'El saldo de cada persona';

  @override
  String get payments => 'Pagos sugeridos';

  @override
  String morePayments(int count) {
    return '+$count más';
  }

  @override
  String get reset => 'Reiniciar demo';

  @override
  String get weightedHelp => 'Alex tiene 2 partes; los demás, 1 cada uno.';

  @override
  String get featureLabel => 'PEQUEÑOS DETALLES. GRAN DIFERENCIA.';

  @override
  String get featureTitle => 'Menos cálculos.\nMás tiempo juntos.';

  @override
  String get featureSplitTitle => 'Lo justo no siempre es lo mismo.';

  @override
  String get featureSplitBody =>
      'Reparte a partes iguales, por importes exactos o por cuotas. Varias personas pueden pagar un mismo gasto.';

  @override
  String get featureSettleTitle => 'Una forma más clara de saldar.';

  @override
  String get featureSettleBody =>
      'Consulta quién debe a quién, con sugerencias que reducen los pagos.';

  @override
  String get travelLabel => 'PARA VUESTRO PRÓXIMO VIAJE';

  @override
  String get travelTitle => 'Distintas monedas.\nLa misma compañía.';

  @override
  String get travelBody =>
      'Conserva la moneda original e introduce el cambio o el cargo real de la tarjeta. Los saldos usan la moneda del grupo.';

  @override
  String get screenshotsNote => 'Pantallas reales de Android · datos ficticios · inglés';

  @override
  String get screenshotExpenses => 'Cada gasto';

  @override
  String get screenshotForeign => 'Moneda original';

  @override
  String get screenshotStats => 'Resumen de gastos';

  @override
  String get extraTitle => 'Todo lo que necesita el grupo.';

  @override
  String get recurringTitle => 'Lo cotidiano, automático.';

  @override
  String get recurringBody => 'Programa el alquiler y otros gastos recurrentes.';

  @override
  String get receiptsTitle => 'Guarda los detalles.';

  @override
  String get receiptsBody => 'Adjunta recibos y lugares a los gastos.';

  @override
  String get liveTitle => 'Todos al día.';

  @override
  String get liveBody => 'Los grupos abiertos se actualizan cuando alguien añade gastos.';

  @override
  String get exportTitle => 'Llévate tu historial.';

  @override
  String get exportBody => 'Exporta CSV o importa tu grupo desde Settle Up.';

  @override
  String get hostingLabel => 'TU GENTE. TU SERVIDOR.';

  @override
  String get hostingTitle => 'Tus cuentas.\nTus condiciones.';

  @override
  String get hostingBody =>
      'Ejecuta Balnana con Docker Compose y PostgreSQL. Tú eliges dónde viven las cuentas del grupo.';

  @override
  String get hostingLink => 'Leer la guía';

  @override
  String get hostingModeLink => 'Comparte un enlace privado. Sin registro en el modo enlace.';

  @override
  String get hostingModeAccounts => 'O activa cuentas con contraseña, Google u OIDC.';

  @override
  String get faqTitle => 'Quizá te preguntes…';

  @override
  String get faqAccountQ => '¿Hace falta una cuenta para cada persona?';

  @override
  String get faqAccountA =>
      'En el modo enlace basta un enlace privado o un código QR. En el modo cuentas, el acceso depende de la configuración del servidor.';

  @override
  String get faqOfflineQ => '¿Funciona sin conexión?';

  @override
  String get faqOfflineA =>
      'En Android puedes leer grupos y gastos guardados en caché cuando no hay conexión con el servidor. Para añadir o editar gastos necesitas conexión.';

  @override
  String get faqCurrencyQ => '¿El cambio de moneda es automático?';

  @override
  String get faqCurrencyA =>
      'Introduce el tipo de cambio o el importe real cargado en tu tarjeta. Balnana no consulta cambios en tiempo real.';

  @override
  String get faqPlatformQ => '¿Qué plataformas son compatibles?';

  @override
  String get faqPlatformA => 'Actualmente Android y la web. Todavía no hay una versión para iOS.';

  @override
  String get faqCostQ => '¿Balnana es gratis?';

  @override
  String get faqCostA =>
      'Es software de código abierto con licencia AGPL-3.0. No hay suscripción de la app; alojar tu servidor puede tener costes.';

  @override
  String get endTitle => 'El próximo buen momento\nempieza aquí.';

  @override
  String get endBody => 'Trae a tu gente. Te ayudamos con los números.';

  @override
  String get github => 'Ver código';

  @override
  String get reportIssue => 'Informar de un problema';

  @override
  String get footerNote => 'Un proyecto abierto, hecho para compartir.';

  @override
  String get backHome => 'Volver al inicio';

  @override
  String get notFound => 'Esta página no está aquí.';

  @override
  String get screenshotOpen => 'Ver captura';

  @override
  String get settled => 'Todo el mundo ha saldado sus cuentas.';

  @override
  String get retry => 'Reintentar';

  @override
  String owed(String name) {
    return 'A $name le deben';
  }

  @override
  String get languageEndonym => 'Español';

  @override
  String get languageLabel => 'Idioma';

  @override
  String get themeLabel => 'Tema';

  @override
  String get themeSystem => 'Usar el del sistema';

  @override
  String get themeLight => 'Claro';

  @override
  String get themeDark => 'Oscuro';

  @override
  String get amountLabel => 'Importe';

  @override
  String get splitEqual => 'Por igual';

  @override
  String get splitShares => 'Por partes';

  @override
  String get cancel => 'Cancelar';

  @override
  String get invalidAmount => 'Escribe un importe mayor que cero.';

  @override
  String get amountTooLarge => 'Ese importe es demasiado grande.';
}
