import 'package:exercicio2/textos.dart';
import 'package:exercicio2/widget_button.dart';
import 'package:exercicio2/widgets_input.dart';
import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String tabuadaText = '';

  void exibirTabuada(int numero) {
    String result = '';
    for (int i = 1; i <= 10; i++) {
      result += '$numero x $i = ${numero * i}\n';
    }
    setState(() {
      tabuadaText = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController numeroController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Segunda Tela'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Textos('Informe um número:'),
            InputTextos('Número', 'Informe o número', controller: numeroController),
            SizedBox(height: 20),
            Buttons(
              'Exibir Tabuada',
              onPressed: () {
                int numero = int.tryParse(numeroController.text) ?? 0;
                exibirTabuada(numero);
              },
            ),
            SizedBox(height: 20),
            Textos('Tabuada:'),
            Textos(tabuadaText),
          ],
        ),
      ),
    );
  }
}
