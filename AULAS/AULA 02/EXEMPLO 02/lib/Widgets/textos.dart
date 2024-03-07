import 'package:flutter/material.dart';
class Textos extends StatelessWidget {
  String seuTexto;
  @override
  Widget build(BuildContext context) {
    return Text(
      seuTexto,
      style: TextStyle(
        color: Colors.blue,
        fontSize: 22,
        fontWeight: FontWeight.bold,

      ),
    );
  }
  Textos(this.seuTexto);
}
