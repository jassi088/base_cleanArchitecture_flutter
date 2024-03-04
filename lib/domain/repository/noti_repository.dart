import '../domain.dart';

abstract class NotiRepository {
  Future<PagedList<Msg>> fetchNoti({required int page, required int limit});

  // Future<void> setSeenAllMessage();

  // Future<void> setSeenMessage({required List<String> idList});
}
