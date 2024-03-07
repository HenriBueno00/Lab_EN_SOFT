import 'package:flutter/material.dart';

import 'Widgets/textos.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exemplo 02"),
        backgroundColor: Colors.purple,
      ),
      body: _body(),

      );
  }

  _body() {
    return Container(
      color: Colors.orange,
      child: Column(
        children: <Widget>[
          Textos("texto01"),
          Textos("Texto02"),
          Textos("Texto03"),

        ],
      ),
    );
  }

}