import 'package:flutter/material.dart';
class Buttons extends StatelessWidget {
  final String texto;
  final void Function() onPressed;
  Buttons(this.texto, { required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        child: Text(texto));
  }
}
