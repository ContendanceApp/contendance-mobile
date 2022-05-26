//import 'package:contendance_app/screens/history_presence.dart';
import 'package:contendance_app/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Inter",
      ),
      home: const SplashScreen(),
      //home: const HistoryPresence(), //untuk tes history_presence
    );
  }
}
