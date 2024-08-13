import 'dart:io';

import 'package:katmanli_mimari_flutter/base/depolama_base.dart';
import 'package:katmanli_mimari_flutter/main.dart';
import 'package:katmanli_mimari_flutter/service/base/depolama_service.dart';
import 'package:katmanli_mimari_flutter/service/depolama_service_firebase.dart';

class DepolamaRepository implements DepolamaBase {
  final DepolamaService _service = locator<FirebaseDepolamaService>();

  @override
  dosyaYukle(String dosyaYolu, File dosya) async {
    return await _service.dosyaYukle(dosyaYolu, dosya);
  }
}
