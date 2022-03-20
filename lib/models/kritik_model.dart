import 'package:json_annotation/json_annotation.dart';

part 'kritik_model.g.dart';

@JsonSerializable()
class KritikModel {
  String? email, kritik;
  String? name, job, id, createdAt;

  KritikModel({
    this.email,
    this.kritik,
    this.createdAt,
    this.id,
    this.job,
    this.name,
  });

  factory KritikModel.fromJson(Map<String, dynamic> json) =>
      _$KritikModelFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$KritikModelToJson(this);
}


// "name": "morpheus",
//     "job": "leader",
//     "id": "747",
//     "createdAt": "2022-02-12T08:46:10.958Z"