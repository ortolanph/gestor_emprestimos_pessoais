import 'package:flutter/material.dart';

import '../main.dart';
import '../service/context_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ContextService _contextService = autoInjector.get<ContextService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Gestor de Empréstimos Pessoais de ${_contextService.registro!.nome}"),
      ),
    );
  }
}
