import 'package:auto_injector/auto_injector.dart';
import 'package:flutter/material.dart';
import 'package:gestor_emprestimos_pessoais/controller/credor_editor_controller.dart';
import 'package:gestor_emprestimos_pessoais/pages/config_page.dart';
import 'package:gestor_emprestimos_pessoais/pages/credor_editor.dart';
import 'package:gestor_emprestimos_pessoais/pages/home_page.dart';
import 'package:gestor_emprestimos_pessoais/pages/loading_page.dart';
import 'package:gestor_emprestimos_pessoais/providers/saldo_devedor_total.dart';
import 'package:gestor_emprestimos_pessoais/repository/credor_repository.dart';
import 'package:gestor_emprestimos_pessoais/repository/hive_service.dart';
import 'package:gestor_emprestimos_pessoais/repository/movimentacao_repository.dart';
import 'package:gestor_emprestimos_pessoais/service/context_service.dart';
import 'package:provider/provider.dart';

final autoInjector = AutoInjector();

void main() async {
  autoInjector.addSingleton(HiveService.new);
  autoInjector.addLazySingleton(CredorRepository.new);
  autoInjector.addLazySingleton(MovimentacaoRepository.new);

  autoInjector.addSingleton(ContextService.new);

  autoInjector.addSingleton(CredorEditorController.new);

  autoInjector.commit();

  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => SaldoDevedorTotal()),
        ],
        child: MaterialApp(
          title: "Gestor de Empréstimos Pessoais",
          initialRoute: "/loading",
          routes: {
            "/loading": (context) => const LoadingPage(),
            "/main": (context) => const HomePage(),
            "/config": (context) => const ConfigPage(),
            "/editCredor": (context) => const CredorEditor(),
          },
        )),
  );
}
