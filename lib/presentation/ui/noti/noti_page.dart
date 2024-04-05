import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../app/app.dart';
import '../../../domain/domain.dart';
import '../../../shared/shared.dart';
import '../../presentation.dart';
import 'widgets/noti_item.dart';

@RoutePage()
class NotiPage extends StatefulWidget {
  const NotiPage({super.key});

  @override
  State<NotiPage> createState() => _NotiPageState();
}

class _NotiPageState extends BasePageState<NotiPage, NotiBloc> {
  late final _pagingController = CommonPagingController<Msg>()..disposeBy(disposeBag);
  final Set<String> visibleNoti = <String>{};

  @override
  void initState() {
    super.initState();
    bloc.add(const NotiPageInitiated());
    _pagingController.listen(onLoadMore: () => bloc.add(const NotiLoadMore()));
  }

  @override
  Widget buildPageListeners({required Widget child}) {
    return MultiBlocListener(
      listeners: [
        BlocListener<NotiBloc, NotiState>(
          listenWhen: (previous, current) => previous.notifications != current.notifications,
          listener: (context, state) {
            _pagingController.appendLoadMoreOutput(state.notifications);
          },
        ),
        BlocListener<NotiBloc, NotiState>(
          listenWhen: (previous, current) =>
              previous.loadNotiException != current.loadNotiException,
          listener: (context, state) {
            _pagingController.error = state.loadNotiException;
          },
        ),
      ],
      child: child,
    );
  }

  @override
  Widget buildPage(BuildContext context) {
    return CommonScaffold(
      body: SafeArea(
        child: BlocBuilder<NotiBloc, NotiState>(
          buildWhen: (previous, current) =>
              previous.notifications != current.notifications ||
              previous.isShimmerLoading != current.isShimmerLoading,
          builder: (context, state) {
            return RefreshIndicator(
              onRefresh: () {
                final completer = Completer<void>();
                bloc.add(NotiPageRefreshed(completer: completer));

                return completer.future;
              },
              child: state.isShimmerLoading
                  ? const _ListViewLoader()
                  : CommonPagedListView<Msg>(
                      pagingController: _pagingController,
                      itemBuilder: (context, msg, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.rps, vertical: 4.rps),
                          child: VisibilityDetector(
                            key: Key('$index'),
                            onVisibilityChanged: (VisibilityInfo info) {
                              if (info.visibleFraction == 1) {
                                if (!visibleNoti.contains(msg.id) && !msg.isseen) {
                                  visibleNoti.add(msg.id);
                                  // call API setseenMessage
                                  // ref
                                  //     .read(notiSeenListProvider.notifier)
                                  //     .update((state) => visibleNoti);
                                }
                              }
                            },
                            child: NotiItem(msg: msg),
                          ),
                        );
                      },
                    ),
            );
          },
        ),
      ),
    );
  }
}

class _ListViewLoader extends StatelessWidget {
  const _ListViewLoader();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: UiConstants.shimmerItemCount,
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.rps, vertical: 4.rps),
        child: ShimmerContainerEffectWidget(
          width: double.infinity,
          height: 60.rps,
          borderRadius: 15,
        ),
      ),
    );
  }
}
