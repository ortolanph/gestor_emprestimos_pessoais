import 'package:flutter/material.dart';
import 'package:gestor_emprestimos_pessoais/main.dart';
import 'package:gestor_emprestimos_pessoais/providers/credor_provider.dart';
import 'package:gestor_emprestimos_pessoais/repository/detalhe_credor_repository.dart';
import 'package:gestor_emprestimos_pessoais/widgets/detalhe_credor_widget.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../entities/credor.dart';
import '../entities/detalhe_credor.dart';

class DetalheCredorViewer extends StatefulWidget {
  const DetalheCredorViewer({Key? key}) : super(key: key);

  @override
  State<DetalheCredorViewer> createState() => _DetalheCredorViewerState();
}

class _DetalheCredorViewerState extends State<DetalheCredorViewer> {
  DetalheCredorRepositoy _detalheCredorRepositoy =
      autoInjector.get<DetalheCredorRepositoy>();
  Credor? _credor;

  @override
  void initState() {
    _credor = context.read<CredorProvider>().credor;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalhes para o credor ${_credor?.nome}"),
        actions: [
          IconButton(
            onPressed: () {
              context.read<CredorProvider>().adicionaDetalhe(DetalheCredor(
                  id: const Uuid().v4(),
                  credorId: _credor!.id,
                  detalhe: "Novo Detalhe",
                  valor: "Novo Valor"));
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: context.watch<CredorProvider>().detalhes.length,
                itemBuilder: (context, index) {
                  DetalheCredor detalhe =
                      context.read<CredorProvider>().detalhes[index];
                  int idx =
                      _detalheCredorRepositoy.getDetalheCredorIndex(detalhe);

                  return DetalheCredorWidget(
                    detalheCredor: detalhe,
                    index: idx,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
