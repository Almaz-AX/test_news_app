part of 'loader_bloc.dart';

sealed class LoaderEvent extends Equatable {
  const LoaderEvent();

  @override
  List<Object> get props => [];
}

final class LoaderAuthStatusEvent extends LoaderEvent {
  const LoaderAuthStatusEvent();
}

