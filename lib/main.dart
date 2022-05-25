import 'package:contendance_app/screens/home.dart';
import 'package:contendance_app/screens/login.dart';
import 'package:contendance_app/screens/no_connection.dart';
import 'package:contendance_app/screens/room_list.dart';
import 'package:contendance_app/screens/search_class.dart';
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
      initialRoute: "/",
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const Home(),
        '/login': (context) => const LoginScreen(),
        '/room-list': (context) => const RoomList(),
        '/search-class': (context) => const SearchClass(),
        '/no-connection': (context) => const NoConnection(),
      },
    );
  }
}
