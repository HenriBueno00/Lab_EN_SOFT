import 'package:aula07/widgets/textos.dart';
import 'package:aula07/widgets/widget_button.dart';
import 'package:flutter/material.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

import 'dart:io';
import 'package:image_picker/image_picker.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  String codigoLido="000";
  String _imagePath="";
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exemplo imagem e qrCode"),
        backgroundColor: Colors.amber,
      ),
      body: _leituras(),
    );
  }

  _leituras() {
    return Container(
      height: double.infinity,
      color: Colors.blueAccent,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget> [
          Buttons("Leitura de qrCode", onPressed: leituraQR,),
          Buttons("Tirar foto", onPressed: _tirarFoto),
          Textos(codigoLido),
          _imagePath ==""?  Textos("sem imagem"):
              Image.file(
                File(_imagePath),
                fit: BoxFit.cover,
              scale: 50,)
        ],
      ),
    );
  }
  Future <void> leituraQR() async{
    var res = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const SimpleBarcodeScannerPage()
        ));
    setState(() {
      if (res is String){
        codigoLido = res;
      }
    });
  }
  Future <void> leituraImagem() async{
    final imagemCarregada = await ImagePicker.openCamera(
      pickType: PickType.image
    );
    if (imagemCarregada !=null){
      setState(() {
        _imagePath = (imagemCarregada[0].path);
      });
    }
    bool resultado = await ImagePicker.saveImageToAlbum(
      File(imagemCarregada![0].path), albumName: "testeFlutter"
    );
  }
}
