import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

main() => runApp(PerguntaApp());

//StatelessWidget: Componente sem estado

class _PerguntaAppState extends State<PerguntaApp> {
  var perguntaSelecinada = 0;
  void _responder() {
    setState(() {
      perguntaSelecinada++;
    });
    print(perguntaSelecinada);
  }

  @override
  //Posso trabalhar com inferencia tambem, retirando os campos onde esta sendo tipado, nao havera problemas
  final perguntas = [
    {
      'texto': 'Qual a sua cor favorita?',
      'respostas': [
        'Preto',
        'Azul',
        'Verde',
        'Amarelo',
      ]
    },
    {
      'texto': 'Qual a sua linguagem de programacao favorita?',
      'respostas': [
        'Js',
        'Dart',
        'Nodejs',
        'React',
      ]
    },
    {
      'texto': 'React Native ou Flutter?',
      'respostas': [
        'Js',
        'Dart',
        'Nodejs',
        'React',
      ]
    }
  ];

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: Column(
          children: <Widget>[
            Questao(perguntas[perguntaSelecinada]['texto'] as String),
            Resposta('Resposta 01', _responder),
            Resposta('Resposta 02', _responder),
            Resposta('Resposta 03', _responder),
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
