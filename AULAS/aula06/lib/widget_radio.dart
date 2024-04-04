import 'package:aula06/widgets/textos.dart';
import 'package:flutter/material.dart';
class ExemploRadio extends StatefulWidget {
  const ExemploRadio({super.key});

  @override
  State<ExemploRadio> createState() => _ExemploRadioState();
}

class _ExemploRadioState extends State<ExemploRadio> {
  int _resposta01=-1;
  int total=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Textos("Exemplo Radio"),
      ),
      body: _radioButton(),
    );
  }
  _radioButton() {
    return Container(
      height: double.infinity,
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Textos("Santos"),
                    Radio(
                        value: 10,
                        groupValue: _resposta01,
                        onChanged: _radioValueChangeResposta1,
                    )
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Textos("Palmeiras"),
                    Radio(
                      value: 1,
                      groupValue: _resposta01,
                      onChanged: _radioValueChangeResposta1,
                    )
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Textos("São Paulo"),
                    Radio(
                      value: 2,
                      groupValue: _resposta01,
                      onChanged: _radioValueChangeResposta1,
                    )
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Textos("Pontos: "+total.toString())
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void _radioValueChangeResposta1(int value) {
    setState(() {
      _resposta01 = value;
      if (_resposta01==10)
      {
        total=total+value;
      }
    });
  }
}
