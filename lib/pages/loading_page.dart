import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gestor_emprestimos_pessoais/providers/saldo_devedor_total.dart';
import 'package:gestor_emprestimos_pessoais/repository/hive_service.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import '../repository/credor_repository.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  final HiveService _hiveService = autoInjector.get<HiveService>();
  final CredorRepository _credorRepository =
      autoInjector.get<CredorRepository>();

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      load();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[900],
        body: const Center(
            child: SpinKitPianoWave(
          color: Colors.white,
          itemCount: 7,
          type: SpinKitPianoWaveType.center,
        )));
  }

  void load() async {
    await _hiveService.init();

    context
        .read<SaldoDevedorTotal>()
        .adicionarValor(_credorRepository.getSaldoDevedorTotal());

    Navigator.pushReplacementNamed(context, "/main");
  }
}
