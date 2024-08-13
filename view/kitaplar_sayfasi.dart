// TODO Implement this library.// TODO Implement this library.// TODO Implement this library.import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:katmanli_mimari_flutter/model/kitap.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

class KitapSayfasi extends StatelessWidget {
  const KitapSayfasi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kitaplar Sayfasý"),
        actions: [
          IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                KitaplarViewModel viewModel = Provider.of<KitaplarViewModel>(
                  context,
                  listen: false,
                );
                viewModel.seciliKitaplarSil();
              }
          ),
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              KitaplarViewModel viewModel = Provider.of<KitaplarViewModel>(
                context,
                listen: false,
              );
              viewModel.cikisYap(context);
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          KitaplarViewModel viewModel = Provider.of<KitaplarViewModel>(
            context,
            listen: false,
          );
          viewModel.kitapEkle(context);
        },
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return _buildListview();
  }

  Widget _buildListview() {
    return Column(
        children: [
        _kategoriFiltresi(),
    Expanded(
    child: Consumer<KitaplarViewModel>(
    builder: (context,viewModel,child) = ListView.builder(
    controller: _scrollController,
    itemCount: kitaplar.length,
    itemBuilder(BuildContext context,int index)
    return ChangeNotifier.value(
    value: viewModel.kitaplar[index],
    child: _buildListTile,
    );
  }

  ,
  ),
  ),
  ),
  ],
  );
}


Widget _buildListTile(BuildContext context, int index) {
  return ListTile(
      leading: SizedBox(
        width: 48,
        height: 48,
        child: Consumer<Kitap>(
          builder: (context, kitap, child) = Image.network(
            kitap.resim ??
                "https://firestorage.googleapis.com"
                    "/v0/b/yazar_d3654.appshot.com/o"
                    "/flutter_logo.jpg?alt=media&token="
                    "6b76a533-397b-4d87-8e9f-f4a481e52f27",
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: Consumer<Kitap>(
        builder: (context, kitap, child) => Text(kitap.isim),
      ),

      subtitle: Consumer<Kitap>(
        builder: (context, kitap, child) =>
            Text(
                Sabitler.kategoriler[_kitaplar[index].kategori] ?? ""
            ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(Icons.add_a_photo),
            onPressed: () {
              KitaplarViewModel viewModel = Provider.of<KitaplarViewModel>(
                context,
                listen: false,
              );
              viewModel.resimEkle(context);
            },
          ),
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              KitaplarViewModel viewModel = Provider.of<KitaplarViewModel>(
                context,
                listen: false,
              );
              viewModel.kitapGuncelle(context, index);
            },
          ),
          Consumer<Kitap>(
            builder: (context, kitap, child) =>Checkbox{
                value: kitap.seciliMi,
                onChanged: (bool? yeniDeger) {
                  KitaplarViewModel viewModel = Provider.of<KitaplarViewModel>(
                    context,
                    listen: false,
                  );
                  viewModel.kitapSecimiDegisti(index, yeniDeger);
                  kitap.seciliMi = yeniDeger;
                  }
                }
              ),
           ),
        ],
      ),
      onTap: () {
        KitaplarViewModel viewModel = Provider.of<KitaplarViewModel>(
          context,
          listen: false,
        );
        viewModel.bolumlerSayfasiniAc(context, index);
      },
    );
  }

Widget _kategoriFiltresi() {
  return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
      Text(
      "kategori:",
      style:TextStyle(fontSize:16),
      ),

      Consumer<KitaplarViewModel>(
        builder: builder, viewModel, child) => DropdownButton(
          value: viewModel.secilenKategori,
          onChanged: (int? yeniSecilenKategori) {
            KitaplarViewModel viewModel = Provider.of<KitaplarViewModel>(
              context,
              listen: false,
            );
            viewModel.kategoriSecimiDegisti(yeniSecilenKategori);
          },
          items: viewModel.tumKategoriler.map<DropdownMenuItem<int>>(
            (kategoriId) {
              return DropdownMenuItem<int>(
                value: kategoriId,
                child:Text(kategoriId == -1
                  ? "Hepsi"
                  :Sabitler.kategorilerId] ?? ""),
                );
              },
            ).toList(),
          ),
        ),
      ],
    );
  }
}