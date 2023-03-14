import '../entities/credor.dart';
import '../entities/movimentacao.dart';

class ContextService {
  Credor? _credor;
  Movimentacao? _movimentacao;

  // pushers
  void pushCredor(Credor credor) {
    _credor = credor;
  }

  void pushMovimentacao(Movimentacao movimentacao) {
    _movimentacao = movimentacao;
  }

  // poppers
  void popRegistro() {
    _credor = null;
  }

  void popMovimentacao() {
    _movimentacao = null;
  }

  // getters
  Credor? get credor => _credor;

  Movimentacao? get movimentacao => _movimentacao;
}
