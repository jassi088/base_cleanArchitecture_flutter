import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../domain/domain.dart';

part 'auth_api.g.dart';

class AuthApiConstant {
  static const String login = '/User/login';
  // static const String login = 'auth/get-access-token';
  // static const String getCurrentUser = 'user/me';
  // static const String test401 = 'auth/refresh-token111';
  // static const String logout = 'auth/logout';
}

@RestApi()
@injectable
abstract class AuthApi {
  @factoryMethod
  factory AuthApi(Dio dio) = _AuthApi;

  @POST(AuthApiConstant.login)
  Future<User> login({
    @Query('username') required String username,
    @Query('password') required String password,
  });
}
