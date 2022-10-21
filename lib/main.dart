import 'package:get/get.dart';

import '../screens/about_app.dart';
import '../screens/account.dart';
import '../screens/account_detail.dart';
import '../screens/change_schedule.dart';
import '../screens/class_not_found.dart';
import '../screens/detail_class.dart';
import '../screens/home.dart';
import '../screens/login.dart';
import '../screens/no_connection.dart';
import '../screens/open_presence.dart';
import '../screens/presence_history.dart';
import '../screens/privacy_policy.dart';
import '../screens/prominent_disclosure.dart';
import '../screens/room_list.dart';
import '../screens/search_class.dart';
import '../screens/splash_screen.dart';
import '../screens/subject_schedule.dart';
import 'screens/success_presence.dart';
import 'screens/success_open_presence.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initializeDateFormatting('id_ID', null)
      .then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Inter",
      ),
      initialRoute: "/",
      routes: {
        '/': (context) => SplashScreen(),
        '/home': (context) => const Home(),
        '/account': (context) => const Account(),
        '/login': (context) => const LoginScreen(),
        '/room-list': (context) => RoomList(),
        '/search-class': (context) => const SearchClass(),
        '/no-connection': (context) => const NoConnection(),
        '/presence-history': (context) => const PresenceHistoryScreen(),
        '/subject-schedule': (context) => SubjectSchedule(),
        '/open-presence': (context) => const OpenPresence(),
        '/change-schedule': (context) => ChangeScheduleScreen(),
        '/account-detail': (context) => const AccountDetail(),
        '/privacy-policy': (context) => const PrivacyPolicy(),
        '/success-open-presence': (context) => SuccessOpenPresence(),
        '/success-presence': (context) => SuccessPresence(),
        '/about-app': (context) => AboutApp(),
        '/prominent-disclosure-location': (context) =>
            const ProminentDisclosureLocation(),
        '/detail-class': (context) => const DetailClass(),
        '/class-not-found': (context) => ClassNotFound(),
      },
      builder: EasyLoading.init(),
    );
  }
}
