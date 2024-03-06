import '../../shared.dart';

class ParseException extends AppException {
  const ParseException(this.kind, this.rootException) : super(AppExceptionType.parse);

  final ParseExceptionKind kind;
  final Object? rootException;

  @override
  String get message => switch (kind) {
        ParseExceptionKind.invalidSourceFormat => 'Lỗi phân tích dữ liệu',
      };

  @override
  String toString() => 'ParseException: {kind: $kind, rootException: $rootException}';
}

enum ParseExceptionKind {
  invalidSourceFormat,
}
