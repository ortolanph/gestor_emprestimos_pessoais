import 'package:gestor_emprestimos_pessoais/entities/registro.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  Box<Registro>? _registroBox;

  Map<String, Box> boxes = {};

  Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(RegistroAdapter());
    _registroBox = await Hive.openBox<Registro>("registro");
  }

  // Boxes
  Box<Registro> get registroBox {
    if (_registroBox == null) {
      throw Exception("Hive box registro não inicializada.");
    }
    return _registroBox!;
  }

}