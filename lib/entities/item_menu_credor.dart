import 'package:flutter/material.dart';

enum ItemMenuCredor { editar, apagar, detalhar, nova_movimentacao }

extension ItemMenuCredorExtension on ItemMenuCredor {
  String? get label {
    switch (this) {
      case ItemMenuCredor.editar:
        return "Editar";
      case ItemMenuCredor.apagar:
        return "Apagar";
      case ItemMenuCredor.detalhar:
        return "Detalhar";
      case ItemMenuCredor.nova_movimentacao:
        return "Nova Movimentacao";
    }
  }

  Icon? get icon {
    switch (this) {
      case ItemMenuCredor.editar:
        return const Icon(
          Icons.edit,
          color: Colors.black,
        );
      case ItemMenuCredor.apagar:
        return const Icon(
          Icons.delete,
          color: Colors.black,
        );
      case ItemMenuCredor.detalhar:
        return const Icon(
          Icons.details,
          color: Colors.black,
        );
      case ItemMenuCredor.nova_movimentacao:
        return const Icon(
          Icons.move_to_inbox,
          color: Colors.black,
        );
    }
  }
}
