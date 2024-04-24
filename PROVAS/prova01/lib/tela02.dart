import 'package:flutter/material.dart';
import 'dart:math';

class Tela02 extends StatefulWidget {
  const Tela02({Key? key});

  @override
  State<Tela02> createState() => _Tela02State();
}

class _Tela02State extends State<Tela02> {
  final TextEditingController valorInvestidoController = TextEditingController();
  final TextEditingController taxaJurosController = TextEditingController();
  final TextEditingController periodoInvestimentoController = TextEditingController();

  double valorFinalInvestimento = 0.0;
  List<double> rendimentosMensais = [];

  void calcularRendimento() {
    double valorInvestido = double.tryParse(valorInvestidoController.text) ?? 0.0;
    double taxaJuros = double.tryParse(taxaJurosController.text) ?? 0.0 / 100;
    int periodoInvestimento = int.tryParse(periodoInvestimentoController.text) ?? 0;

    valorFinalInvestimento = valorInvestido * pow(1 + taxaJuros, periodoInvestimento);

    rendimentosMensais.clear();
    for (int i = 1; i <= 6; i++) {
      double rendimento = valorInvestido * taxaJuros * i;
      rendimentosMensais.add(rendimento);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela 02"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: valorInvestidoController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Valor Investido (R\$)'),
            ),
            SizedBox(height: 10.0),
            TextFormField(
              controller: taxaJurosController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Taxa de Juros Mensal (%)'),
            ),
            SizedBox(height: 10.0),
            TextFormField(
              controller: periodoInvestimentoController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Período de Investimento (meses)'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: calcularRendimento,
              child: Text('Calcular'),
            ),
            SizedBox(height: 20.0),
            Text(
              'Valor Final do Investimento: R\$${valorFinalInvestimento.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text(
              'Rendimento Mensal:',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Expanded(
              child: ListView.builder(
                itemCount: rendimentosMensais.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Mês ${index + 1}: R\$${rendimentosMensais[index].toStringAsFixed(2)}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
