import 'package:ecommerce_app/utilities/routes.dart';
import 'package:ecommerce_app/views/pages/bottom_navbar.dart';
import 'package:ecommerce_app/views/pages/landing_page.dart';
import 'package:ecommerce_app/views/pages/auth_page.dart';
import 'package:flutter/material.dart';
Route<dynamic> onGenerate(RouteSettings settings){
    switch (settings.name) {
        case AppRoutes.loginPageRoute:
          settings: settings;
          return MaterialPageRoute(builder: (_) => const AuthPage(),);
        case AppRoutes.registerPageRoute:
          settings: settings;
          return MaterialPageRoute(builder: (_) => const AuthPage(),
          );
        case AppRoutes.bottomNavBarRoute:
          settings: settings;
          return MaterialPageRoute(builder: (_)=> const BottomNavbar());
        case AppRoutes.landingPageRoute:
        default:
          return MaterialPageRoute(builder: (_) => const LandingPage(),);
    }

}