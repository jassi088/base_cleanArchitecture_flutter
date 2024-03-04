import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../domain/domain.dart';

part 'noti_api.g.dart';

class NotiApiConstant {
  static const String listMessage = 'User/listMessage';
  static const String setseenMessage = 'User/setseenMessage';
  static const String setseenAllMessage = 'User/setseenAllMessage';
}

@injectable
@RestApi()
abstract class NotiApi {
  @factoryMethod
  factory NotiApi(Dio dio) = _NotiApi;

  @GET(NotiApiConstant.listMessage)
  Future<Notification> fetchNoti({
    @Query('index') required int index,
    @Query('limit') required int limit,
  });

  // @PUT(NotiApiConstant.setseenMessage)
  // Future<bool> setseenMessage(@Body() List<String> body);

  // @PUT(NotiApiConstant.setseenAllMessage)
  // Future<bool> setseenAllMessage();
}
