// TODO Implement this library.// TODO Implement this library.// TODO Implement this library.
import 'package:flutter/material.dart';


class GirisSayfasi extends StatefulWidget {
  const GirisSayfasi({Key? key}) : super(key: key);

  @override
  State<GirisSayfasi> createState() => _GirisSayfasiState();
}

class _GirisSayfasiState extends State<GirisSayfasi> {
  TextEditingController _epostaController = TextEditingController();
  TextEditingController _sifreController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Giriþ Sayfasi"),
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
              controller: _epostaController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border:  OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: "E-posta",
                ),
              ),
              SizedBox(height: 16,),
              TextField(
              controller: _sifreController,
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: "Þifre",
              ),
            ),
            SizedBox(height: 16),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                child: Text("Giriþ Yap"),
                onPressed: () {
                  _epostaVeSifreIleGiris(context);
                  },
                ),
              ),
            SizedBox(height: 16),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  child: Text("Hesabýnýz yok mu? Kayýt olun"),
                  onPressed: () {
                    _kayitSayfasiniAc(context);
               },
              ),
             ),
             SizedBox(height: 16),
              TextButton(
               child: Text("Þifremi unuttum",
                 style: TextStyle(decoration: TextDecoration.underline),
              ),
              onPressed: onPressed() {
                _sifreSifirla(context);
              },
            ),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                child: Text("Google ile giriþ"),
                onPressed: () {
                  _googleIleGiris(context);
                },
               ),
              ),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  child: Text("Apple ile giriþ"),
                    onPressed: () {
                      _appleIleGiris(context);
                    },
                  ),
                ),
               Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Text("Telefon Numarasý  ile giriþ"),
                      onPressed: () {
                        _telefonNumarasiIleGiris(context);
                       },
                     ),
                    ),
                  ],
                ),
    );
 }
}
