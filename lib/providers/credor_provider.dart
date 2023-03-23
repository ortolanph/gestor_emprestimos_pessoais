import 'package:flutter/foundation.dart';

import '../entities/credor.dart';
import '../entities/movimentacao.dart';

class CredorProvider with ChangeNotifier {
  int? _index;
  Credor? _credor;
  List<Movimentacao> _movimentacoes = [];

  void novoCredor(int credorIndex, Credor credorSelecionado,
      List<Movimentacao> movimentacoesCredor) {
    _index = credorIndex;
    _credor = credorSelecionado;
    _movimentacoes = movimentacoesCredor;
    notifyListeners();
  }

  void adicionaMovimentacao(Movimentacao novaMovimentacao) {
    _movimentacoes.add(novaMovimentacao);
    notifyListeners();
  }

  int? get index => _index;

  Credor? get credor => _credor;

  List<Movimentacao> get movimentacoes => _movimentacoes;
}
