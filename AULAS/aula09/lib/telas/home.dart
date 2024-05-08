import 'package:aula09/telas/tela_Adicionar.dart';
import 'package:aula09/telas/tela_consulta.dart';
import 'package:aula09/widgets/widget_button.dart';
import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Escolha a opção 2"),
      ),
      body: _body(context),
    );
  }

  _body(BuildContext ctx) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Buttons("Cadastrar", onPressed:() {_abreTelas(ctx, TelaAdicionar() );}),
          Buttons("Consultar", onPressed: () {_abreTelas(ctx, TelaConsulta() );})
        ],
      ),
    );
  }


  _abreTelas(ctx, page){
    Navigator.push(ctx, MaterialPageRoute(builder: (BuildContext context)
    {
      return page;
    }));
  }
}
