import 'package:flutter/material.dart';

class KayitSayfasi extends StatefulWidget {
  const KayitSayfasi({Key? key}) : super(key: key);

  @override
  State<KayitSayfasi> createState() => _KayitSayfasiState();
}

class _KayitSayfasiState extends State<KayitSayfasi> {
  TextEditingController _adSoyadController = TextEditingController();
  TextEditingController _epostaController = TextEditingController();
  TextEditingController _sifreController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("KayýtSayfasý"),
      ),
      body: _buildBody(BuildContext context) {
        return Padding(
        padding: EdgeInsets.only(top: 32,left: 16, right: 16),
        child:Column(
          children: [
            TextField(
            controller: _adSoyadController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              labelText: "Ad - Soyad",
            ),
          ),
          SizedBox(height: 16),
          TextField(
          controller: _epostaController,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            labelText: "E- posta",
            ),
          ),
          SizedBox(height: 16),
            TextField(
              controller: _sifreController,
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration,
                border:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText:"Þifre",
              ),
            ),
          SizedBox(height:16),
          Container(
          width: double.infinity,
          child:ElevatedButton(
            child:Text("Kayit Ol"),
            onPressed:(){
              _epostaVeSifreIleKayit(context);

            },
          ),
    ),
          SizedBox(height:16),
            Container(
              width: double.infinity,
              child:ElevatedButton(
                child:Text("Kayit Ol"),
                  onPressed:(){
                    _girisSayfasiniAc(context);
                  },
                ),
                ),
              ],
            ),
        );
  }
}
