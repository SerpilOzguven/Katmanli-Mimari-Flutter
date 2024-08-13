import 'package:katmanli_mimari_flutter/base/veri_tabani_base.dart';
import 'package:katmanli_mimari_flutter/main.dart';
import 'package:katmanli_mimari_flutter/model/bolum.dart';
import 'package:katmanli_mimari_flutter/model/kitap.dart';
import 'package:katmanli_mimari_flutter/service/base/veri_tabani_service.dart';
import 'package:katmanli_mimari_flutter/service/veri_tabani_service_firestore.dart';

class VeriTabaniRepository implements VeriTabaniBase {
  final VeriTabaniService _service = locator<FirestoreVeriTabaniService>();

  @override
  Future createBolum(Bolum bolum) async {
    return await _service.createBolum(bolum);
  }

  @override
  Future createKitap(Kitap kitap) async {
    return await _service.createKitap(kitap);
  }

  @override
  Future<int> deleteBolum(Bolum bolum) async {
    return await _service.deleteBolum(bolum);
  }

  @override
  Future<int> deleteKitap(Kitap kitap) async {
    return await _service.deleteKitap(kitap);
  }

  @override
  Future<int> deleteKitaplar(List kitapIdleri) async {
    return await _service.deleteKitaplar(kitapIdleri);
  }

  @override
  Future<List<Bolum>> readTumBolumler(kullaniciId, kitapId) async {
    return await _service.readTumBolumler(kullaniciId, kitapId);
  }

  @override
  Future<List> readTumKitaplar(
      kullaniciId, int kategoriId, sonKitap, int cekilecekVeriSayisi) async {
    return await _service.readTumKitaplar(
      kullaniciId,
      kategoriId,
      sonKitap,
      cekilecekVeriSayisi,
    );
  }

  @override
  Future<int> updateBolum(Bolum bolum) async {
    return await _service.updateBolum(bolum);
  }

  @override
  Future<int> updateKitap(Kitap kitap) {
    return _service.updateKitap(kitap);
  }
}
