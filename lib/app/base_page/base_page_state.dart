import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../domain/domain.dart';
import '../../initializer/di/di.dart';
import '../../presentation/presentation.dart';
import '../../shared/shared.dart';
import '../app.dart';

abstract class BasePageState<T extends StatefulWidget, B extends BaseBloc> extends State<T>
    with LogMixin
    implements ExceptionHandlerListener {
  late final AppNavigator navigator = getIt.get<AppNavigator>();
  late final AppBloc appBloc = getIt.get<AppBloc>();
  late final ExceptionMessageMapper exceptionMessageMapper = const ExceptionMessageMapper();
  late final ExceptionHandler exceptionHandler =
      ExceptionHandler(navigator: navigator, listener: this);

  late final CommonBloc commonBloc = getIt.get<CommonBloc>()
    ..navigator = navigator
    ..disposeBag = disposeBag
    ..appBloc = appBloc
    ..exceptionHandler = exceptionHandler
    ..exceptionMessageMapper = exceptionMessageMapper;

  late final B bloc = getIt.get<B>()
    ..navigator = navigator
    ..disposeBag = disposeBag
    ..appBloc = appBloc
    ..commonBloc = commonBloc
    ..exceptionHandler = exceptionHandler
    ..exceptionMessageMapper = exceptionMessageMapper;

  late final DisposeBag disposeBag = DisposeBag();

  bool get isAppWidget => false;

  @override
  Widget build(BuildContext context) {
    if (!isAppWidget) {
      AppDimen.of(context);
      AppColors.of(context);
    }

    // Tạo Provider cho navigator, các Widget con extends lại BasePageState khi dùng navigator sẽ biết
    // đang đứng ở đâu và tìm lên thằng cha để showDialog hay Popup
    return Provider(
      create: (context) => navigator,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => bloc),
          BlocProvider(create: (_) => commonBloc),
        ],
        child: BlocListener<CommonBloc, CommonState>(
          listenWhen: (previous, current) =>
              previous.appExceptionWrapper != current.appExceptionWrapper &&
              current.appExceptionWrapper != null,
          listener: (context, state) {
            handleException(state.appExceptionWrapper!);
          },
          child: buildPageListeners(
            child: isAppWidget
                ? buildPage(context)
                : Stack(
                    children: [
                      buildPage(context),
                      BlocBuilder<CommonBloc, CommonState>(
                        buildWhen: (previous, current) => previous.isLoading != current.isLoading,
                        builder: (context, state) => Visibility(
                          visible: state.isLoading,
                          child: buildPageLoading(),
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  Widget buildPageListeners({required Widget child}) => child;

  Widget buildPageLoading() => const Center(child: CircularProgressIndicator.adaptive());

  Widget buildPage(BuildContext context);

  @override
  void dispose() {
    super.dispose();
    disposeBag.dispose();
  }

  void handleException(AppExceptionWrapper appExceptionWrapper) {
    exceptionHandler
        .handleException(
            appExceptionWrapper, exceptionMessageMapper.map(appExceptionWrapper.appException))
        .then((value) {
      appExceptionWrapper.exceptionCompleter?.complete();
    });
  }

  @override
  void onRefreshTokenFailed() {}
}
