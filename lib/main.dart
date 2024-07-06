import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:perpustakaan/src/features/authentication/screens/login/welcome_screen.dart';
import 'package:perpustakaan/src/features/authentication/screens/signup/signup_screen.dart';
import 'package:perpustakaan/src/features/core/screens/dashboard/dashboard_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/login': (context) => const WelcomeScreen(),
        '/signup': (context) => const SignupScreen(),
        '/dashboard': (context) => const DashboardScreen(),
      },
      home: const WelcomeScreen(),
    );
  }
}
