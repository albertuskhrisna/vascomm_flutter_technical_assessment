import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vascomm_flutter_technical_assessment/common/constants/app_routes.dart';
import 'package:vascomm_flutter_technical_assessment/common/router/routes.dart';
import 'package:vascomm_flutter_technical_assessment/core/presentation/login/bloc/login_bloc.dart';

class CustomNavigation {
  late RouteObserver<PageRoute> routeObserver;

  CustomNavigation() {
    routeObserver = RouteObserver<PageRoute>();
  }

  Route<dynamic>? getRoute(RouteSettings? settings) {
    final RoutePage merkhaPage = CustomRoutes.getDestinationRoute(settings?.name ?? '');
    return _buildRoute(settings, merkhaPage.page);
  }

  PageRoute _buildRoute(RouteSettings? settings, Widget page) {
    if (Platform.isIOS) {
      return CupertinoPageRoute(
        settings: settings,
        builder: (context) {
          return page;
        },
      );
    }
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) {
        return AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: const Offset(0, 0),
              ).animate(animation),
              child: page,
            );
          },
        );
      },
      transitionDuration: const Duration(milliseconds: 300),
    );
  }

  PageRoute getBuildRoute(Widget page, {RouteSettings? settings}) =>
      _buildRoute(settings, page);

  String getInitialRoute(BuildContext context) {
    final loginState = context.select((LoginBloc bloc) => bloc.state);
    if (loginState.loginStatus == LoginStatus.success) {
      return AppRoutes.HOME;
    } else {
      return AppRoutes.LOGIN;
    }
  }

  static void push(BuildContext context, String path, {Object? args}) {
    Navigator.of(context).pushNamed(path, arguments: args);
  }

  static void replaceAll(BuildContext context, String path, {Object? args}) {
    Navigator.of(context).pushNamedAndRemoveUntil(path, (route) => false, arguments: args);
  }
}
