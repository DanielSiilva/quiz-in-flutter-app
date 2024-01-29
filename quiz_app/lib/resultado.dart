import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciarQuestionario;

  Resultado(
    this.pontuacao,
    this.quandoReiniciarQuestionario,
  );

  String get frasePontuacao {
    print('A pontuação é: $pontuacao'); // Imprimindo a pontuação no console

    if (pontuacao < 9) {
      return 'Tu é mais ou menos';
    } else if (pontuacao < 12) {
      return 'Tu é bom!';
    } else if (pontuacao > 19) {
      return 'Brabo demais.';
    } else {
      return 'Bradinho';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            frasePontuacao,
            style: TextStyle(fontSize: 28),
          ),
        ),
        ElevatedButton(
          onPressed: quandoReiniciarQuestionario,
          child: const Text('Reiniciar '),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          ),
        ),
      ],
    );
  }
}
