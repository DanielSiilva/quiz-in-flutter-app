import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

void main() => runApp(PerguntaApp());

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}

class _PerguntaAppState extends State<PerguntaApp> {
  var perguntaSelecinada = 0;
  final _perguntas = const [
    {
      'texto': 'Qual a sua cor favorita?',
      'respostas': ['Preto', 'Azul', 'Verde', 'Amarelo'],
    },
    {
      'texto': 'Qual a sua linguagem de programação favorita?',
      'respostas': ['Js', 'Dart', 'Nodejs', 'React'],
    },
    {
      'texto': 'React Native ou Flutter?',
      'respostas': ['Js', 'Dart', 'Nodejs', 'React'],
    },
  ];

  void _responder() {
    if (temPerguntaSelecionada) {
      setState(() {
        perguntaSelecinada++;
      });
    }
  }

  bool get temPerguntaSelecionada {
    return perguntaSelecinada < _perguntas.length;
  }

  List<String> _construirRespostas() {
    List<String> respostas = _perguntas[perguntaSelecinada].cast()['respostas'];

    return respostas;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Perguntas'),
          ),
          body: temPerguntaSelecionada
              ? Questionario(
                  perguntas: _perguntas,
                  perguntaSelecionadas: perguntaSelecinada,
                  responder: _responder,
                )
              : Resultado()),
    );
  }
}
