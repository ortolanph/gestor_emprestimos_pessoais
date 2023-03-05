import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'registro.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class Registro with EquatableMixin {
  @HiveField(0)
  String nome;

  Registro({required this.nome});

  factory Registro.fromJson(Map<String, dynamic> json) => _$RegistroFromJson(json);

  Map<String, dynamic> toJson() => _$RegistroToJson(this);

  @override
  List<Object?> get props => [nome];

  @override
  bool get stringify => true;
}
