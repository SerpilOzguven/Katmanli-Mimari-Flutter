import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class AcilisViewModel with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  yonlendir(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((_)async{
      User? kullanici = _auth.currentUser;

      if (kullanici != null) {
        _kitaplarSayfasiniAc(context);
      } else {
        _girisSayfasiniAc(context);
      }
    });
  }

  void _girisSayfasiniAc(BuildContext context) {
    MaterialPageRoute sayfaYolu = MaterialPageRoute(
      builder: (BuildContext context) {
        return ChangeNotifierProvider(
          create: (BuildContext context) => GirisViewModel(),
          child: GirisSayfasi(),
        );
      },
    );
    Navigator.pushReplacement(context, sayfaYolu);
  }

  void _kitaplarSayfasiniAc(BuildContext context) {
    MaterialPageRoute sayfaYolu = MaterialPageRoute(
      builder: (BuildContext context) {
        return ChangeNotifierProvider(
            create: (BuildContext context) => KitaplarViewModel(),
            child: KitaplarSayfasi(),
        );
      },
    );
    Navigator.pushReplacement(context, sayfaYolu);
  }
}
