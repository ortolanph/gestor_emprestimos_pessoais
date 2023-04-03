// First version with everything then I will separate the editor from the viewer

import 'package:flutter/material.dart';

import '../entities/detalhe_credor.dart';
import '../scheme/emprestimos_typography.dart';

class DetalheCredorWidget extends StatefulWidget {
  const DetalheCredorWidget(
      {Key? key, required this.detalheCredor, required this.index})
      : super(key: key);

  final DetalheCredor detalheCredor;
  final int index;

  @override
  State<DetalheCredorWidget> createState() => _DetalheCredorWidgetState();
}

class _DetalheCredorWidgetState extends State<DetalheCredorWidget> {
  bool editMode = false;

  TextEditingController detalheCredorDetalheController =
      TextEditingController(text: "");
  TextEditingController detalheCredorValorController =
      TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onDoubleTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                widget.detalheCredor.detalhe,
                style: EmprestimosTypography.editLabel.textStyle!,
              ),
              Text(
                widget.detalheCredor.valor,
                style: EmprestimosTypography.editField.textStyle!,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
                ],
              ),
              TextFormField(
                style: EmprestimosTypography.editLabel.textStyle!,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Preenchimento obrigatório';
                  }
                  return null;
                },
                controller: detalheCredorDetalheController,
              ),
              TextFormField(
                style: EmprestimosTypography.editField.textStyle!,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Preenchimento obrigatório';
                  }
                  return null;
                },
                controller: detalheCredorValorController,
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.save)),
            ],
          ),
        ),
      ),
    );
  }
}
