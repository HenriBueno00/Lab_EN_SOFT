import 'package:flutter/material.dart';
import 'dart:math';

class Tela02 extends StatefulWidget {
  @override
  _Tela02State createState() => _Tela02State();
}

class _Tela02State extends State<Tela02> {
  double valorInicial = 0;
  double taxaJurosMensal = 0;
  int periodoMeses = 0;
  double valorFinal = 0;
  double rendimentoMensalTotal = 0;
  List<double> rendimentosMensais = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de Rendimento'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Valor Inicial (R\$)'),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    valorInicial = double.parse(value);
                  });
                },
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(labelText: 'Taxa de Juros (%)'),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    taxaJurosMensal = double.parse(value) / 100;
                  });
                },
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(labelText: 'Período (meses)'),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    periodoMeses = int.parse(value);
                  });
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (validarEntrada()) {
                    calcularRendimento();
                    setState(() {});
                  }
                },
                child: Text('Calcular'),
              ),
              SizedBox(height: 20),
              Text(
                'Valor Final: R\$ ${valorFinal.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              Text(
                'Rendimento Total (6 meses): R\$ ${rendimentoMensalTotal.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: rendimentosMensais.take(6).map((rendimento) {
                  int index = rendimentosMensais.indexOf(rendimento);
                  return ListTile(
                    title: Text('Mês ${index + 1}'),
                    trailing: Text('R\$ ${rendimento.toStringAsFixed(2)}'),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool validarEntrada() {
    if (valorInicial < 1000 || valorInicial > 10000) {
      _mostrarMensagemErro('Valor inicial deve estar entre R\$ 1.000 e R\$ 10.000');
      return false;
    }

    if (taxaJurosMensal < 0.005 || taxaJurosMensal > 0.025) {
      _mostrarMensagemErro('Taxa de juros deve estar entre 0,5% e 2,5%');
      return false;
    }

    if (periodoMeses < 6 || periodoMeses > 36) {
      _mostrarMensagemErro('Período de investimento deve estar entre 6 e 36 meses');
      return false;
    }

    return true;
  }


  void calcularRendimento() {
    valorFinal = valorInicial * pow(1 + taxaJurosMensal, periodoMeses);
    rendimentoMensalTotal = (valorFinal - valorInicial) / periodoMeses;
    rendimentosMensais.clear();

    double saldoAtual = valorInicial;

    for (int mes = 1; mes <= periodoMeses; mes++) {
      double rendimentoMensalMes = saldoAtual * taxaJurosMensal;
      rendimentosMensais.add(rendimentoMensalMes);

      saldoAtual += rendimentoMensalMes;
    }
  }

  void _mostrarMensagemErro(String mensagem) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensagem),
        backgroundColor: Colors.red,
      ),
    );
  }
}
