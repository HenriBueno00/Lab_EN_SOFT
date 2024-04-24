import 'package:flutter/material.dart';

class Tela01 extends StatefulWidget {
  const Tela01({Key? key});

  @override
  State<Tela01> createState() => _Tela01State();
}

class _Tela01State extends State<Tela01> {
  final TextEditingController precoController = TextEditingController();
  final TextEditingController descontoController1 = TextEditingController();
  final TextEditingController freteController1 = TextEditingController();
  final TextEditingController descontoController2 = TextEditingController();
  final TextEditingController freteController2 = TextEditingController();
  final TextEditingController descontoController3 = TextEditingController();
  final TextEditingController freteController3 = TextEditingController();

  double valorFinalLoja1 = 0.0;
  double valorFinalLoja2 = 0.0;
  double valorFinalLoja3 = 0.0;


  void calcularValorFinal() {
    double preco = double.parse(precoController.text);
    double desconto1 = double.parse(descontoController1.text);
    double frete1 = double.parse(freteController1.text);
    double desconto2 = double.parse(descontoController2.text);
    double frete2 = double.parse(freteController2.text);
    double desconto3 = double.parse(descontoController3.text);
    double frete3 = double.parse(freteController3.text);


    valorFinalLoja1 = (preco - (preco * (desconto1 / 100))) + frete1;
    valorFinalLoja2 = (preco - (preco * (desconto2 / 100))) + frete2;
    valorFinalLoja3 = (preco - (preco * (desconto3 / 100))) + frete3;


    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela 01"),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Loja 1:',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              controller: precoController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Preço do Produto'),
            ),
            TextFormField(
              controller: descontoController1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Desconto (%)'),
            ),
            TextFormField(
              controller: freteController1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Frete'),
            ),
            SizedBox(height: 20.0),
            Text(
              'Loja 2:',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              controller: descontoController2,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Desconto (%)'),
            ),
            TextFormField(
              controller: freteController2,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Frete'),
            ),
            SizedBox(height: 20.0),
            Text(
              'Loja 3:',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              controller: descontoController3,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Desconto (%)'),
            ),
            TextFormField(
              controller: freteController3,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Frete'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: calcularValorFinal,
              child: Text('Calcular'),
            ),
            SizedBox(height: 20.0),
            Text(
              'Valor Final em cada Loja:',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text('Loja 1: \$${valorFinalLoja1.toStringAsFixed(2)}'),
            Text('Loja 2: \$${valorFinalLoja2.toStringAsFixed(2)}'),
            Text('Loja 3: \$${valorFinalLoja3.toStringAsFixed(2)}'),
          ],
        ),
      ),
    );
  }
}
