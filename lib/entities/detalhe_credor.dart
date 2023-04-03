import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'detalhe_credor.g.dart';

@HiveType(typeId: 2)
@JsonSerializable()
class DetalheCredor with EquatableMixin {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String credorId;
  @HiveField(2)
  final String detalhe;
  @HiveField(3)
  final String valor;

  DetalheCredor({required this.id, required this.credorId, required this.detalhe, required this.valor});

  factory DetalheCredor.fromJson(Map<String, dynamic> json) => _$DetalheCredorFromJson(json);

  Map<String, dynamic> toJson() => _$DetalheCredorToJson(this);

  @override
  List<Object?> get props => [];

  @override
  bool get stringify => true;
}