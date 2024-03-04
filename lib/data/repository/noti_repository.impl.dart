import 'package:injectable/injectable.dart';

import '../../domain/domain.dart';
import '../data.dart';

@Injectable(as: NotiRepository)
class NotiRepositoryImpl implements NotiRepository {
  final NotiApi _notiApi;

  NotiRepositoryImpl(this._notiApi);

  @override
  Future<PagedList<Msg>> fetchNoti({required int page, required int limit}) async {
    try {
      final response = await _notiApi.fetchNoti(index: page, limit: limit);
      // final List<dynamic> jsonList = response.msg;
      // final List<Msg> data = jsonList.map((e) => Msg.fromJson(e)).toList();

      return PagedList(
        total: response.total,
        otherData: response.numberNew,
        data: response.msg,
      );
    } catch (e) {
      throw DioExceptionMapper().map(e);
    }
  }
}
