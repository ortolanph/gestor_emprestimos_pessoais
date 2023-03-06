import 'package:hive_flutter/hive_flutter.dart';

import '../entities/credor.dart';

class HiveService {
  Box<Credor>? _credorBox;

  Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(CredorAdapter());
    _credorBox = await Hive.openBox<Credor>("credores");
  }

  // Boxes
  Box<Credor> get credorBox {
    if (_credorBox == null) {
      throw Exception("Hive box Credores não inicializada.");
    }
    return _credorBox!;
  }
}
