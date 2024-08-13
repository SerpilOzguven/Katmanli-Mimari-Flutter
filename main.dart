import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:katmanli_mimari_flutter/repository/depolama_repository.dart';
import 'package:katmanli_mimari_flutter/repository/kimlik_dogrulama_repository.dart';
import 'package:katmanli_mimari_flutter/repository/veri_tabani_repository.dart';
import 'package:katmanli_mimari_flutter/service/depolama_service_firebase.dart';
import 'package:katmanli_mimari_flutter/service/veri_tabani_service_firestore.dart';
import 'package:katmanli_mimari_flutter/view/acilis_sayfasi.dart';

GetIt locator = GetIt.instance;

setupLocator() {
  locator.registerLazySingleton(() => VeriTabaniRepository());
  locator.registerLazySingleton(() => FirestoreVeriTabaniService());
  //locator.registerLazySingleton(() => SqfliteVeriTabaniService());

  locator.registerLazySingleton(() => KimlikDogrulamaRepository());
  //locator.registerLazySingleton(() => FirebaseKimlikDogrulamaService());

  locator.registerLazySingleton(() => DepolamaRepository());
  locator.registerLazySingleton(() => FirebaseDepolamaService());
}



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AcilisSayfasi(),
    );
  }
}
