import 'package:aula06/novaTela.dart';
import 'package:aula06/tela03.dart';
import 'package:aula06/widgets/widget_card.dart';
import 'package:flutter/material.dart';
import 'package:aula06/widgets/textos.dart';


class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exemplo abre outras telas"),
        backgroundColor: Colors.blueAccent,
        actions: <Widget> [
          IconButton( onPressed: () {_novaTela(context, NovaTela()) ;},
            icon: Icon(
              Icons.ac_unit_outlined
            ),
          ),
          IconButton(onPressed: () { _tela3(context, Tela03()) ; },
              icon: Icon(
                Icons.add
              ),
          ),
        ],
      ),
    );
  }


  void _novaTela(ctx, page) {
    Navigator.push(ctx, MaterialPageRoute(builder: (BuildContext context)
        {
          return page;
        }));
  }

  void _tela3(ctx, page) {
    Navigator.push(ctx, MaterialPageRoute(builder: (BuildContext Context)
      {
        return page;
      }
    ));
  }
}
