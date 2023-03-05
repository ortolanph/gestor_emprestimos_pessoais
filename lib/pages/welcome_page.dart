import 'package:flutter/material.dart';
import 'package:gestor_emprestimos_pessoais/entities/registro.dart';
import 'package:gestor_emprestimos_pessoais/main.dart';
import 'package:gestor_emprestimos_pessoais/scheme/emprestimos_typography.dart';
import 'package:gestor_emprestimos_pessoais/service/context_service.dart';

import '../repository/registro_repository.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final RegistroRepository _registroRepository =
  autoInjector.get<RegistroRepository>();
  final ContextService _contextService = autoInjector.get<ContextService>();

  final TextEditingController registroNomeController =
      TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registo"),
        actions: [
          IconButton(onPressed: (){
            String nome = registroNomeController.text;

            if(nome.isNotEmpty) {
              Registro registro = Registro(nome: nome);
              _registroRepository.save(registro);
              _contextService.pushRegistro(registro);
              Navigator.pushReplacementNamed(context, "/main");
            }
          }, icon: const Icon(Icons.save)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Form(
          autovalidateMode: AutovalidateMode.always,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "* Nome",
                style: EmprestimosTypography.editLabel.textStyle!,
              ),
              TextFormField(
                style: EmprestimosTypography.editField.textStyle!,
                maxLength: 20,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
                controller: registroNomeController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
