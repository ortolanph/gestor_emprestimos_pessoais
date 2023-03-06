import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../entities/credor.dart';
import '../scheme/emprestimos_typography.dart';

class CredorWidget extends StatefulWidget {
  const CredorWidget(
      {Key? key, required this.credor, required this.credorIndex})
      : super(key: key);

  final Credor credor;
  final int credorIndex;

  @override
  State<CredorWidget> createState() => _CredorWidgetState();
}

class _CredorWidgetState extends State<CredorWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
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
              widget.credor.name,
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
    );
  }
}
