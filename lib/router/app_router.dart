import 'package:ecommerce_mobile_app/router/route_name.dart';
import 'package:ecommerce_mobile_app/screens/home/home_screen.dart';
import 'package:ecommerce_mobile_app/screens/splash/splash_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: RouteName.splashRoute,
  routes: [
    GoRoute(
      path: RouteName.splashRoute,
      name: RouteName.splashRoute,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: RouteName.homeRoute,
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);
