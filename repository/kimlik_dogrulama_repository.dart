import 'package:katmanli_mimari_flutter/base/kimlik_dogrulama_base.dart';
import 'package:katmanli_mimari_flutter/main.dart';

class KimlikDogrulamaRepository implements KimlikDogrulamaBase {
  final FirebaseKimlikDogrulamaService _service =
      locator<FirebaseKimlikDogrulamaService>();

  @override
  Future appleIleGiris() {
    // TODO: implement appleIleGiris
    throw UnimplementedError();
  }

  @override
  Future<void> cikisYap() {
    // TODO: implement cikisYap
    throw UnimplementedError();
  }

  @override
  Future epostaVeSifreIleGiris(String eposta, String sifre) {
    // TODO: implement epostaVeSifreIleGiris
    throw UnimplementedError();
  }

  @override
  Future epostaVeSifreIleKayit(String adSoyad, String eposta, String sifre) {
    // TODO: implement epostaVeSifreIleKayit
    throw UnimplementedError();
  }

  @override
  Future googleIleGiris() {
    // TODO: implement googleIleGiris
    throw UnimplementedError();
  }

  @override
  Future kullaniciIdsiniGetir() async {
    return await _service.kullaniciIdsiniGetir();
  }

  @override
  Future<void> sifreSifirla(String eposta) {
    // TODO: implement sifreSifirla
    throw UnimplementedError();
  }

  @override
  Future<void> telefonDogrulamaKoduGonder(String telefonNumarasi,
      {Function(dynamic kullaniciId)? otomatikDogrulama,
      Function(String hata)? dogrulamaBasarisiz,
      Function(dynamic dorulamaIdsi)? dogrulamaKoduGonderildi,
      Function()? kodZamanAsimi}) {
    // TODO: implement telefonDogrulamaKoduGonder
    throw UnimplementedError();
  }

  @override
  Future telefonDogrulamaKodunuOnayla(
      String dogrulamaIdsi, String dogrulamaKodu) {
    // TODO: implement telefonDogrulamaKodunuOnayla
    throw UnimplementedError();
  }
}

mixin FirebaseKimlikDogrulamaService {
  kullaniciIdsiniGetir() {}
}
