import 'package:flutter/material.dart';

class SaldoDevedorCredor with ChangeNotifier {
  Map<String, double> _saldos = {};

  void adicionaValorParaCredor(String credorId, double valor) {
    double valorAnterior = _saldos[credorId] ?? 0;
    _saldos[credorId] = valor + valorAnterior;
    notifyListeners();
  }

  void subtrairValorParaCredor(String credorId, double valor) {
    double valorAnterior = _saldos[credorId] ?? 0;
    _saldos[credorId] = valor - valorAnterior;
    notifyListeners();
  }

  void zerar() {
    _saldos.clear();
    notifyListeners();
  }

  Map<String, double> get saldos => _saldos;

  void setSaldos(Map<String, double> saldos) {
    _saldos = saldos;
  }
}
