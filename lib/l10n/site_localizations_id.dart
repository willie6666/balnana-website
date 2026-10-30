// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'site_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class SiteLocalizationsId extends SiteLocalizations {
  SiteLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get navFeatures => 'Fitur';

  @override
  String get navDemo => 'Coba';

  @override
  String get navHosting => 'Hosting sendiri';

  @override
  String get navFaq => 'FAQ';

  @override
  String get navDocs => 'Dokumentasi';

  @override
  String get heroEyebrow => 'SUMBER TERBUKA. KENDALI DI TANGANMU.';

  @override
  String get heroTitle => 'Momen seru.\nHitungan jelas.';

  @override
  String get heroBody =>
      'Perjalanan, makan bersama, dan keseharian. Kelola pengeluaran bersama dan simpan data di server sendiri.';

  @override
  String get tryDemo => 'Coba demo';

  @override
  String get selfHost => 'Hosting Balnana';

  @override
  String get development => 'Dalam pengembangan · Android + Web';

  @override
  String get trustSplit => 'Pembagian fleksibel';

  @override
  String get trustLanguages => '20 bahasa';

  @override
  String get trustOpen => 'Sumber terbuka. Tanpa iklan.';

  @override
  String get trustServer => 'Server sendiri';

  @override
  String get demoLabel => 'COBA BERSAMA';

  @override
  String get demoTitle => 'Rencanakan saja.\nKami yang hitung.';

  @override
  String get demoBody => 'Ubah jumlah dan siapa yang membayar. Lihat saldonya seimbang.';

  @override
  String get scenarioTravel => 'Perjalanan';

  @override
  String get scenarioHome => 'Teman serumah';

  @override
  String get scenarioDinner => 'Makan bersama';

  @override
  String get groupTravel => 'Akhir pekan di Kyoto';

  @override
  String get groupHome => 'Apartemen kita';

  @override
  String get groupDinner => 'Makan malam Jumat';

  @override
  String get demoNotice => 'Demo interaktif · data fiktif';

  @override
  String get payer => 'Siapa yang membayar?';

  @override
  String get balances => 'Saldo semua orang';

  @override
  String get payments => 'Saran pembayaran';

  @override
  String morePayments(int count) {
    return '+$count lainnya';
  }

  @override
  String get reset => 'Atur ulang demo';

  @override
  String get weightedHelp => 'Alex mendapat 2 bagian; yang lain masing-masing 1.';

  @override
  String get featureLabel => 'DETAIL KECIL. PERBEDAAN BESAR.';

  @override
  String get featureTitle => 'Kurangi hitungan.\nPerbanyak kebersamaan.';

  @override
  String get featureSplitTitle => 'Adil tidak selalu berarti sama rata.';

  @override
  String get featureSplitBody =>
      'Bagi rata, berdasarkan jumlah pasti, atau porsi. Beberapa orang bisa membayar pengeluaran yang sama.';

  @override
  String get featureSettleTitle => 'Pelunasan lebih jelas.';

  @override
  String get featureSettleBody =>
      'Lihat siapa berutang kepada siapa dengan saran untuk mengurangi transfer.';

  @override
  String get travelLabel => 'UNTUK PERJALANAN BERIKUTNYA';

  @override
  String get travelTitle => 'Mata uang berbeda.\nTeman tetap sama.';

  @override
  String get travelBody =>
      'Simpan mata uang asli dan masukkan kurs atau tagihan kartu sebenarnya. Saldo tetap dalam mata uang grup.';

  @override
  String get screenshotsNote => 'Layar Android asli · data fiktif · bahasa Inggris';

  @override
  String get screenshotExpenses => 'Setiap pengeluaran';

  @override
  String get screenshotForeign => 'Mata uang asli';

  @override
  String get screenshotStats => 'Wawasan pengeluaran';

  @override
  String get extraTitle => 'Semua yang dibutuhkan grupmu.';

  @override
  String get recurringTitle => 'Keseharian yang berulang.';

  @override
  String get recurringBody => 'Jadwalkan sewa dan pengeluaran rutin lainnya.';

  @override
  String get receiptsTitle => 'Simpan detail kecilnya.';

  @override
  String get receiptsBody => 'Lampirkan struk dan lokasi pada pengeluaran.';

  @override
  String get liveTitle => 'Semua tetap tahu.';

  @override
  String get liveBody => 'Grup yang terbuka diperbarui saat orang lain menambah pengeluaran.';

  @override
  String get exportTitle => 'Bawa riwayatmu.';

  @override
  String get exportBody => 'Ekspor CSV atau impor grup dari Settle Up.';

  @override
  String get hostingLabel => 'ORANG-ORANGMU. SERVERMU.';

  @override
  String get hostingTitle => 'Hitunganmu.\nAturanmu.';

  @override
  String get hostingBody =>
      'Jalankan Balnana dengan Docker Compose dan PostgreSQL. Kamu memilih tempat menyimpan pembukuan grup.';

  @override
  String get hostingLink => 'Baca panduan';

  @override
  String get hostingModeLink => 'Bagikan tautan pribadi. Tanpa daftar dalam mode tautan.';

  @override
  String get hostingModeAccounts => 'Atau aktifkan akun dengan kata sandi, Google, atau OIDC.';

  @override
  String get faqTitle => 'Hal yang perlu diketahui.';

  @override
  String get faqAccountQ => 'Apakah semua perlu akun?';

  @override
  String get faqAccountA =>
      'Dalam mode tautan cukup tautan pribadi atau kode QR. Dalam mode akun, akses bergantung pada pengaturan server.';

  @override
  String get faqOfflineQ => 'Bisa dipakai offline?';

  @override
  String get faqOfflineA =>
      'Di Android, grup dan pengeluaran dalam cache tetap bisa dibaca saat server tak terjangkau. Menambah atau mengubah perlu koneksi.';

  @override
  String get faqCurrencyQ => 'Apakah kurs otomatis?';

  @override
  String get faqCurrencyA =>
      'Masukkan kurs sendiri atau jumlah tagihan kartu sebenarnya. Balnana tidak mengambil kurs langsung.';

  @override
  String get faqPlatformQ => 'Platform apa yang didukung?';

  @override
  String get faqPlatformA => 'Saat ini Android dan web. Versi iOS belum tersedia.';

  @override
  String get faqCostQ => 'Apakah Balnana gratis?';

  @override
  String get faqCostA =>
      'Balnana adalah perangkat lunak sumber terbuka AGPL-3.0. Tidak ada langganan aplikasi; server sendiri bisa memerlukan biaya hosting.';

  @override
  String get endTitle => 'Momen seru berikutnya\ndimulai di sini.';

  @override
  String get endBody => 'Ajak teman-temanmu. Kami bantu dengan angkanya.';

  @override
  String get github => 'Lihat kode';

  @override
  String get reportIssue => 'Laporkan masalah';

  @override
  String get footerNote => 'Proyek sumber terbuka, dibuat untuk berbagi.';

  @override
  String get backHome => 'Kembali ke beranda';

  @override
  String get notFound => 'Halaman ini tidak ada.';

  @override
  String get screenshotOpen => 'Lihat tangkapan layar';

  @override
  String get settled => 'Saldo semua orang sudah lunas.';

  @override
  String get retry => 'Coba lagi';

  @override
  String owed(String name) {
    return '$name akan menerima';
  }

  @override
  String get languageEndonym => 'Bahasa Indonesia';

  @override
  String get languageLabel => 'Bahasa';

  @override
  String get themeLabel => 'Tema';

  @override
  String get themeSystem => 'Ikuti sistem';

  @override
  String get themeLight => 'Terang';

  @override
  String get themeDark => 'Gelap';

  @override
  String get amountLabel => 'Jumlah';

  @override
  String get splitEqual => 'Sama rata';

  @override
  String get splitShares => 'Porsi';

  @override
  String get cancel => 'Batal';

  @override
  String get invalidAmount => 'Masukkan jumlah yang lebih besar dari nol.';

  @override
  String get amountTooLarge => 'Jumlah itu terlalu besar.';
}
