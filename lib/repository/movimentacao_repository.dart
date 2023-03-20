import 'package:gestor_emprestimos_pessoais/repository/hive_service.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../entities/movimentacao.dart';

class MovimentacaoRepository {
  HiveService _hiveService;

  MovimentacaoRepository(HiveService hiveService) : _hiveService = hiveService;

  Box<Movimentacao> get box => _hiveService.movimetacaoBox;

  Future<void> deleteAll() async {
    box.deleteAll(box.keys);
  }

  Future<int> add(Movimentacao movimentacao) {
    return box.add(movimentacao);
  }

  List<Movimentacao> getMovimentacoesByCredorId(String credorId) {
    return box.values
        .where((movimentacao) => movimentacao.credorId == credorId)
        .toList();
  }
}
