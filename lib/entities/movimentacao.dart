import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movimentacao.g.dart';

enum Operacao { emprestimo, pagamento }

extension OperacaoExtesion on Operacao {
  IconData? get icone {
    switch (this) {
      case Operacao.emprestimo:
        return FontAwesomeIcons.rightToBracket;
      case Operacao.pagamento:
        return FontAwesomeIcons.rightFromBracket;
    }
  }

  String? get descricao {
    switch(this) {
      case Operacao.emprestimo:
        return "Emprestimo";
      case Operacao.pagamento:
        return "Pagamento";
    }
  }
}

@HiveType(typeId: 1)
@JsonSerializable()
class Movimentacao with EquatableMixin {
  @HiveField(0)
  String id;
  @HiveField(1)
  String credorId;
  @HiveField(2)
  String operacao;
  @HiveField(3)
  String dataOperacao;
  @HiveField(4)
  double valor;

  Movimentacao({
    required this.id,
    required this.credorId,
    required this.operacao,
    required this.dataOperacao,
    required this.valor,
  });

  factory Movimentacao.fromJson(Map<String, dynamic> json) =>
      _$MovimentacaoFromJson(json);

  Map<String, dynamic> toJson() => _$MovimentacaoToJson(this);

  @override
  List<Object?> get props => [id, credorId, operacao, dataOperacao, valor];

  @override
  bool get stringify => true;
}
