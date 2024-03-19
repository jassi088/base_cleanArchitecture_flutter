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

      return PagedList(data: response.msg, otherData: response.numberNew, total: response.total);
    } catch (e) {
      throw DioExceptionMapper().map(e);
    }
  }
}
