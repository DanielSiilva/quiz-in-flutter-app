import 'package:flutter/material.dart';

main() => runApp(PerguntaApp());

class PerguntaApp extends StatelessWidget {
  void responder() {
    print('Pergunta respondida');
  }

  @override
  final List<String> perguntas = [
    'Qual a sua cor favorita?',
    'Qual a sua linguagem de programacao favorita?'
  ];
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: Column(
          children: <Widget>[
            Text(perguntas[0]),
            ElevatedButton(
              child: Text('Botao 01'),
              onPressed: responder,
            ),
            ElevatedButton(
              child: Text('Botao 02'),
              onPressed: () {
                print('Resposta 02');
              },
            ),
            ElevatedButton(
                child: Text('Botao 03'), onPressed: () => print('Funcao 03'))
          ],
        ),
      ),
    );
  }
}
