import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionadas;
  final void Function(int) responder;

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
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionadas]['respostas']
                as List<Map<String, Object>>? ??
            []
        : [];
    return Column(
      children: <Widget>[
        Questao(perguntas[perguntaSelecionadas]['texto'].toString()),
        ...respostas.map((resp) {
          // Aqui, garantimos que 'resp['pontuacao']' seja tratado como um 'int'.
          int pontuacao = (resp['pontuacao'] as int?) ?? 0;
          return Resposta(
              resp['texto'] as String? ?? '', () => responder(pontuacao));
        }).toList(),
      ],
    );
  }
}
