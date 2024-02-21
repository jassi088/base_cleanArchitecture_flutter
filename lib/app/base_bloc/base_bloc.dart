import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/shared.dart';
import '../app.dart';

abstract class BaseBloc<E extends BaseBlocEvent, S extends BaseBlocState>
    extends BaseBlocDelegate<E, S> with EventTransformerMixin, LogMixin {
  BaseBloc(super.initialState);
}

abstract class BaseBlocDelegate<E extends BaseBlocEvent, S extends BaseBlocState>
    extends Bloc<E, S> {
  BaseBlocDelegate(super.initialState);
}
