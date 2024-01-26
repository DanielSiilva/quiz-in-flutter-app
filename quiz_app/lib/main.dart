import 'package:flutter/material.dart';

main() => runApp(PerguntaApp());

//StatelessWidget: Componente sem estado
class PerguntaApp extends StatelessWidget {
  var perguntaSelecinada = 1;
  void responder() {
    perguntaSelecinada++;
    print(perguntaSelecinada);
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
            Text(perguntas[perguntaSelecinada]),
            ElevatedButton(
              child: Text('Botao 01'),
              onPressed: responder,
            ),
            ElevatedButton(
              child: Text('Botao 02'),
              onPressed: responder,
            ),
            ElevatedButton(
              child: Text('Botao 03'),
              onPressed: responder,
            )
          ],
        ),
      ),
    );
  }
}
