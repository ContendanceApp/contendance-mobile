import 'package:contendance_app/screens/search_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FloatingActionButtonComp extends StatelessWidget {
  const FloatingActionButtonComp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Container(
        padding: const EdgeInsets.all(8),
        width: 60,
        height: 60,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xff145ae3),
              Color(0xff15aeef),
            ],
          ),
        ),
        child: SvgPicture.asset(
          "assets/images/search-class.svg",
          height: 20,
        ),
      ),
      onPressed: () {
        // _showNotification('Beacon Detected', beacons[0].proximityUUID,
        //     'This is the payload');
        // NotificationAPI.showNotification(
        //     id: 1,
        //     title: 'Test Notification',
        //     body: 'Ini body notification',
        //     payload: 'test.abs');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SearchClass(),
          ),
        );
      },
    );
  }
}
