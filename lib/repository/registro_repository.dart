import 'package:gestor_emprestimos_pessoais/repository/hive_service.dart';

import '../entities/registro.dart';

class RegistroRepository {

  HiveService _hiveService;

  RegistroRepository(HiveService hiveService) : _hiveService = hiveService;

  List<Registro> get all => _hiveService.registroBox.values.toList();

  Future<int> save(Registro registro) async {
    return await _hiveService.registroBox.add(registro);
  }

}