import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionadas;
  final void Function() responder;

  Questionario({
    required this.perguntas,
    required this.perguntaSelecionadas,
    required this.responder,
  });

  bool get temPerguntaSelecionada {
    return perguntaSelecionadas < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    // Aqui estamos verificando se a pergunta selecionada é válida antes de construir as respostas.
    List<String> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionadas].cast()['respostas']
        : [];
    return Column(
      children: <Widget>[
        Questao(perguntas[perguntaSelecionadas]['texto'].toString()),
        ...respostas.map((t) => Resposta(t, responder)).toList()
      ],
    );
  }
}
