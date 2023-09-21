import 'package:flutter/material.dart';
import 'package:furniture_wala/features/screens/home_screen.dart';
import 'package:furniture_wala/features/screens/login_screen.dart';
import 'package:furniture_wala/features/screens/otp_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case HomeScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const HomeScreen(),
      );
    case LoginScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const LoginScreen(),
      );
    case OtpScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const OtpScreen(
          phone: '',
        ),
      );
    default:
      return MaterialPageRoute(
        builder: (_) => const HomeScreen(),
      );
  }
}
