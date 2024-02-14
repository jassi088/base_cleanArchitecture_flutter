import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:shared/shared.dart';

// import '../../domain.dart';

part 'user.freezed.dart';
part 'user.g.dart';

// @freezed
// class User with _$User {
//   const factory User({
//     @Default(User.defaultId) int id,
//     @Default(User.defaultEmail) String email,
//     @Default(User.defaultMoney) BigDecimal money,
//     @Default(User.defaultBirthday) DateTime? birthday,
//     @Default(User.defaultAvatar) ImageUrl avatar,
//     @Default(User.defaultPhotos) List<ImageUrl> photos,
//     @Default(User.defaultGender) Gender gender,
//   }) = _User;

//   static const defaultId = 0;
//   static const defaultEmail = '';
//   static const defaultMoney = BigDecimal.zero;
//   static const DateTime? defaultBirthday = null;
//   static const defaultAvatar = ImageUrl();
//   static const defaultPhotos = <ImageUrl>[];
//   static const defaultGender = Gender.defaultValue;
// }

@freezed
class User with _$User {
  const factory User({
    // @JsonKey(name: 'code') String? code,
    @Default(User.defaultCode) String code,
    @Default(User.defaultName) String name,
    @Default(User.defaultToken) String token,
    @Default(User.defaultRefeshToken) String refeshToken,
    @Default(User.defaultRole) String role,
    @Default(User.defaultPhone) String phone,
    @Default(User.defaultExpirationTime) int expirationTime,
  }) = _User;

  static const defaultCode = '';
  static const defaultName = '';
  static const defaultToken = '';
  static const defaultRefeshToken = '';
  static const defaultRole = '';
  static const defaultPhone = '';
  static const defaultExpirationTime = 0;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
