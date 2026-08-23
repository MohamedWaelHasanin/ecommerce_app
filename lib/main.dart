import 'package:ecommerce_app/utilities/router.dart';
import 'package:ecommerce_app/utilities/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false ,
      title: 'Ecommerce App',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF9F9F9),
        primaryColor: Colors.red,
        primaryColorLight: Colors.white,
        inputDecorationTheme: InputDecorationTheme(
            labelStyle: Theme.of(context).textTheme.bodyLarge,
            focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2.0),
            borderSide: BorderSide(
              color: Colors.grey,
              ),
            ),
            disabledBorder:OutlineInputBorder(
              borderRadius: BorderRadius.circular(2.0),
              borderSide: BorderSide(
                color: Colors.grey,
              ),
            ) ,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(2.0),
              borderSide: BorderSide(
                color: Colors.grey,
              ),
            ),
        ),
      ),// ThemeData
      onGenerateRoute: onGenerate ,
      initialRoute: AppRoutes.LoginPageRoute,
      // home:Scaffold(),
    ); // MaterialApp
  }
}


