import 'package:flutter/foundation.dart';

import '../entities/credor.dart';
import '../entities/detalhe_credor.dart';
import '../entities/movimentacao.dart';

class CredorProvider with ChangeNotifier {
  int? _index;
  Credor? _credor;
  List<Movimentacao> _movimentacoes = [];
  List<DetalheCredor> _detalhes = [];

  void novoCredor(int credorIndex, Credor credorSelecionado,
      List<Movimentacao> movimentacoesCredor, List<DetalheCredor> detalhes) {
    _index = credorIndex;
    _credor = credorSelecionado;
    _movimentacoes = movimentacoesCredor;
    _detalhes = detalhes;
    notifyListeners();
  }

  void limparDadosCredor() {
    _index = 0;
    _credor = null;
    _movimentacoes = [];
    _detalhes = [];
    notifyListeners();
  }

  void adicionaMovimentacao(Movimentacao novaMovimentacao) {
    _movimentacoes.add(novaMovimentacao);
    notifyListeners();
  }

  void adicionaDetalhe(DetalheCredor detalheCredor) {
    _detalhes.add(detalheCredor);
    notifyListeners();
  }

  void removeDetalhe(DetalheCredor detalheCredor) {
    _detalhes.remove(detalheCredor);
    notifyListeners();
  }

  int? get index => _index;

  Credor? get credor => _credor;

  List<Movimentacao> get movimentacoes => _movimentacoes;

  List<DetalheCredor> get detalhes => _detalhes;
}
