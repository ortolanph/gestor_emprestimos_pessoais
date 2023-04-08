import 'package:flutter/material.dart';

import '../entities/detalhe_credor.dart';
import '../scheme/emprestimos_typography.dart';

class DetalheCredorWidget extends StatefulWidget {
  const DetalheCredorWidget({
    Key? key,
    required this.detalheCredor,
    required this.index,
  }) : super(key: key);

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
  void initState() {
    super.initState();
    detalheCredorDetalheController.text = widget.detalheCredor.detalhe;
    detalheCredorValorController.text = widget.detalheCredor.valor;

    if (widget.index >= 0) {
      setState(() {
        editMode = false;
      });
    } else {
      setState(() {
        editMode = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onDoubleTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          child: (!editMode)
              ? _DetalheCredorWidgetViewMode(
                  detalheCredor: widget.detalheCredor,
                  editFunction: () {
                    setState(() {
                      editMode = true;
                    });
                  },
                  deleteFunction: () {},
                )
              : _DetalheCredorEditMode(
                  detalheCredorDetalheController:
                      detalheCredorDetalheController,
                  detalheCredorValorController: detalheCredorValorController,
                  saveFunction: () {
                    widget.detalheCredor.detalhe =
                        detalheCredorDetalheController.text;
                    widget.detalheCredor.valor =
                        detalheCredorValorController.text;

                    setState(() {
                      editMode = false;
                    });
                  },
                ),
        ),
      ),
    );
  }
}

class _DetalheCredorWidgetViewMode extends StatefulWidget {
  const _DetalheCredorWidgetViewMode({
    Key? key,
    required this.detalheCredor,
    required this.editFunction,
    required this.deleteFunction,
  }) : super(key: key);

  final DetalheCredor detalheCredor;
  final Function() editFunction;
  final Function() deleteFunction;

  @override
  State<_DetalheCredorWidgetViewMode> createState() =>
      _DetalheCredorWidgetViewModeState();
}

class _DetalheCredorWidgetViewModeState
    extends State<_DetalheCredorWidgetViewMode> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
            IconButton(
              onPressed: widget.editFunction,
              icon: const Icon(Icons.edit),
            ),
            IconButton(
              onPressed: widget.deleteFunction,
              icon: const Icon(Icons.delete),
            ),
          ],
        ),
      ],
    );
  }
}

class _DetalheCredorEditMode extends StatefulWidget {
  const _DetalheCredorEditMode({
    Key? key,
    required this.detalheCredorDetalheController,
    required this.detalheCredorValorController,
    required this.saveFunction,
  }) : super(key: key);

  final TextEditingController detalheCredorDetalheController;
  final TextEditingController detalheCredorValorController;
  final Function() saveFunction;

  @override
  State<_DetalheCredorEditMode> createState() => _DetalheCredorEditModeState();
}

class _DetalheCredorEditModeState extends State<_DetalheCredorEditMode> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextFormField(
          style: EmprestimosTypography.editLabel.textStyle!,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Preenchimento obrigatório';
            }
            return null;
          },
          controller: widget.detalheCredorDetalheController,
        ),
        TextFormField(
          style: EmprestimosTypography.editField.textStyle!,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Preenchimento obrigatório';
            }
            return null;
          },
          controller: widget.detalheCredorValorController,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
                onPressed: widget.saveFunction, icon: const Icon(Icons.save)),
          ],
        ),
      ],
    );
  }
}
