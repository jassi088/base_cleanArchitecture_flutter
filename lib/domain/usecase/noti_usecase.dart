import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../shared/shared.dart';
import '../domain.dart';

@Injectable()
class NotiUsecase extends BaseLoadMoreUseCase<Notification> {
  final NotiRepository _notiRepository;

  NotiUsecase(this._notiRepository) : super(initPage: PagingConstants.initialPage);

  @protected
  @override
  Future<PagedList<Notification>> buildUseCase() {
    return _notiRepository.fetchNoti(page: page, limit: PagingConstants.itemsPerPage);
  }

  Future<void> setSeenAllMessage() async {
    return await _notiRepository.setSeenAllMessage();
  }

  Future<void> setSeenMessage({required List<String> idList}) async {
    return await _notiRepository.setSeenMessage(idList: idList);
  }
}
