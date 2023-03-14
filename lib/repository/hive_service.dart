import 'package:hive_flutter/hive_flutter.dart';

import '../entities/credor.dart';
import '../entities/movimentacao.dart';

class HiveService {
  Box<Credor>? _credorBox;
  Box<Movimentacao>? _movimentacaoBox;

  Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(CredorAdapter());
    Hive.registerAdapter(MovimentacaoAdapter());
    _credorBox = await Hive.openBox<Credor>("credores");
    _movimentacaoBox = await Hive.openBox<Movimentacao>("movimentacoes");
  }

  // Boxes
  Box<Credor> get credorBox {
    if (_credorBox == null) {
      throw Exception("Hive box Credores não inicializada.");
    }
    return _credorBox!;
  }

  Box<Movimentacao> get movimetacaoBox {
    if (_movimentacaoBox == null) {
      throw Exception("Hive box Movimentações não inicializada.");
    }
    return _movimentacaoBox!;
  }
}
