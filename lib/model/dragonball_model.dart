import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dragonball_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 1)
class DragonBallCharacterModel {
  @HiveField(0)
  final int? id;

  @HiveField(1)
  final String? name;

  @HiveField(2)
  final String? ki;

  @HiveField(3)
  final String? maxKi;

  @HiveField(4)
  final String? race;

  @HiveField(5)
  final String? gender;

  @HiveField(6)
  final String? description;

  @HiveField(7)
  final String? image;

  @HiveField(8)
  final String? affiliation;

  @HiveField(9)
  final Planet? originPlanet;

  @HiveField(10)
  final List<Transformation>? transformations;

  DragonBallCharacterModel({
    this.id,
    this.name,
    this.ki,
    this.maxKi,
    this.race,
    this.gender,
    this.description,
    this.image,
    this.affiliation,
    this.originPlanet,
    this.transformations,
  });

  factory DragonBallCharacterModel.fromJson(Map<String, dynamic> json) =>
      _$DragonBallCharacterModelFromJson(json);

  Map<String, dynamic> toJson() => _$DragonBallCharacterModelToJson(this);
}

@JsonSerializable()
@HiveType(typeId: 2)
class Planet {
  @HiveField(0)
  final int? id;

  @HiveField(1)
  final String? name;

  @HiveField(2)
  final bool? isDestroyed;

  @HiveField(3)
  final String? description;

  @HiveField(4)
  final String? image;

  Planet({this.id, this.name, this.isDestroyed, this.description, this.image});

  factory Planet.fromJson(Map<String, dynamic> json) => _$PlanetFromJson(json);

  Map<String, dynamic> toJson() => _$PlanetToJson(this);
}

@JsonSerializable()
@HiveType(typeId: 3)
class Transformation {
  @HiveField(0)
  final String? name;

  @HiveField(1)
  final String? powerLevel;

  @HiveField(2)
  final String? image;

  Transformation({this.name, this.powerLevel, this.image});

  factory Transformation.fromJson(Map<String, dynamic> json) =>
      _$TransformationFromJson(json);

  Map<String, dynamic> toJson() => _$TransformationToJson(this);
}
