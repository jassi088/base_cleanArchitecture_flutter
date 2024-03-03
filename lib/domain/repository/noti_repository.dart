import '../domain.dart';

abstract class NotiRepository {
  Future<PagedList<Notification>> fetchNoti({required int index, required int limit});

  Future<void> setSeenAllMessage();

  Future<void> setSeenMessage({required List<String> idList});
}
