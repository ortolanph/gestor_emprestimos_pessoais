import '../entities/credor.dart';

class ContextService {
  Credor? _credor;

  // pushers
  void pushCredor(Credor credor) {
    _credor = credor;
  }

  // poppers
  void popRegistro() {
    _credor = null;
  }

  // getters
  Credor? get credor => _credor;
}
