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
  var _pontuacaoTotal = 0;
  final _perguntas = const [
    {
      'texto': 'Qual a sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'pontuacao': 10},
        {'texto': 'Verde', 'pontuacao': 05},
        {'texto': 'Amarelo', 'pontuacao': 5},
      ],
    },
    {
      'texto': 'Qual a sua linguagem de programação favorita?',
      'respostas': [
        {'texto': 'Dart', 'pontuacao': 08},
        {'texto': 'Js', 'pontuacao': 09},
        {'texto': 'Java', 'pontuacao': 5},
      ],
    },
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        perguntaSelecinada++;
        _pontuacaoTotal += pontuacao;
      });
    }

    print(_pontuacaoTotal);
  }

  void _reiniciarQuestionario() {
    setState(() {
      perguntaSelecinada = 0;
      _pontuacaoTotal = 0;
    });
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
              : Resultado(
                  _pontuacaoTotal,
                  _reiniciarQuestionario,
                )),
    );
  }
}
