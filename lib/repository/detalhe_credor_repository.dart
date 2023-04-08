import 'package:gestor_emprestimos_pessoais/entities/detalhe_credor.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'hive_service.dart';

class DetalheCredorRepositoy {
  HiveService _hiveService;

  DetalheCredorRepositoy(HiveService hiveService) : _hiveService = hiveService;

  Box<DetalheCredor> get box => _hiveService.detalheCredoroBox;

  List<DetalheCredor> getDetalhesByCredorId(String credorId) {
    return box.values
        .where((detalhe) => detalhe.credorId == credorId)
        .toList();
  }

  int getDetalheCredorIndex(DetalheCredor detalheCredor) {
    if(box.isEmpty) return -1;
    if(box.values.contains(detalheCredor)) {
      return box.values
          .toList()
          .indexOf(detalheCredor);
    } else {
      return -1;
    }
  }
}