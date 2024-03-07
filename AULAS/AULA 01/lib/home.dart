import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Oi mundo"),
        backgroundColor: Colors.blueAccent,

      ),
      body: _body(),


    );
  }

  _body() {
    return ListView(
      children: [
        Text("Laysa minha vida"),
        Text("Eu te amo"),
        Text("Meu orgulho"),
        Text("Laysa minha vida"),
        Text("Eu te amo"),
        Text("Meu orgulho"),
        Text("Laysa minha vida"),
        Text("Eu te amo"),
        Text("Meu orgulho"),
        Text("Laysa minha vida"),
        Text("Eu te amo"),
        Text("Meu orgulho"),
        Text("Laysa minha vida"),
        Text("Eu te amo"),
        Text("Meu orgulho"),


      ],
    );

  }
}
