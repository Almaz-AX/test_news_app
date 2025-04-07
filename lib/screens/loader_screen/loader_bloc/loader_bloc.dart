import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../local_storage/app_database.dart' show AppDatabase;
part 'loader_event.dart';
part 'loader_state.dart';

class LoaderBloc extends Bloc<LoaderEvent, LoaderState> {
  final AppDatabase database;

  LoaderBloc({required this.database})
    : super(LoaderState(status: AuthStatus.unknown)) {
    on<LoaderAuthStatusEvent>(_onLoaderAuthStatusEvent);
  }

  Future<void> _onLoaderAuthStatusEvent(
    LoaderAuthStatusEvent event,
    Emitter<LoaderState> emit,
  ) async {
    final isAuth = (await database.select(database.auth).getSingleOrNull());
    if (isAuth == null || !isAuth.isAuth) {
      emit(LoaderState(status: AuthStatus.unauthorized));
    } else {
      emit(LoaderState(status: AuthStatus.authorized));
    }
  }
}
