import 'package:flutter/material.dart';
import 'package:pre_prova01/widgets/textos.dart';
import 'package:pre_prova01/widgets/widget_button.dart';


class Exercicio1 extends StatefulWidget {
  @override
  _Exercicio1State createState() => _Exercicio1State();
}

class _Exercicio1State extends State<Exercicio1> {
  TextEditingController _totalController = TextEditingController();
  TextEditingController _gorjetaController = TextEditingController();
  TextEditingController _amigosController = TextEditingController();

  double _valorTotal = 0;
  double _percentualGorjeta = 0;
  int _numeroAmigos = 0;

  double _valorPorAmigo = 0;

  void _calcular() {
    setState(() {
      _valorTotal = double.tryParse(_totalController.text) ?? 0;
      _percentualGorjeta = double.tryParse(_gorjetaController.text) ?? 0;
      _numeroAmigos = int.tryParse(_amigosController.text) ?? 0;

      double valorGorjeta = (_valorTotal * _percentualGorjeta) / 100;
      double valorTotalComGorjeta = _valorTotal + valorGorjeta;
      _valorPorAmigo = valorTotalComGorjeta / _numeroAmigos;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercício 1'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _totalController,
              decoration: InputDecoration(labelText: 'Valor total da conta'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10),
            TextField(
              controller: _gorjetaController,
              decoration: InputDecoration(labelText: 'Percentual de gorjeta'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10),
            TextField(
              controller: _amigosController,
              decoration: InputDecoration(labelText: 'Número de amigos'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            Buttons(
              'Calcular',
              onPressed: _calcular,
            ),
            SizedBox(height: 20),
            Textos('Cada amigo deverá pagar $_valorPorAmigo'),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _totalController.dispose();
    _gorjetaController.dispose();
    _amigosController.dispose();
    super.dispose();
  }
}
