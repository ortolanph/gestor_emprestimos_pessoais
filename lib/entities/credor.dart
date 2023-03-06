import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'credor.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class Credor with EquatableMixin {
  @HiveField(0)
  String id;
  @HiveField(1)
  String name;
  @HiveField(2)
  double valorConsolidado;

  Credor({
    required this.id,
    required this.name,
    required this.valorConsolidado,
  });

  factory Credor.fromJson(Map<String, dynamic> json) => _$CredorFromJson(json);

  Map<String, dynamic> toJson() => _$CredorToJson(this);

  @override
  List<Object?> get props => throw UnimplementedError();

  @override
  bool get stringify => true;
}
