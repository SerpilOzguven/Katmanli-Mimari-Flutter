import 'package:flutter/material.dart';

class TelefonIleGirisSayfasi extends StatefulWidget {
  const TelefonIleGirisSayfasi({Key? key}) : super(key: key);

  @override
  State<TelefonIleGirisSayfasi> createState() => _TelefonIleGirisSayfasiState();
}

class _TelefonIleGirisSayfasiState extends State<TelefonIleGirisSayfasi> {
  TextEditingController _telefonNumarasiController = TextEditingController();
  TextEditingController _dogrulamaKoduController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Telefon Numarasý ile Giriþ"),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 32, left: 16, right: 16),
      child: Column(
        children: [
          TextField(
            controller: _telefonNumarasiController,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              labelText: "Telefon numarasý",
            ),
          ),
          SizedBox(height: 16),
          Container(
            width: double.infinity,
            child: ElevatedButton(
              child: Text("Dogrulama kodu gönder"),
              onPressed: _dogrulamaKoduGonder,
            ),
          ),
          SizedBox(height: 48),
          Visibility(
            visible: _dogrulamaBolumunuGoster,
            child: Column(
              children: [
                TextField(
                  controller: _dogrulamaKoduController,
                  keyboardType: TextInputType.number,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: "Dogrulama kodu",
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Text("Dogrulama kodunu onayla"),
                    onPressed: () {
                      _dogrulamaKodunuOnayla(context);
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 48),
          Container(
            width: double.infinity,
            child: ElevatedButton(
              child: Text("Diðer giriþyöntemleri"),
              onPressed: () {
                _girisSayfasiniAc(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
