import 'package:flutter/material.dart';
import './questao.dart';

main() => runApp(PerguntaApp());

//StatelessWidget: Componente sem estado

class _PerguntaAppState extends State<PerguntaApp> {
  var perguntaSelecinada = 0;
  void responder() {
    setState(() {
      perguntaSelecinada++;
    });
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
            Questao(perguntas[perguntaSelecinada]),
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

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
