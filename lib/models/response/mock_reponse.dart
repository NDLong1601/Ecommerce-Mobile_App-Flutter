import 'package:json_annotation/json_annotation.dart';
part 'mock_reponse.g.dart';

@JsonSerializable()
class MockResponseModel {
  final int statusCode;
  final String message;
  final Map<String, dynamic> data;

  MockResponseModel({
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory MockResponseModel.fromJson(Map<String, dynamic> json) =>
      _$MockResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$MockResponseModelToJson(this);
}
