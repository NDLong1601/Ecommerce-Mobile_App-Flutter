// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mock_reponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MockResponseModel _$MockResponseModelFromJson(Map<String, dynamic> json) =>
    MockResponseModel(
      statusCode: (json['statusCode'] as num).toInt(),
      message: json['message'] as String,
      data: json['data'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$MockResponseModelToJson(MockResponseModel instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
