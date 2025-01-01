import 'package:flutter/material.dart';
import 'package:mobile_apps/features/auth/presentation/pages/login.dart';
import 'package:mobile_apps/features/auth/presentation/pages/register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      theme: ThemeData(
        fontFamily: 'JakartaSans', 
        colorScheme: ColorScheme.light(),
        primaryColor: Color(0xFF2A2E54),
        scaffoldBackgroundColor: Colors.white,
      ),
      routes: {
        '/login': (context) => LoginPageWidget(),
        '/register': (context) => const RegisterPage()
      },
      home: LoginPageWidget(),
    );
  }
}
