import 'package:charge_mate/presentation/login/login_screen.dart';
import 'package:charge_mate/presentation/login/login_view_model.dart';
import 'package:charge_mate/presentation/user_info/user_info_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../di/di_setup.dart';
import '../presentation/bottom_navigation/bottom_navigation_screen.dart';
import '../presentation/splash/splash_screen.dart';
import '../utils/constants.dart';

final router = GoRouter(initialLocation: Constants.splashNavigationRoute, routes: [
  GoRoute(
      path: Constants.splashNavigationRoute,
      builder: (context, state) {
        return const SplashScreen();
      }),
  GoRoute(
      path: Constants.bottomNavigationRoute,
      builder: (context, state) {
        return const BottomNavigationScreen();
      }),
  GoRoute(
      path: Constants.loginRoute,
      builder: (context, state) {
        return ChangeNotifierProvider<LoginViewModel>(
          create: (context) => getIt<LoginViewModel>(),
          child: const LoginScreen(),
        );
      }),
  GoRoute(
      path: Constants.userInfoRoute,
      builder: (context, state) {
        return const UserInfoScreen();
      }),
]);
