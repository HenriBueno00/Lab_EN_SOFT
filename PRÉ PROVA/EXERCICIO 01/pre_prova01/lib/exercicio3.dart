import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Exercicio3 extends StatefulWidget {
  @override
  _Exercicio3State createState() => _Exercicio3State();
}

class _Exercicio3State extends State<Exercicio3> {
  FlutterTts flutterTts = FlutterTts();
  TextEditingController textController = TextEditingController();

  Future<void> _speak() async {
    await flutterTts.speak(textController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercício 3'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: textController,
              decoration: InputDecoration(
                labelText: 'Digite o texto',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _speak,
              child: Text('Converter em voz'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    flutterTts.stop();
    textController.dispose();
    super.dispose();
  }
}
