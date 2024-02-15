import 'package:json_annotation/json_annotation.dart';

part 'api_exception.g.dart';

@JsonSerializable()
class ApiException {
  final String message;
  final String code;
  final dynamic errors;

  ApiException({required this.message, required this.code, this.errors});

  factory ApiException.fromJson(Map<String, dynamic> json) => _$ApiExceptionFromJson(json);
}
