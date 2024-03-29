import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gestor_emprestimos_pessoais/entities/credor.dart';
import 'package:gestor_emprestimos_pessoais/entities/movimentacao.dart';
import 'package:gestor_emprestimos_pessoais/main.dart';
import 'package:gestor_emprestimos_pessoais/providers/saldo_devedor_total.dart';
import 'package:gestor_emprestimos_pessoais/repository/credor_repository.dart';
import 'package:gestor_emprestimos_pessoais/repository/movimentacao_repository.dart';
import 'package:gestor_emprestimos_pessoais/scheme/emprestimos_typography.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class CredorEditor extends StatefulWidget {
  const CredorEditor({Key? key}) : super(key: key);

  @override
  State<CredorEditor> createState() => _CredorEditorState();
}

class _CredorEditorState extends State<CredorEditor> {
  final CredorRepository _credorRepository =
      autoInjector.get<CredorRepository>();
  final MovimentacaoRepository _movimentacaoRepository =
      autoInjector.get<MovimentacaoRepository>();

  TextEditingController credorNomeController = TextEditingController(text: "");
  TextEditingController credorDebitoController =
      TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: FaIcon(FontAwesomeIcons.moneyBill1),
            ),
            Text(
              "Novo Credor"
            )
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              String nome = credorNomeController.text;
              double debito = double.parse(credorDebitoController.text);

              Credor credor = Credor(
                id: const Uuid().v4(),
                nome: nome,
                valorConsolidado: debito,
              );

              _credorRepository.add(credor);
              Movimentacao movimentacao = Movimentacao(
                id: const Uuid().v4(),
                credorId: credor.id,
                operacao: Operacao.emprestimo.name,
                dataOperacao: dateFormat.format(DateTime.now()),
                valor: credor.valorConsolidado,
              );
              _movimentacaoRepository.add(movimentacao);

              context
                  .read<SaldoDevedorTotal>()
                  .adicionarValor(credor.valorConsolidado);

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
              Text(
                "* Nome do Credor",
                style: EmprestimosTypography.editLabel.textStyle!,
              ),
              TextFormField(
                style: EmprestimosTypography.editField.textStyle!,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Preenchimento obrigatório';
                  }
                  return null;
                },
                controller: credorNomeController,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  "* Valor do Empréstimo",
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
                controller: credorDebitoController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
