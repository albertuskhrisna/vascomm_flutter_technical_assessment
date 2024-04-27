import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vascomm_flutter_technical_assessment/common/config/injectable_setup.dart';
import 'package:vascomm_flutter_technical_assessment/common/router/navigation.dart';
import 'package:vascomm_flutter_technical_assessment/common/themes/app_colors.dart';
import 'package:vascomm_flutter_technical_assessment/core/presentation/login/bloc/login_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<LoginBloc>(),
        ),
      ],
      child: MaterialApp(
        title: 'Vascomm',
        debugShowCheckedModeBanner: false,
        initialRoute: CustomNavigation().getInitialRoute(context),
        onGenerateRoute: CustomNavigation().getRoute,
        navigatorObservers: [CustomNavigation().routeObserver],
        // themeMode: ThemeMode.system,
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.bgScreen,
          bottomNavigationBarTheme: BottomNavigationBarThemeData(backgroundColor: AppColors.bgScreen),
          // fontFamily: 'Montserrat',
        ),
      ),
    );
  }
}
