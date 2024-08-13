// TODO Implement this library.// TODO Implement this library.import 'package:flutter/material.dart';
import 'package:katmanli_mimari_flutter/main.dart';
import 'package:katmanli_mimari_flutter/repository/kimlik_dogrulama_repository.dart';
import 'package:provider/provider.dart';

class GirisViewModel with ChangeNotifier {
  final KimlikDogrulamaRepository _kimlikDogrulamaRepository = locator<KimlikDogrulamaRepository>();

  void kayitSayfasiniAc(BuildContext context) {
    MaterialPageRoute sayfaYolu = MaterialPageRoute(
      builder: (BuildContext context) {
        return ChangeNotifierProvider(
            create: (BuildContext context) => KayitViewModel(),
          child: KayitSayfasi(),
        );
    },

};
  Navigator.pushReplacement(context, sayfaYolu);

}
void _kitaplarSayfasiniAc(BuildContext context) {
  MaterialPageRoute sayfaYolu MaterialPageRoute(
    builder: (BuildContext context) {
      return ChangeNotifierProvider(
          create: (BuildContext context) => KitaplarViewModel(),
           child: KitaplarSayfasi(), );
      },
  );
}

Future<void> epostaVeSifreIleGiris(
  BuildContext context,
  String eposta,
  String sifre,
) async {
  dynamic kullaniciId = await _kimlikDogrulamaRepository.epostaVeSifreIleGiris(eposta, sifre);
  if (kullaniciId != null) {
    _kitaplarSayfasiniAc(context);
  }
}

Future<void> googleIleGiris(BuildContext context) async {
  dynamic kullaniciId = await _kimlikDogrulamaRepository.googleIleGiris();
    if (kullaniciId != null) {
      _kitaplarSayfasiniAc(context);
  }
}

Future<void> appleIleGiris(BuildContext context) async {
  dynamic kullaniciId = await _kimlikDogrulamaRepository.appleIleGiris();
  if(kullaniciId != null {
    _kitaplarSayfasiniAc(context)
  }

}
void telefonNumarasiIleGiris(BuildContext context) async {
  MaterialPageRoute sayfaYolu = MaterialPageRoute(
      builder: (BuildContext context) {
        return ChangeNotifierProvider(
            create: (BuildContext context) => TelefonIleGirisViewModel(),
            child:  TelefonIleGirisSayfasi(),
        );
      },
  );
  Navigator.pushReplacement(context, sayfaYolu);
}

void sifreSifirla(BuildContext context, String eposta) async {
  if (eposta.isNotEmpty) {
    await _kimlikDogrulamaRepository.sifreSifirla(eposta);
    _snackbarGoster(context,"Þifre sýfýrlama baðlantýsý gönderildi.");
    
  } else {
    _snackbarGoster(context, "Lütfen e-posta adresinizi girin.");
    
  }
}

void _snackbarGoster(BuildContext context, String mesaj) {
  SnackBar snackBar = SnackBar(content: Text(mesaj));
  ScaffoldMessenger.of(context).showSnackBar(snackBar;)
}
