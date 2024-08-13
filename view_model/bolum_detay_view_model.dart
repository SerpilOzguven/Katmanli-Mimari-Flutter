import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:katmanli_mimari_flutter/model/bolum.dart';
import 'package:katmanli_mimari_flutter/service/veri_tabani_service_firestore.dart';

class BolumDetayViewModel with ChangeNotifier {
  //YerelVeriTabani _yerelVeriTabani = YerelVeriTabani();
  ///UzakVeriTabani _uzakVeriTabani = UzakVeriTabani();
  final FirestoreVeriTabaniService _firestoreVeriTabaniService = FirestoreVeriTabaniService();

  final Bolum bolum;

  BolumDetayViewModel(this.bolum);

  void icerigiKaydet(String icerik) async {
    bolum.icerik = icerik;
    await _firestoreVeriTabaniService.updateBolum(bolum);
  }
}
