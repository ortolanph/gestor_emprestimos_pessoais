import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gestor_emprestimos_pessoais/entities/credor.dart';
import 'package:gestor_emprestimos_pessoais/scheme/emprestimos_typography.dart';
import 'package:gestor_emprestimos_pessoais/widgets/credor_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: CredorWidget(
              credor: Credor(
                id: '1',
                name: "Credor",
                valorConsolidado: 10,
              ),
              credorIndex: 1,
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
                "0.00",
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
