import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gestor_emprestimos_pessoais/repository/hive_service.dart';

import '../main.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  final HiveService _hiveService = autoInjector.get<HiveService>();

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
    Navigator.pushReplacementNamed(context, "/main");
  }
}
