import 'package:ecommerce_app/utilities/routes.dart';
import 'package:ecommerce_app/views/pages/landing_page.dart';
import 'package:ecommerce_app/views/pages/auth_page.dart';
import 'package:flutter/material.dart';
Route<dynamic> onGenerate(RouteSettings settings){
    switch (settings.name) {
      case AppRoutes.LoginPageRoute:
        return MaterialPageRoute(builder: (_) => const AuthPage(),);
      case AppRoutes.LandingPageRoute:
      default:
        return MaterialPageRoute(builder: (_) => const LandingPage(),);
    }


}