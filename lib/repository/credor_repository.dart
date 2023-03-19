import 'package:gestor_emprestimos_pessoais/entities/credor.dart';
import 'package:gestor_emprestimos_pessoais/repository/hive_service.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CredorRepository {
  HiveService _hiveService;

  CredorRepository(HiveService hiveService) : _hiveService = hiveService;

  Box<Credor> get box => _hiveService.credorBox;

  Future<void> deleteAll() async {
    box.deleteAll(box.keys);
  }

  Future<int> add(Credor credor) {
    return box.add(credor);
  }

  double getSaldoDevedorTotal() {
    if (box.values.isEmpty) return 0.0;
    return box.values
        .map((element) => element.valorConsolidado)
        .reduce((value, element) => value + element);
  }

  Map<String, double> getCredorSaldoMap() {
    if (box.values.isEmpty) return {};
    Map<String, double> saldos = {};

    List<String> keys = box.values.map((e) => e.id).toList();
    for (String key in keys) {
      saldos[key] = box.values
          .where((element) => element.id == key)
          .first
          .valorConsolidado;
    }

    return saldos;
  }

  Future<void> update(int index, Credor credor) {
    return box.putAt(index, credor);
  }
}
