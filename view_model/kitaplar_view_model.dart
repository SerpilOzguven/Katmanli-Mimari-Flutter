// TODO Implement this library.// TODO Implement this library.import 'package:flutter/material.dart';
import 'package:katmanli_mimari_flutter/main.dart';
import 'package:katmanli_mimari_flutter/repository/kimlik_dogrulama_repository.dart';
import 'package:katmanli_mimari_flutter/repository/veri_tabani_repository.dart';

class KitaplarViewModel with ChangeNotifier {
  final VeriTabaniRepository _veriTabaniRepository =
      locator<_veriTabaniRepository>();
  final KimlikDogrulamaRepository _kimlikDogrulamaRepository =
      locator<KimlikDogrulamaRepository>();

  dynamic _sonKitap;

  List<int> tumKategoriler = [-1];
  int _secilenKategori = -1;

  int get secilenKategori => _secilenKategori;

  set secilenKategori(int value) {
    _secilenKategori = value;
  }

  List<dynamic> _secilenKitapIdleri = [];

  ScrollController scrollController = ScrollController();

  KitaplarViewModel() {
    tumKategoriler.addAll(Sabitler.kategoriler.keys);
    scrollController.addListener(_kaydirmaKontrol);
    _kitaplariGetir();
  }

  void _kaydirmaKontrol() {
    if (scrollController.offset == scrollController.position.maxScrollExtent) {
      _kitaplariGetir();
    }
  }

  void kitapEkle(BuildContext context) async {
  dynamic kullaniciId = await _kimlikDogrulamaRepository.kullaniciIdsiniGetir();

  if (kullaniciId != null) {
    List<dynamic> sonuc =
        await _pencereAc(context, "Kitap Adýný Giriniz") ?? [];

    if (sonuc.isNotEmpty) {
      String kitapAdi = sonuc[0];
      int kategori = sonuc[1];

      if (kitapAdi.isNotEmpty) {
        Kitap yeniKitap = Kitap(
          kitapAdi,
          DateTime.now(),
          kategori,
          kullaniciId,
        );
        dynamic kitapIdsi = await _veriTabaniRepository.createKitap(
          yeniKitap,
        );
        debugPrint("Kitap Idsi: " + kitapIdsi.toString());
        kitaplar = [];
        _sonKitap = null;
        _kitaplariGetir();
      }
    }
  }
}

Future<void> _kitaplariGetir() async {
  dynamic kullaniciId = await _kimlikDogrulamaRepository.kullaniciIdsiniGetir();

  if (kullaniciId != null) {
    List<dynamic> cekilenVeriler = await _veriTabaniRepository.readTumKitaplar(
      kullaniciId,
      _secilenKategori,
      _sonKitap,
      10,
    );
    List<Kitap> yeniKitaplar = cekilenVeriler[0];
    kitaplar.addAll(yeniKitaplar);
    _sonKitap = cekilenVeriler[1];
    _kitapListesiniYazdir("Kitaplar getirildi");
    notifyListeners();
  }
}

void kitapGuncelle(BuildContext context, int index) async {
  Kitap kitap = kitaplar[index];

  List<dynamic> sonuc = await _pencereAc(context, "Kitap Güncelle",
          mevcutIsim: kitap.isim, mevcutKategori: kitap.kategori) ??
      [];

  if (sonuc.isNotEmpty) {
    String yeniKitapAdi = sonuc[0];
    int yeniKategori = sonuc[1];

    if (yeniKitapAdi != kitap.isim || yeniKategori != kitap.kategori) {
      if (yeniKitapAdi.isNotEmpty) {
        kitap.isim = yeniKitapAdi;
      }
      kitap.kategori = yeniKategori;
      int guncellenenSatirSayisi = await _veriTabaniRepository.updateKitap(
        kitap,
      );
    }
  }
}

void kitapSil(int index) async {
  Kitap kitap = kitaplar[index];
  int silinenSatirSayisi = await _veriTabaniRepository.deleteKitap(kitap);
  if (silinenSatirSayisi > 0) {
    kitaplar.removeAt(index);
    notifyListeners();
  }
}

void seciliKitaplariSil() async {
  int silinenSatirSayisi = await _veriTabaniRepository.deleteKitaplar(
    _secilenKitapIdleri,
  );
  if (silinenSatirSayisi > 0) {
    kitaplar.removeWhere((k) => _secilenKitapIdleri.contains(k.id));
    notifyListeners();
  }
}

void resimEkle(BuildContext context, int index) async {
  ImagePicker imagePicker = ImagePicker();
  XFile? secilenDosya = await imagePicker.pickImage(
    source: ImageSource.gallery,
  );
  if (secilenDosya != null) {
    File file = File(secilenDosya.path);

    Kitap kitap = kitaplar[index];
    String dosyaIsmi = kitap.id;
    String dosyaBaglantisi = await _depolamaRepository.dosyaYukle(
      "kitaplar/$dosyaIsmi.jpg",
      file,
    );

    kitap.resim = dosyaBaglantisi;
    await _veriTabaniRepository.updateKitap(kitap);
  }
}

void cikisYap(BuildContext context) async {
  await _kimlikDogrulamaRepository.cikisYap();
  _girisSayfasiniAc(context);
}
