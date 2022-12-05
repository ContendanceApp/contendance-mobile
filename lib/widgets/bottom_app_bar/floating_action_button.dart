import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constant/theme.dart';
import '../../screens/search_class.dart';

class FloatingActionButtonComp extends StatelessWidget {
  const FloatingActionButtonComp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Container(
        padding: const EdgeInsets.all(8),
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: colorGradient,
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
