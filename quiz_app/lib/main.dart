import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

void main() => runApp(PerguntaApp());

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}

class _PerguntaAppState extends State<PerguntaApp> {
  var perguntaSelecinada = 0;

  void _responder() {
    setState(() {
      perguntaSelecinada++;
    });
  }

  final perguntas = const [
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

  List<Widget> _construirRespostas() {
    List<Widget> respostas = [];
    for (String textoResp
        in perguntas[perguntaSelecinada].cast()['respostas']) {
      respostas.add(Resposta(textoResp, _responder));
    }
    return respostas;
  }

  @override
  Widget build(BuildContext context) {
    // Aqui estamos verificando se a pergunta selecionada é válida antes de construir as respostas.
    List<Widget> respostas =
        perguntaSelecinada < perguntas.length ? _construirRespostas() : [];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: Column(
          children: <Widget>[
            Questao(perguntas[perguntaSelecinada]['texto'].toString()),
            ...respostas,
          ],
        ),
      ),
    );
  }
}
