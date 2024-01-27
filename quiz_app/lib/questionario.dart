import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {
  const Questionario({
    required List<Map<String, Object>> perguntas,
    required int perguntaSelecinada,
    required void Function() responder,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: <Widget>[
        Questao(perguntas[perguntaSelecinada]['texto'].toString()),
        ...respostas.map((t) => Resposta(t, responder)).toList()
      ],
    );
  }
}
