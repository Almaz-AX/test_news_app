import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_news_app/navigation/main_navigation.dart';

import 'loader_bloc/loader_bloc.dart';

class LoaderScreen extends StatelessWidget {
  const LoaderScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoaderBloc, LoaderState>(
      listener: (context, state) {
        if (state.status == AuthStatus.authorized) {
          Navigator.of(context).pushNamedAndRemoveUntil(
            MainNavigationRouteNames.main,
            (Route<dynamic> route) => false,
          );
        } else if (state.status == AuthStatus.unauthorized) {
          Navigator.of(context).pushNamedAndRemoveUntil(
            MainNavigationRouteNames.auth,
            (Route<dynamic> route) => false,
          );
        }
      },
      child: Material(child:Center(child: CircularProgressIndicator(),)),
    );
  }
}
