import 'package:json_annotation/json_annotation.dart';

part 'respone_exception.g.dart';

@JsonSerializable()
class ResponeException {
  final String? message;
  final String? code;
  final dynamic errors;

  ResponeException({this.message, this.code, this.errors});

  factory ResponeException.fromJson(Map<String, dynamic> json) => _$ResponeExceptionFromJson(json);
}
