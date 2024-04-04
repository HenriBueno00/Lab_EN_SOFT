import 'package:aula06/widgets/imagens.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';


class Cards extends StatefulWidget {
  String imagemFrente;
  String imagemTras;
  bool permiteTroca;
  Cards(this.imagemFrente, this.imagemTras, this.permiteTroca);

  @override
  _CardsState createState() => _CardsState();


}

class _CardsState extends State<Cards> {
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();



  @override
  Widget build(BuildContext context) {
    return FlipCard(
      key: cardKey,
      flipOnTouch: widget.permiteTroca,
      speed: 500,
      back: Container(
        child: SuaImagem(caminhoArquivo: widget.imagemTras),
      ),
      front: Container(
        child: SuaImagem(caminhoArquivo: widget.imagemFrente),
      ),
    );
  }
}
