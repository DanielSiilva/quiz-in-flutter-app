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
      'respostas': [
        {'texto': 'Preto', 'nota': 10},
        {'texto': 'Verde', 'nota': 05},
        {'texto': 'Amarelo', 'nota': 5},
      ],
    },
    {
      'texto': 'Qual a sua linguagem de programação favorita?',
      'respostas': [
        {'texto': 'Dart', 'nota': 08},
        {'texto': 'Js', 'nota': 09},
        {'texto': 'Java', 'nota': 5},
      ],
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
