import 'package:auto_injector/auto_injector.dart';
import 'package:flutter/material.dart';
import 'package:gestor_emprestimos_pessoais/pages/config_page.dart';
import 'package:gestor_emprestimos_pessoais/pages/home_page.dart';
import 'package:gestor_emprestimos_pessoais/pages/loading_page.dart';
import 'package:gestor_emprestimos_pessoais/repository/hive_service.dart';
import 'package:gestor_emprestimos_pessoais/repository/registro_repository.dart';
import 'package:gestor_emprestimos_pessoais/service/context_service.dart';

final autoInjector = AutoInjector();

void main() async {
  autoInjector.addSingleton(HiveService.new);
  autoInjector.addLazySingleton(RegistroRepository.new);
  autoInjector.addSingleton(ContextService.new);
  autoInjector.commit();

  runApp(
    MaterialApp(
      title: "Gestor de Empréstimos Pessoais",
      initialRoute: "/loading",
      routes: {
        "/loading": (context) => const LoadingPage(),
        "/main": (context) => const HomePage(),
        "/config": (context) => const ConfigPage(),
      },
    ),
  );
}
