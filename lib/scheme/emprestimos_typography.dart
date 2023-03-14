import 'package:flutter/material.dart';

enum EmprestimosTypography {
  mainTitle,
  itemLabel,
  itemNotes,
  editLabel,
  editField,
  hideLabel,
  totalLabel,
}

extension EmprestimosTypographyExtension on EmprestimosTypography {
  TextStyle? get textStyle {
    switch (this) {
      case EmprestimosTypography.mainTitle:
        return const TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.bold,
        );
      case EmprestimosTypography.itemLabel:
        return const TextStyle(
          fontSize: 24,
        );
      case EmprestimosTypography.itemNotes:
        return const TextStyle(
          fontSize: 16,
        );
      case EmprestimosTypography.editLabel:
        return const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        );
      case EmprestimosTypography.editField:
        return const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(0xff, 0x00, 0x66, 0xCC),
        );
      case EmprestimosTypography.hideLabel:
        return const TextStyle(
          fontSize: 18,
        );
      case EmprestimosTypography.totalLabel:
        return const TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
    }
  }
}
