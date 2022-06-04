import 'package:contendance_app/screens/about_app.dart';
import 'package:contendance_app/screens/account.dart';
import 'package:contendance_app/screens/account_detail.dart';
import 'package:contendance_app/screens/change_schedule.dart';
import 'package:contendance_app/screens/home.dart';
import 'package:contendance_app/screens/login.dart';
import 'package:contendance_app/screens/no_connection.dart';
import 'package:contendance_app/screens/presence_history.dart';
import 'package:contendance_app/screens/privacy_policy.dart';
import 'package:contendance_app/screens/prominent_disclosure.dart';
import 'package:contendance_app/screens/room_list.dart';
import 'package:contendance_app/screens/search_class.dart';
import 'package:contendance_app/screens/splash_screen.dart';
import 'package:contendance_app/screens/subject_schedule.dart';
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
        '/account': (context) => const Account(),
        '/login': (context) => const LoginScreen(),
        '/room-list': (context) => const RoomList(),
        '/search-class': (context) => const SearchClass(),
        '/no-connection': (context) => const NoConnection(),
        '/presence-history': (context) => const PresenceHistoryScreen(),
        '/subject-schedule': (context) => const SubjectSchedule(),
        '/change-schedule': (context) => const ChangeScheduleScreen(),
        '/account-detail': (context) => const AccountDetail(),
        '/privacy-policy': (context) => const PrivacyPolicy(),
        '/about-app': (context) => const AboutApp(),
        '/prominent-disclosure-location': (context) =>
            const ProminentDisclosureLocation(),
      },
    );
  }
}
