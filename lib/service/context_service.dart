import '../entities/registro.dart';

class ContextService {
  Registro? _registro;

  // pushers
  void pushRegistro(Registro registro) {
    _registro = registro;
  }

  // poppers

  // getters
  Registro? get registro => _registro;
}
