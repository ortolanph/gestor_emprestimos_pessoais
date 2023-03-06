import 'package:flutter/material.dart';
import 'package:gestor_emprestimos_pessoais/main.dart';
import 'package:gestor_emprestimos_pessoais/service/context_service.dart';

class CredorEditor extends StatefulWidget {
  const CredorEditor({Key? key}) : super(key: key);

  @override
  State<CredorEditor> createState() => _CredorEditorState();
}

class _CredorEditorState extends State<CredorEditor> {
  final ContextService _context = autoInjector.get<ContextService>();

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
