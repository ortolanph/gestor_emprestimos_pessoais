import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'detalhe_credor.g.dart';

@HiveType(typeId: 2)
@JsonSerializable()
class DetalheCredor with EquatableMixin {
  @HiveField(0)
  String id;
  @HiveField(1)
  String credorId;
  @HiveField(2)
  String detalhe;
  @HiveField(3)
  String valor;

  DetalheCredor({required this.id, required this.credorId, required this.detalhe, required this.valor});

  factory DetalheCredor.fromJson(Map<String, dynamic> json) => _$DetalheCredorFromJson(json);

  Map<String, dynamic> toJson() => _$DetalheCredorToJson(this);

  @override
  List<Object?> get props => [];

  @override
  bool get stringify => true;
}