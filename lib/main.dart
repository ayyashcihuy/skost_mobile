import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobile_apps/features/auth/data/states/registration_state.dart';
import 'package:mobile_apps/features/auth/presentation/pages/main/navigation.dart';
import 'package:provider/provider.dart';
import 'package:mobile_apps/features/auth/presentation/pages/user-creation/create-password.dart';
import 'package:mobile_apps/features/auth/presentation/pages/user-creation/forgot-password.dart';
import 'package:mobile_apps/features/auth/presentation/pages/user-creation/login.dart';
import 'package:mobile_apps/features/auth/presentation/pages/user-creation/otp.dart';
import 'package:mobile_apps/features/auth/presentation/pages/user-creation/register.dart';

void main() async {
  await dotenv.load();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RegistrationState()),
      ],
      child: const MyApp(),
    ),
  );
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
        '/login': (context) => const LoginPageWidget(),
        '/register': (context) => const RegisterPage(),
        '/otp': (context) => const OtpPage(),
        '/createPassword': (context) => const CreatePasswordPage(),
        '/forgotPassword': (context) => const ForgotPasswordPage(),
        '/home': (context) => const NavigationBarApp(),
      },
      home: LoginPageWidget(),
    );
  }
}
