import 'package:firebase/firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:katmanli_mimari_flutter/main.dart';
import 'package:katmanli_mimari_flutter/repository/kimlik_dogrulama_repository.dart';
import 'package:provider/provider.dart';

class TelefonIleGirisViewModel with ChangeNotifier{
 FirebaseAuth _auth = FirebaseAuth.instance;

  bool _dogrulamaBolumuGoster = false;

  bool get dogrulamaBolumunuGoster => _dogrulamaBolumuGoster;

  set dogrulamaBolumunuGoster(bool value) {
    _dogrulamaBolumuGoster = value;
    notifyListeners();
  }
  dynamic _dogrulamaIdsi = "";

  void girisSayfasiniAc(BuildContext context) {
    MaterialPageRoute sayfaYolu =MaterialPageRoute(
        builder: (BuildContext context) {
          return ChangeNotifierProvider(
              create: (BuildContext context) = GirisViewModel(),
              child: GirisSayfasi(),
          );
        },
    );
    Navigator.pushReplacement(context, sayfaYolu);
  }
  void _kitaplarSayfasiniAc(BuildContext context){
    MaterialPageRoute sayfaYolu = MaterialPageRoute(
        builder: (BuildContext context) {
          return ChangeNotifierProvider(
              create: (BuildContext context) => KitaplarViewModel(),
              child: KitaplarSayfasi(),
          );
        },
      );
    }
    Navigator.pushReplacement(context, sayfaYolu);
  }
  void _snackbarGoster(BuildContext context, String mesaj) {
    SnackBar snackBar = SnackBar(content: Text(mesaj));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void dogrulamaKoduGonder(
  BuildContext context,
  String telefonNumarasi,
  ) async{
  if (telefonNumarasi.isNotEmpty) {
    await _auth.verifyPhoneNumber(
      phoneNumber: telefonNumarasi,
      verificationCompleted: (PhoneAuthCredential dogrulamaKimligi){
        _otomatikDogrulama(context, dogrulamaKimligi)
      },
      dogrulamaBasarisiz:_dogrulamaBasarisiz,
      dogrulamaKoduGonderildi: _dogrulamaKoduGonderildi,
      kodZamanAsimi:_kodZamanAsimi,
    );
  }
}
void _otomatikDogrulama(
  BuildContext context
  PhoneAuthCredential dogrulamaKimligi,
  )async {
  UserCredential.kullaniciKimligi = _auth.signInWithCredential(
    dogrulamaKimligi,
  );
  User? kullanici = kullaniciKimligi.user;
  if(kullaniciId != null) {
    print("Telefon Numarasý ile giriþ baþarýlý.");
    _kitaplarSayfasiniAc(context);
  }
}

void _dogrulamaBasarisiz(FirebaseException e) {
  if (e.code == 'invalid-phone-number') {
    print("Telefon numarasý geçersiz.");
  } else {
    print("iþlem baþarýsýz.");
  }
}

void _dogrulamaKoduGonderildi(String verificationId, int? resendToken) {
  _dogrulamaIdsi = verificationId;
  dogrulamaBolumunuGoster = true;
}

void _kodZamanAsimi(String verificationId){
  print("Dogrulama kodu zaman aþýmýna uðradý.");
}

Future<void> dogrulamaKoduOnayla(
  BuildContext context,
  String dogrulamaKodu,
) async {
  if (_dogrulamaIdsi.isNotEmpty && dogrulamaKodu.isNotEmpty) {
    try{
      PhoneAuthCredential dogrulamaKimligi = PhoneAuthProvider.credential(
      verificationId: _dogrulamaIdsi,
      smsCode: dogrulamaKodu,
    );
      User? kullanici = kullaniciKimligi.user;
      if (kullanici != null) {
        _snackbarGoster(context, 'Telefon Numarasý ile giriþ baþarýlý');
        _kitaplarSayfasiniAc(context);
      }
    } on FirebaseAuthException catch (e){
      if (e.code == "invalid-verification-code") {
        _snackbarGoster(context, "Doðrulama kodu geçersiz");
      }
    } catch (e) {
      print(e);
      }
    }
  }
}