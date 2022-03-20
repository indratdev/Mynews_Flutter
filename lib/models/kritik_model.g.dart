// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kritik_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KritikModel _$KritikModelFromJson(Map<String, dynamic> json) => KritikModel(
      email: json['email'] as String?,
      kritik: json['kritik'] as String?,
      createdAt: json['createdAt'] as String?,
      id: json['id'] as String?,
      job: json['job'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$KritikModelToJson(KritikModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'kritik': instance.kritik,
      'name': instance.name,
      'job': instance.job,
      'id': instance.id,
      'createdAt': instance.createdAt,
    };
