import 'package:flutter/cupertino.dart';

class SaldoDevedorTotal with ChangeNotifier {
  double _saldoDevedor = 0;

  void adicionarValor(double valor) {
    _saldoDevedor += valor;
    notifyListeners();
  }

  void subtrairValor(double valor) {
    _saldoDevedor -= valor;
    notifyListeners();
  }

  void zerar() {
    _saldoDevedor = 0;
    notifyListeners();
  }

  double get saldoDevedor => _saldoDevedor;
}
