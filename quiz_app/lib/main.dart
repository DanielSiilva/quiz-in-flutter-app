import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';
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

  List<String> _construirRespostas() {
    List<String> respostas = _perguntas[perguntaSelecinada].cast()['respostas'];

    return respostas;
  }

  bool get temPerguntaSelecionada {
    return perguntaSelecinada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    // Aqui estamos verificando se a pergunta selecionada é válida antes de construir as respostas.
    List<String> respostas = temPerguntaSelecionada
        ? _perguntas[perguntaSelecinada].cast()['respostas']
        : [];

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Perguntas'),
          ),
          body: temPerguntaSelecionada
              ? Column(
                  children: <Widget>[
                    Questao(_perguntas[perguntaSelecinada]['texto'].toString()),
                    ...respostas.map((t) => Resposta(t, _responder)).toList()
                  ],
                )
              : Resultado()),
    );
  }
}
