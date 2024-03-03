import 'package:freezed_annotation/freezed_annotation.dart';

part 'msg.freezed.dart';
part 'msg.g.dart';

@freezed
class Msg with _$Msg {
  const factory Msg({
    @Default(Msg.defaultId) String id,
    @Default(Msg.defaultBody) String body,
    @Default(Msg.defaultTime) String time,
    @Default(Msg.defaultIssent) String issent,
    @Default(Msg.defaultIsseen) String isseen,
  }) = _Msg;

  static const defaultId = '';
  static const defaultBody = '';
  static const defaultTime = '';
  static const defaultIssent = false;
  static const defaultIsseen = false;

  factory Msg.fromJson(Map<String, dynamic> json) => _$MsgFromJson(json);
}
