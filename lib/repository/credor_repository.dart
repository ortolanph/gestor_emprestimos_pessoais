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

  Future<void> update(int index, Credor credor) {
    return box.putAt(index, credor);
  }
}
