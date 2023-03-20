import 'package:flutter/material.dart';

import '../entities/movimentacao.dart';
import '../scheme/emprestimos_typography.dart';

class MovimentacaoWidget extends StatelessWidget {
  const MovimentacaoWidget({
    Key? key,
    required this.movimentacao,
  }) : super(key: key);

  final Movimentacao movimentacao;

  @override
  Widget build(BuildContext context) {
    Operacao operacao = Operacao.values
        .firstWhere((item) => movimentacao.operacao == item.name);
    IconData movimentacaoIcon = operacao.icone!;

    return Card(
      elevation: 2.0,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: Icon(movimentacaoIcon)),
            Text(
              movimentacao.dataOperacao,
              style: EmprestimosTypography.itemLabel.textStyle,
            ),
            const Spacer(),
            Text(
              movimentacao.valor.toString(),
              style: EmprestimosTypography.itemLabel.textStyle,
              textAlign: TextAlign.right,
            ),
          ],
        ),
      ),
    );
  }
}
