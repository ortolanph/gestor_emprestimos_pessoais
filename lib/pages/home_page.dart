import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gestor_emprestimos_pessoais/controller/credor_editor_controller.dart';
import 'package:gestor_emprestimos_pessoais/entities/credor.dart';
import 'package:gestor_emprestimos_pessoais/main.dart';
import 'package:gestor_emprestimos_pessoais/providers/saldo_devedor_total.dart';
import 'package:gestor_emprestimos_pessoais/repository/credor_repository.dart';
import 'package:gestor_emprestimos_pessoais/scheme/emprestimos_typography.dart';
import 'package:gestor_emprestimos_pessoais/widgets/credor_widget.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import '../service/context_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CredorRepository _credorRepository =
      autoInjector.get<CredorRepository>();
  final CredorEditorController _credorEditorController =
      autoInjector.get<CredorEditorController>();
  final ContextService _contextService = autoInjector.get<ContextService>();
  double saldoDevedorTotal = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Empréstimos Pessoais"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/config',
                );
              },
              icon: const FaIcon(FontAwesomeIcons.gear)),
          IconButton(
              onPressed: () {
                _credorEditorController.editMode = false;
                Navigator.pushNamed(
                  context,
                  "/editCredor",
                );
              },
              icon: const Icon(Icons.add)),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ValueListenableBuilder<Box<Credor>>(
              valueListenable: _credorRepository.box.listenable(),
              builder: (BuildContext context, Box<Credor> box, _) =>
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: box.length,
                      itemBuilder: (context, index) {
                        var value = _credorRepository.box.getAt(index);
                        return CredorWidget(credor: value!, credorIndex: index);
                      }),
            ),
          ),
        ],
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
                context.watch<SaldoDevedorTotal>().saldoDevedor.toString(),
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
