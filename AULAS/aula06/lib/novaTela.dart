import 'package:aula06/widgets/widget_card.dart';
import 'package:flutter/material.dart';

class NovaTela extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("flip card"),
        backgroundColor: Colors.amber,
      ),
      body: _card(),
    );
  }
  _card(){
    return GridView(
      scrollDirection: Axis.vertical,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      children: <Widget> [
        Cards("imagens/ADAAng.png", "imagens/Derac.jpg", true),
        Cards("imagens/XVdePira.png", "imagens/Santos.jpg", false),
        Cards("imagens/IBIS.png", "imagens/IBIS.png", true),
        Cards("imagens/SaoBento.jpg", "imagens/Santos.jpg", false),
      ],
    );
  }
}
