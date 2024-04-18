import 'package:flutter/material.dart';

class Exercicio2 extends StatefulWidget {
  const Exercicio2({Key? key}) : super(key: key);

  @override
  _Exercicio2State createState() => _Exercicio2State();
}

class _Exercicio2State extends State<Exercicio2> {
  TextEditingController _temperaturasController = TextEditingController();
  List<double> _temperaturas = [];

  double _menorTemperatura = 0;
  double _mediaTemperatura = 0;
  double _maiorTemperatura = 0;
  double _maiorVariacao = 0;
  int _anoMaiorVariacao = 0;

  void _calcular() {
    _temperaturas.clear();
    _temperaturas = _temperaturasController.text.split(',').map(double.parse).toList();

    _menorTemperatura = _temperaturas.reduce((min, e) => e < min ? e : min);
    _maiorTemperatura = _temperaturas.reduce((max, e) => e > max ? e : max);
    _mediaTemperatura = _temperaturas.reduce((sum, e) => sum + e) / _temperaturas.length;

    double maiorVariacao = 0;
    for (int i = 1; i < _temperaturas.length; i++) {
      double variacao = (_temperaturas[i] - _temperaturas[i - 1]).abs();
      if (variacao > maiorVariacao) {
        maiorVariacao = variacao;
        _anoMaiorVariacao = i;
      }
    }
    _maiorVariacao = maiorVariacao;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercício 2'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    controller: _temperaturasController,
                    decoration: InputDecoration(
                      labelText: 'Temperaturas Médias (separadas por vírgula)',
                      hintText: 'Ex: 20,21,22,...',
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _calcular,
                    child: Text('Calcular'),
                  ),
                ],
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Menor temperatura: $_menorTemperatura'),
                  Text('Média de temperatura: $_mediaTemperatura'),
                  Text('Maior temperatura: $_maiorTemperatura'),
                  Text('Ano com maior variação: $_anoMaiorVariacao'),
                  Text('Maior variação: $_maiorVariacao'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _temperaturasController.dispose();
    super.dispose();
  }
}
