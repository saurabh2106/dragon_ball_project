// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dragonball_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DragonBallCharacterModelAdapter
    extends TypeAdapter<DragonBallCharacterModel> {
  @override
  final int typeId = 1;

  @override
  DragonBallCharacterModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DragonBallCharacterModel(
      id: fields[0] as int?,
      name: fields[1] as String?,
      ki: fields[2] as String?,
      maxKi: fields[3] as String?,
      race: fields[4] as String?,
      gender: fields[5] as String?,
      description: fields[6] as String?,
      image: fields[7] as String?,
      affiliation: fields[8] as String?,
      originPlanet: fields[9] as Planet?,
      transformations: (fields[10] as List?)?.cast<Transformation>(),
    );
  }

  @override
  void write(BinaryWriter writer, DragonBallCharacterModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.ki)
      ..writeByte(3)
      ..write(obj.maxKi)
      ..writeByte(4)
      ..write(obj.race)
      ..writeByte(5)
      ..write(obj.gender)
      ..writeByte(6)
      ..write(obj.description)
      ..writeByte(7)
      ..write(obj.image)
      ..writeByte(8)
      ..write(obj.affiliation)
      ..writeByte(9)
      ..write(obj.originPlanet)
      ..writeByte(10)
      ..write(obj.transformations);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DragonBallCharacterModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PlanetAdapter extends TypeAdapter<Planet> {
  @override
  final int typeId = 2;

  @override
  Planet read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Planet(
      id: fields[0] as int?,
      name: fields[1] as String?,
      isDestroyed: fields[2] as bool?,
      description: fields[3] as String?,
      image: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Planet obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.isDestroyed)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlanetAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TransformationAdapter extends TypeAdapter<Transformation> {
  @override
  final int typeId = 3;

  @override
  Transformation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Transformation(
      name: fields[0] as String?,
      powerLevel: fields[1] as String?,
      image: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Transformation obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.powerLevel)
      ..writeByte(2)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransformationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DragonBallCharacterModel _$DragonBallCharacterModelFromJson(
        Map<String, dynamic> json) =>
    DragonBallCharacterModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      ki: json['ki'] as String?,
      maxKi: json['maxKi'] as String?,
      race: json['race'] as String?,
      gender: json['gender'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String?,
      affiliation: json['affiliation'] as String?,
      originPlanet: json['originPlanet'] == null
          ? null
          : Planet.fromJson(json['originPlanet'] as Map<String, dynamic>),
      transformations: (json['transformations'] as List<dynamic>?)
          ?.map((e) => Transformation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DragonBallCharacterModelToJson(
        DragonBallCharacterModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'ki': instance.ki,
      'maxKi': instance.maxKi,
      'race': instance.race,
      'gender': instance.gender,
      'description': instance.description,
      'image': instance.image,
      'affiliation': instance.affiliation,
      'originPlanet': instance.originPlanet,
      'transformations': instance.transformations,
    };

Planet _$PlanetFromJson(Map<String, dynamic> json) => Planet(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      isDestroyed: json['isDestroyed'] as bool?,
      description: json['description'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$PlanetToJson(Planet instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'isDestroyed': instance.isDestroyed,
      'description': instance.description,
      'image': instance.image,
    };

Transformation _$TransformationFromJson(Map<String, dynamic> json) =>
    Transformation(
      name: json['name'] as String?,
      powerLevel: json['powerLevel'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$TransformationToJson(Transformation instance) =>
    <String, dynamic>{
      'name': instance.name,
      'powerLevel': instance.powerLevel,
      'image': instance.image,
    };
