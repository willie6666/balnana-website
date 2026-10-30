// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'site_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class SiteLocalizationsTr extends SiteLocalizations {
  SiteLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get navFeatures => 'Özellikler';

  @override
  String get navDemo => 'Dene';

  @override
  String get navHosting => 'Kendin barındır';

  @override
  String get navFaq => 'SSS';

  @override
  String get navDocs => 'Belgeler';

  @override
  String get heroEyebrow => 'AÇIK KAYNAK. KONTROL SENDE.';

  @override
  String get heroTitle => 'Güzel anlar.\nNet hesaplar.';

  @override
  String get heroBody =>
      'Seyahatler, yemekler ve günlük yaşam. Ortak masrafları düzenle, verileri kendi sunucunda sakla.';

  @override
  String get tryDemo => 'Demoyu dene';

  @override
  String get selfHost => 'Balnana barındır';

  @override
  String get development => 'Geliştirme aşamasında · Android + Web';

  @override
  String get trustSplit => 'Esnek paylaşım';

  @override
  String get trustLanguages => '20 dil';

  @override
  String get trustOpen => 'Açık kaynak. Reklamsız.';

  @override
  String get trustServer => 'Kendi sunucun';

  @override
  String get demoLabel => 'BİRLİKTE DENEYİN';

  @override
  String get demoTitle => 'Siz plan yapın.\nHesap bizden.';

  @override
  String get demoBody => 'Tutarı ve ödeyen kişiyi değiştir. Hesapların nasıl dengelendiğini gör.';

  @override
  String get scenarioTravel => 'Seyahat';

  @override
  String get scenarioHome => 'Ev arkadaşları';

  @override
  String get scenarioDinner => 'Yemek';

  @override
  String get groupTravel => 'Kyoto hafta sonu';

  @override
  String get groupHome => 'Bizim daire';

  @override
  String get groupDinner => 'Cuma yemeği';

  @override
  String get demoNotice => 'Etkileşimli demo · örnek veriler';

  @override
  String get payer => 'Kim ödedi?';

  @override
  String get balances => 'Herkesin bakiyesi';

  @override
  String get payments => 'Önerilen ödemeler';

  @override
  String morePayments(int count) {
    return '+$count daha';
  }

  @override
  String get reset => 'Demoyu sıfırla';

  @override
  String get weightedHelp => 'Herkesin pay sayısını belirleyin. 0, kişiyi hariç tutar.';

  @override
  String fewerShares(String name) {
    return '$name için daha az pay';
  }

  @override
  String moreShares(String name) {
    return '$name için daha fazla pay';
  }

  @override
  String get featureLabel => 'KÜÇÜK AYRINTILAR. BÜYÜK FARK.';

  @override
  String get featureTitle => 'Daha az hesap.\nDaha çok birliktelik.';

  @override
  String get featureSplitTitle => 'Adil olmak her zaman eşit olmak değildir.';

  @override
  String get featureSplitBody =>
      'Eşit, tam tutara veya paya göre bölüştür. Aynı masrafı birden fazla kişi ödeyebilir.';

  @override
  String get featureSettleTitle => 'Daha net hesaplaşma.';

  @override
  String get featureSettleBody => 'Kimin kime borçlu olduğunu gör; daha az ödeme için öneriler al.';

  @override
  String get travelLabel => 'SONRAKİ SEYAHAT İÇİN';

  @override
  String get travelTitle => 'Farklı para birimleri.\nAynı güzel dostluk.';

  @override
  String get travelBody =>
      'Asıl para birimini koru; kuru veya karttan çekilen gerçek tutarı gir. Bakiyeler grubun para biriminde kalır.';

  @override
  String get screenshotsNote => 'Gerçek Android ekranları · örnek veriler · İngilizce';

  @override
  String get screenshotExpenses => 'Her masraf';

  @override
  String get screenshotForeign => 'Asıl para birimi';

  @override
  String get screenshotStats => 'Harcama analizi';

  @override
  String get extraTitle => 'Grubun için gereken her şey.';

  @override
  String get recurringTitle => 'Tekrarlayan günlük hayat.';

  @override
  String get recurringBody => 'Kira ve diğer düzenli masrafları planla.';

  @override
  String get receiptsTitle => 'Ayrıntıları sakla.';

  @override
  String get receiptsBody => 'Masraflara fiş ve konum ekle.';

  @override
  String get liveTitle => 'Herkes güncel kalsın.';

  @override
  String get liveBody => 'Başkaları masraf eklediğinde açık gruplar yenilenir.';

  @override
  String get exportTitle => 'Geçmişini yanında götür.';

  @override
  String get exportBody => 'CSV dışa aktar veya Settle Up grubunu içe aktar.';

  @override
  String get hostingLabel => 'SENİN İNSANLARIN. SENİN SUNUCUN.';

  @override
  String get hostingTitle => 'Senin hesabın.\nSenin kuralların.';

  @override
  String get hostingBody =>
      'Balnana\'yı Docker Compose ve PostgreSQL ile çalıştır. Grup hesaplarının nerede saklanacağını sen seç.';

  @override
  String get hostingLink => 'Kurulum rehberini oku';

  @override
  String get hostingModeLink => 'Özel bağlantı paylaş. Bağlantı modunda kayıt gerekmez.';

  @override
  String get hostingModeAccounts => 'Ya da parola, Google veya OIDC ile hesapları etkinleştir.';

  @override
  String get faqTitle => 'Bilmek isteyebileceklerin.';

  @override
  String get faqAccountQ => 'Herkesin hesabı olmalı mı?';

  @override
  String get faqAccountA =>
      'Bağlantı modunda özel bağlantı veya QR kod yeterli. Hesap modunda erişim sunucu ayarlarına bağlıdır.';

  @override
  String get faqOfflineQ => 'Çevrimdışı kullanılabilir mi?';

  @override
  String get faqOfflineA =>
      'Android\'de sunucuya erişilemediğinde önbellekteki gruplar ve masraflar okunabilir. Ekleme veya değiştirme bağlantı gerektirir.';

  @override
  String get faqCurrencyQ => 'Döviz kurları otomatik mi?';

  @override
  String get faqCurrencyA =>
      'Kuru veya karttan çekilen gerçek tutarı gir. Balnana canlı döviz kuru almaz.';

  @override
  String get faqPlatformQ => 'Hangi platformlar destekleniyor?';

  @override
  String get faqPlatformA => 'Şu anda Android ve web. Henüz iOS sürümü yok.';

  @override
  String get faqCostQ => 'Balnana ücretsiz mi?';

  @override
  String get faqCostA =>
      'AGPL-3.0 lisanslı açık kaynak yazılımdır. Uygulama aboneliği yoktur; kendi sunucunun barındırma maliyeti olabilir.';

  @override
  String get endTitle => 'Sonraki güzel anın\nburada başlar.';

  @override
  String get endBody => 'Dostlarını topla. Sayılara biz yardım ederiz.';

  @override
  String get github => 'Kaynak kodu gör';

  @override
  String get reportIssue => 'Sorun bildir';

  @override
  String get footerNote => 'Paylaşmak için yapılmış açık kaynak bir proje.';

  @override
  String get backHome => 'Ana sayfaya dön';

  @override
  String get notFound => 'Bu sayfa burada değil.';

  @override
  String get screenshotOpen => 'Ekran görüntüsünü aç';

  @override
  String get settled => 'Herkesin hesabı kapandı.';

  @override
  String get retry => 'Yeniden dene';

  @override
  String owed(String name) {
    return '$name alacaklı';
  }

  @override
  String get languageEndonym => 'Türkçe';

  @override
  String get languageLabel => 'Dil';

  @override
  String get themeLabel => 'Tema';

  @override
  String get themeSystem => 'Sistem varsayılanı';

  @override
  String get themeLight => 'Açık';

  @override
  String get themeDark => 'Koyu';

  @override
  String get amountLabel => 'Tutar';

  @override
  String get splitEqual => 'Eşit';

  @override
  String get splitShares => 'Paylar';

  @override
  String get cancel => 'İptal';

  @override
  String get invalidAmount => 'Sıfırdan büyük bir tutar girin.';

  @override
  String get amountTooLarge => 'Bu tutar çok büyük.';
}
