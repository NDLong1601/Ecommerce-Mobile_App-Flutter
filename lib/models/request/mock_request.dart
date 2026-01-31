import 'package:json_annotation/json_annotation.dart';
part 'mock_request.g.dart';

@JsonSerializable()
class MockRequestModel {
  final String url;
  final String method;

  MockRequestModel({required this.url, required this.method});

  factory MockRequestModel.fromJson(Map<String, dynamic> json) =>
      _$MockRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$MockRequestModelToJson(this);
}
