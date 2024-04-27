import 'package:flutter/material.dart';
import 'package:vascomm_flutter_technical_assessment/common/constants/app_routes.dart';
import 'package:vascomm_flutter_technical_assessment/core/presentation/home/page/home_page.dart';
import 'package:vascomm_flutter_technical_assessment/core/presentation/login/page/login_page.dart';
import 'package:vascomm_flutter_technical_assessment/core/presentation/register/page/register_page.dart';

class CustomRoutes {
  static const List<RoutePage> routeList = [
    RoutePage(name: AppRoutes.LOGIN, page: LoginPage()),
    RoutePage(name: AppRoutes.REGISTER, page: RegisterPage()),
    RoutePage(name: AppRoutes.HOME, page: HomePage()),
    // RoutePage(name: AppRoutes.SEARCH, page: SearchPage())
  ];

  static RoutePage getDestinationRoute(String routeName) {
    return routeList.firstWhere(
      (element) => element.name == routeName,
      orElse: () => const RoutePage(name: AppRoutes.LOGIN, page: LoginPage()),
    );
  }
}

class RoutePage {
  final String name;
  final Widget page;

  const RoutePage({
    required this.name,
    required this.page,
  });
}
