import '../domain.dart';

abstract class NotiRepository {
  Future<PagedList<Notification>> fetchNoti({required int page, required int limit});

  Future<void> setSeenAllMessage();

  Future<void> setSeenMessage({required List<String> idList});
}
