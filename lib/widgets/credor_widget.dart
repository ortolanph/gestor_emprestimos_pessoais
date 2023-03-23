import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gestor_emprestimos_pessoais/providers/credor_provider.dart';
import 'package:gestor_emprestimos_pessoais/repository/movimentacao_repository.dart';
import 'package:provider/provider.dart';

import '../entities/credor.dart';
import '../main.dart';
import '../scheme/emprestimos_typography.dart';

class CredorWidget extends StatefulWidget {
  const CredorWidget({
    Key? key,
    required this.credor,
    required this.credorIndex,
  }) : super(key: key);

  final Credor credor;
  final int credorIndex;

  @override
  State<CredorWidget> createState() => _CredorWidgetState();
}

class _CredorWidgetState extends State<CredorWidget> {
  final MovimentacaoRepository _movimentacaoRepository =
      autoInjector<MovimentacaoRepository>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<CredorProvider>().novoCredor(
            widget.credorIndex,
            widget.credor,
            _movimentacaoRepository
                .getMovimentacoesByCredorId(widget.credor.id));

        Navigator.pushNamed(
          context,
          "/viewCredor",
        );
      },
      child: Card(
        elevation: 2.0,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 3),
                child: FaIcon(FontAwesomeIcons.moneyBill1),
              ),
              Text(
                widget.credor.nome,
                style: EmprestimosTypography.itemLabel.textStyle,
              ),
              const Spacer(),
              Text(
                widget.credor.valorConsolidado.toString(),
                style: EmprestimosTypography.itemLabel.textStyle,
                textAlign: TextAlign.right,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
