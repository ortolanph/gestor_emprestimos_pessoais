import 'package:flutter/material.dart';

import '../main.dart';
import '../repository/credor_repository.dart';
import '../scheme/emprestimos_typography.dart';
import '../service/context_service.dart';

class ConfigPage extends StatefulWidget {
  const ConfigPage({Key? key}) : super(key: key);

  @override
  State<ConfigPage> createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  final CredorRepository _credorRepository =
      autoInjector.get<CredorRepository>();
  final ContextService _contextService = autoInjector.get<ContextService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Configurações"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Apagar dados",
              style: EmprestimosTypography.editLabel.textStyle!,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Text(
                "Apaga todos os dados realizados nessa aplicação. Automaticamente a aplicação voltará para a tela de registo.",
                style: EmprestimosTypography.itemNotes.textStyle!,
                maxLines: 4,
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                String? result = await showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Apagar Dados'),
                    content: const Text(
                        'Desejas mesmo apagar todos os dados da aplicação?'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'C'),
                        child: const Text('Cancelar'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'S'),
                        child: const Text('Sim'),
                      ),
                    ],
                  ),
                );

                if (result == "S") {
                  _contextService.popRegistro();
                  _credorRepository.deleteAll();
                }
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  "Apagar",
                  style: EmprestimosTypography.itemLabel.textStyle!,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
