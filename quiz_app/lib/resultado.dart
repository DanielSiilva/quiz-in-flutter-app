import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;

  Resultado(this.pontuacao);

  String get frasePontuacao {
    switch (pontuacao) {
      case < 9:
        return ('Tu é mais ou menos');
      case >= 12:
        return ('Tu e bom!');
      case >= 19:
        return ('Brabo demais.');
      default:
        return ('Bradinho');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        frasePontuacao,
        style: TextStyle(fontSize: 28),
      ),
    );
  }
}
