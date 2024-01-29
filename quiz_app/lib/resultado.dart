import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;

  Resultado(this.pontuacao);

  String get frasePontuacao {
    if (pontuacao < 8) {
      return 'Parabens';
    } else if (pontuacao < 12) {
      return 'Voce é bom!';
    } else {
      return 'Tu é brado! ';
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
