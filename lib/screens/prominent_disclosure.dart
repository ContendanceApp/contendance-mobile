import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/button.dart';
import '../constant/theme.dart';
import '../widgets/screen_wrapper/base_white_screen.dart';

class ProminentDisclosureLocation extends StatelessWidget {
  const ProminentDisclosureLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWhiteScreen(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Use your location",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 20.0,
                    fontWeight: fwBold,
                    color: colorPrimaryBlack,
                  ),
                ),
                const SizedBox(height: 25),
                SvgPicture.asset("assets/images/location-illustration.svg"),
                const SizedBox(height: 57),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: paddingXl),
                    child: Text(
                      "Contendance collects location data to discover room/class with beacon near you even when the app is closed or not in use.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF64749F),
                        height: 1.5,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
            Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: Container(
                margin: const EdgeInsets.symmetric(
                    horizontal: paddingBase, vertical: 48),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Button(
                        text: "No thanks",
                        primary: false,
                        secondary: true,
                        callback: () async {
                          final prefs = await SharedPreferences.getInstance();
                          await prefs.setString('locationPerm', "off");
                          await prefs.setBool('collectsLocation', false);

                          if (prefs.getString('locationPerm') != null) {
                            Navigator.pushReplacementNamed(context, "/home");
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 24,
                    ),
                    Expanded(
                      flex: 1,
                      child: Button(
                        text: "Turn on",
                        primary: true,
                        secondary: false,
                        callback: () async {
                          final prefs = await SharedPreferences.getInstance();
                          await prefs.setString('locationPerm', "on");
                          await prefs.setBool('collectsLocation', true);

                          if (prefs.getString('locationPerm') != null) {
                            Navigator.pushReplacementNamed(context, "/home");
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
