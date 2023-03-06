import 'package:gestor_emprestimos_pessoais/repository/hive_service.dart';

class CredorRepository {
  HiveService _hiveService;

  CredorRepository(HiveService hiveService) : _hiveService = hiveService;

  Future<void> deleteAll() async {
    _hiveService.credorBox.deleteAll(_hiveService.credorBox.keys);
  }
}
