import 'package:calculator_app/src/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class MyApplication extends StatelessWidget {
  const MyApplication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dark Theme',
      theme: ThemeData(useMaterial3: true),
      home: const SplashScreen(),
    );
  }
}
