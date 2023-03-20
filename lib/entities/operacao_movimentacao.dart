import 'package:flutter/cupertino.dart';

enum OperacaoMovimentacao {
  emprestimo, pagamento
}

extension OperacaoMovimentacaoExtension on OperacaoMovimentacao {

  Icon? get icon {
    return null;
  }

}