import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../shared/shared.dart';
import '../domain.dart';

@Injectable()
class NotiUsecase extends BaseLoadMoreUseCase<Msg> {
  final NotiRepository _notiRepository;

  NotiUsecase(this._notiRepository) : super(initPage: Constants.initialPage);

  @protected
  @override
  Future<PagedList<Msg>> buildUseCase({required int page, required int limit}) {
    return _notiRepository.fetchNoti(page: page, limit: limit);
  }

  // Future<void> setSeenAllMessage() async {
  //   return await _notiRepository.setSeenAllMessage();
  // }

  // Future<void> setSeenMessage({required List<String> idList}) async {
  //   return await _notiRepository.setSeenMessage(idList: idList);
  // }
}
