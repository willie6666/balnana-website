// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'site_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class SiteLocalizationsFr extends SiteLocalizations {
  SiteLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get navFeatures => 'Fonctionnalités';

  @override
  String get navDemo => 'Essayer';

  @override
  String get navHosting => 'Auto-hébergement';

  @override
  String get navFaq => 'FAQ';

  @override
  String get heroEyebrow => 'OPEN SOURCE. À VOUS DE JOUER.';

  @override
  String get heroTitle => 'De bons moments.\nDes comptes clairs.';

  @override
  String get heroBody =>
      'Voyages, dîners et quotidien. Organisez les dépenses communes et gardez vos données sur votre serveur.';

  @override
  String get tryDemo => 'Essayer la démo';

  @override
  String get selfHost => 'Héberger Balnana';

  @override
  String get development => 'En développement · Android + Web';

  @override
  String get trustSplit => 'Partage flexible';

  @override
  String get trustLanguages => '20 langues';

  @override
  String get trustOpen => 'Open source. Sans publicité.';

  @override
  String get trustServer => 'Votre serveur';

  @override
  String get demoLabel => 'ESSAYEZ ENSEMBLE';

  @override
  String get demoTitle => 'Faites des projets.\nOn fait les calculs.';

  @override
  String get demoBody =>
      'Changez le montant et la personne qui paie. Regardez les comptes s\'équilibrer.';

  @override
  String get scenarioTravel => 'Voyage';

  @override
  String get scenarioHome => 'Colocation';

  @override
  String get scenarioDinner => 'Dîner';

  @override
  String get groupTravel => 'Week-end à Kyoto';

  @override
  String get groupHome => 'Notre appartement';

  @override
  String get groupDinner => 'Dîner du vendredi';

  @override
  String get demoNotice => 'Démo interactive · données fictives';

  @override
  String get payer => 'Qui a payé ?';

  @override
  String get balances => 'Le solde de chacun';

  @override
  String get payments => 'Paiements suggérés';

  @override
  String morePayments(int count) {
    return '+$count de plus';
  }

  @override
  String get reset => 'Réinitialiser la démo';

  @override
  String get weightedHelp => 'Alex a 2 parts ; les autres en ont 1 chacun.';

  @override
  String get featureLabel => 'PETITS DÉTAILS. GRANDE DIFFÉRENCE.';

  @override
  String get featureTitle => 'Moins de calculs.\nPlus de moments ensemble.';

  @override
  String get featureSplitTitle => 'Équitable ne veut pas toujours dire égal.';

  @override
  String get featureSplitBody =>
      'Partagez à parts égales, par montants précis ou par parts. Plusieurs personnes peuvent payer une même dépense.';

  @override
  String get featureSettleTitle => 'Des comptes plus simples.';

  @override
  String get featureSettleBody =>
      'Voyez qui doit à qui, avec des suggestions pour réduire les paiements.';

  @override
  String get travelLabel => 'POUR LE PROCHAIN VOYAGE';

  @override
  String get travelTitle => 'Des devises différentes.\nLa même bonne compagnie.';

  @override
  String get travelBody =>
      'Gardez la devise d\'origine et saisissez le taux ou le débit réel de votre carte. Les soldes restent dans la devise du groupe.';

  @override
  String get screenshotsNote => 'Vrais écrans Android · données fictives · anglais';

  @override
  String get screenshotExpenses => 'Chaque dépense';

  @override
  String get screenshotForeign => 'Devise d\'origine';

  @override
  String get screenshotStats => 'Analyse des dépenses';

  @override
  String get extraTitle => 'Tout pour votre groupe.';

  @override
  String get recurringTitle => 'Le quotidien, en boucle.';

  @override
  String get recurringBody => 'Planifiez le loyer et les dépenses récurrentes.';

  @override
  String get receiptsTitle => 'Gardez les détails.';

  @override
  String get receiptsBody => 'Joignez des reçus et des lieux aux dépenses.';

  @override
  String get liveTitle => 'Tout le monde à jour.';

  @override
  String get liveBody => 'Les groupes ouverts s\'actualisent quand une dépense est ajoutée.';

  @override
  String get exportTitle => 'Emportez votre historique.';

  @override
  String get exportBody => 'Exportez en CSV ou importez depuis Settle Up.';

  @override
  String get hostingLabel => 'VOS PROCHES. VOTRE SERVEUR.';

  @override
  String get hostingTitle => 'Vos comptes.\nÀ vos conditions.';

  @override
  String get hostingBody =>
      'Hébergez Balnana avec Docker Compose et PostgreSQL. Vous choisissez où sont conservés les comptes du groupe.';

  @override
  String get hostingLink => 'Lire le guide';

  @override
  String get hostingModeLink => 'Partagez un lien privé. Sans inscription en mode lien.';

  @override
  String get hostingModeAccounts => 'Ou activez les comptes avec mot de passe, Google ou OIDC.';

  @override
  String get faqTitle => 'Quelques réponses utiles.';

  @override
  String get faqAccountQ => 'Faut-il un compte pour chacun ?';

  @override
  String get faqAccountA =>
      'En mode lien, un lien privé ou un QR code suffit. En mode comptes, l\'accès dépend des réglages du serveur.';

  @override
  String get faqOfflineQ => 'Est-ce utilisable hors connexion ?';

  @override
  String get faqOfflineA =>
      'Sur Android, les groupes et dépenses en cache restent lisibles si le serveur est inaccessible. Ajouter ou modifier nécessite une connexion.';

  @override
  String get faqCurrencyQ => 'Les taux de change sont-ils automatiques ?';

  @override
  String get faqCurrencyA =>
      'Saisissez un taux ou le montant réellement débité sur votre carte. Balnana ne récupère pas de taux en temps réel.';

  @override
  String get faqPlatformQ => 'Quelles plateformes sont compatibles ?';

  @override
  String get faqPlatformA =>
      'Android et le Web sont pris en charge. Il n\'existe pas encore de version iOS.';

  @override
  String get faqCostQ => 'Balnana est-il gratuit ?';

  @override
  String get faqCostA =>
      'Balnana est open source sous AGPL-3.0, sans abonnement à l\'application. Héberger votre serveur peut entraîner des frais.';

  @override
  String get endTitle => 'Votre prochain bon moment\ncommence ici.';

  @override
  String get endBody => 'Réunissez vos proches. On vous aide avec les chiffres.';

  @override
  String get github => 'Voir le code';

  @override
  String get reportIssue => 'Signaler un problème';

  @override
  String get footerNote => 'Un projet open source, fait pour partager.';

  @override
  String get backHome => 'Retour à l\'accueil';

  @override
  String get notFound => 'Cette page est introuvable.';

  @override
  String get screenshotOpen => 'Voir la capture';

  @override
  String get settled => 'Tout le monde est quitte.';

  @override
  String get retry => 'Réessayer';

  @override
  String owed(String name) {
    return 'On doit à $name';
  }

  @override
  String get languageEndonym => 'Français';

  @override
  String get languageLabel => 'Langue';

  @override
  String get themeLabel => 'Thème';

  @override
  String get themeSystem => 'Par défaut du système';

  @override
  String get themeLight => 'Clair';

  @override
  String get themeDark => 'Sombre';

  @override
  String get amountLabel => 'Montant';

  @override
  String get splitEqual => 'À parts égales';

  @override
  String get splitShares => 'Parts';

  @override
  String get cancel => 'Annuler';

  @override
  String get invalidAmount => 'Saisissez un montant supérieur à zéro.';

  @override
  String get amountTooLarge => 'Ce montant est trop élevé.';
}
