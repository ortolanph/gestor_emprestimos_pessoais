import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gestor_emprestimos_pessoais/entities/item_menu_credor.dart';
import 'package:gestor_emprestimos_pessoais/providers/credor_provider.dart';
import 'package:gestor_emprestimos_pessoais/widgets/movimentacao_widget.dart';
import 'package:provider/provider.dart';

import '../scheme/emprestimos_typography.dart';

class CredorViewer extends StatefulWidget {
  const CredorViewer({Key? key}) : super(key: key);

  @override
  State<CredorViewer> createState() => _CredorViewerState();
}

class _CredorViewerState extends State<CredorViewer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 10),
              child: FaIcon(FontAwesomeIcons.moneyBill1),
            ),
            Text(context.read<CredorProvider>().credor!.nome)
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.read<CredorProvider>().limparDadosCredor();
            Navigator.pop(context);
          },
        ),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem<ItemMenuCredor>(
                  value: ItemMenuCredor.editar,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: ItemMenuCredor.editar.icon!,
                      ),
                      Text(ItemMenuCredor.editar.label!)
                    ],
                  ),
                ),
                PopupMenuItem<ItemMenuCredor>(
                  value: ItemMenuCredor.apagar,
                  child: Row(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: ItemMenuCredor.apagar.icon!),
                      Text(ItemMenuCredor.apagar.label!)
                    ],
                  ),
                ),
                PopupMenuItem<ItemMenuCredor>(
                  value: ItemMenuCredor.detalhar,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: ItemMenuCredor.detalhar.icon!,
                      ),
                      Text(ItemMenuCredor.detalhar.label!)
                    ],
                  ),
                ),
                PopupMenuItem<ItemMenuCredor>(
                  value: ItemMenuCredor.nova_movimentacao,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: ItemMenuCredor.nova_movimentacao.icon!,
                      ),
                      Text(ItemMenuCredor.nova_movimentacao.label!)
                    ],
                  ),
                ),
              ];
            },
            onSelected: (selected) {
              switch (selected) {
                case ItemMenuCredor.editar:
                  break;
                case ItemMenuCredor.apagar:
                  break;
                case ItemMenuCredor.detalhar:
                  Navigator.pushNamed(
                    context,
                    "/viewDetalhes",
                  );
                  break;
                case ItemMenuCredor.nova_movimentacao:
                  Navigator.pushNamed(
                    context,
                    "/editMovimentacao",
                  );
                  break;
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Nome do Credor",
              style: EmprestimosTypography.editLabel.textStyle!,
            ),
            Text(
              context.read<CredorProvider>().credor!.nome,
              style: EmprestimosTypography.editField.textStyle!,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                "Movimentações",
                style: EmprestimosTypography.editLabel.textStyle!,
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount:
                      context.watch<CredorProvider>().movimentacoes.length,
                  itemBuilder: (context, index) => MovimentacaoWidget(
                      movimentacao: context
                          .watch<CredorProvider>()
                          .movimentacoes[index])),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blueAccent,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 3),
                child: Icon(Icons.summarize),
              ),
              Text(
                "TOTAL",
                style: EmprestimosTypography.totalLabel.textStyle,
              ),
              const Spacer(),
              Text(
                context
                    .watch<CredorProvider>()
                    .movimentacoes
                    .map((element) => element.valor)
                    .reduce((value, element) => value + element)
                    .toString(),
                textAlign: TextAlign.right,
                style: EmprestimosTypography.totalLabel.textStyle,
              )
            ],
          ),
        ),
      ),
    );
  }
}
