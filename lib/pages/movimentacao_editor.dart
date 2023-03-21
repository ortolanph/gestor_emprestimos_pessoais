import 'package:flutter/material.dart';
import 'package:gestor_emprestimos_pessoais/main.dart';
import 'package:gestor_emprestimos_pessoais/repository/movimentacao_repository.dart';
import 'package:gestor_emprestimos_pessoais/service/context_service.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../entities/movimentacao.dart';
import '../providers/saldo_devedor_credor.dart';
import '../providers/saldo_devedor_total.dart';
import '../scheme/emprestimos_typography.dart';

class MovimentacaoEditor extends StatefulWidget {
  const MovimentacaoEditor({Key? key}) : super(key: key);

  @override
  State<MovimentacaoEditor> createState() => _MovimentacaoEditorState();
}

class _MovimentacaoEditorState extends State<MovimentacaoEditor> {
  MovimentacaoRepository _movimentacaoRepository =
      autoInjector.get<MovimentacaoRepository>();
  ContextService _contextService = autoInjector.get<ContextService>();

  TextEditingController movimentacaoValorController =
      TextEditingController(text: "0");
  Operacao operacaoSelecionada = Operacao.emprestimo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nova Movimentação"),
        actions: [
          IconButton(
            onPressed: () {
              String operacao = operacaoSelecionada.name;
              double valorMovimentacao =
                  double.parse(movimentacaoValorController.text);

              Movimentacao movimentacao = Movimentacao(
                id: const Uuid().v4(),
                credorId: _contextService.credor!.id,
                operacao: operacao,
                dataOperacao: dateFormat.format(DateTime.now()),
                valor: valorMovimentacao,
              );
              _movimentacaoRepository.add(movimentacao);

              if (operacaoSelecionada == Operacao.emprestimo) {
                context
                    .read<SaldoDevedorTotal>()
                    .adicionarValor(valorMovimentacao);
                context.read<SaldoDevedorCredor>().adicionaValorParaCredor(
                    _contextService.credor!.id, valorMovimentacao);
              } else {
                context
                    .read<SaldoDevedorTotal>()
                    .subtrairValor(valorMovimentacao);
                context.read<SaldoDevedorCredor>().subtrairValorParaCredor(
                    _contextService.credor!.id, valorMovimentacao);
              }

              Navigator.pop(context);
            },
            icon: const Icon(Icons.save),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 20.0,
        ),
        child: Form(
          autovalidateMode: AutovalidateMode.always,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ListTile(
                    title: Tooltip(
                      message: Operacao.emprestimo.descricao,
                      child: Icon(Operacao.emprestimo.icone),
                    ),
                    leading: Radio<Operacao>(
                      value: Operacao.emprestimo,
                      groupValue: operacaoSelecionada,
                      onChanged: (operacao) {
                        setState(() {
                          operacaoSelecionada = operacao!;
                        });
                      },

                    ),
                  ),
                  ListTile(
                    title: Tooltip(
                      message: Operacao.pagamento.descricao,
                      child: Icon(Operacao.pagamento.icone),
                    ),
                    leading: Radio<Operacao>(
                      value: Operacao.pagamento,
                      groupValue: operacaoSelecionada,
                      onChanged: (operacao) {
                        setState(() {
                          operacaoSelecionada = operacao!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  "* Valor",
                  style: EmprestimosTypography.editLabel.textStyle!,
                ),
              ),
              TextFormField(
                style: EmprestimosTypography.editField.textStyle!,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Preenchimento obrigatório';
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
                controller: movimentacaoValorController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
