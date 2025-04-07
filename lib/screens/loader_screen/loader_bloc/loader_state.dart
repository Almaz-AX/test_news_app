// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'loader_bloc.dart';

enum AuthStatus { unknown, authorized, unauthorized }

final class LoaderState extends Equatable {
  final AuthStatus status;
  const LoaderState({required this.status});
  @override
  List<Object> get props => [status];
}
