import 'package:flutter/material.dart';
import 'package:pre_prova01/exercicio1.dart';
import 'package:pre_prova01/exercicio2.dart';
import 'package:pre_prova01/exercicio3.dart'; // Importe o exercicio3.dart

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela Inicial'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Exercicio1()),
                );
              },
              child: Text('Exercício 1'),
            ),
            SizedBox(height: 20), // Adicione um espaço entre os botões
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Exercicio2()),
                );
              },
              child: Text('Exercício 2'),
            ),
            SizedBox(height: 20), // Adicione mais um espaço entre os botões
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Exercicio3()),
                );
              },
              child: Text('Exercício 3'),
            ),
          ],
        ),
      ),
    );
  }
}
