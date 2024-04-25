import 'package:flutter/material.dart';
import 'package:prova01/tela01.dart';
import 'package:prova01/tela02.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minha Tela',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: Colors.blueAccent,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Tela01()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Tela02()),
              );
            },
            ),
        ],
      ),
      body: Center(
        child: Text(
          'Henrique Bueno Fonseca',
          style:
          TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}
