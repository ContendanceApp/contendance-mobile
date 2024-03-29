import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/theme.dart';
import '../widgets/button.dart';
import '../widgets/screen_wrapper/base_white_screen.dart';
import '../data/models/open_presence_model.dart';
import '../services/presence_service.dart';

class OpenPresence extends StatefulWidget {
  const OpenPresence({Key? key}) : super(key: key);

  @override
  State<OpenPresence> createState() => _OpenPresenceState();
}

class _OpenPresenceState extends State<OpenPresence> {
  PresenceService presence = PresenceService();
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as BeaconArgs;
    return BaseWhiteScreen(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 0,
            ),
            Column(
              children: [
                FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    "Presensi Berhasil Dibuka!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 20.0,
                      fontWeight: fwBold,
                      color: colorPrimaryBlack,
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                ClipRRect(
                  borderRadius: BorderRadius.circular(35),
                  child: Image.asset(
                    'assets/images/lab-pens.jpg',
                    height: 135,
                    width: 135,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                const SizedBox(height: 22),
                FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    "Ruangan ${args.schedule.data.rooms.roomCode}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 18.0,
                      fontWeight: fwBold,
                      color: colorPrimaryBlue,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 36,
                ),
                Badge(
                  toAnimate: false,
                  shape: BadgeShape.square,
                  elevation: 0,
                  badgeColor: colorPrimaryBlue,
                  borderRadius: BorderRadius.circular(50),
                  badgeContent: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      "Kelas ${args.schedule.data.subjectsSchedules.studyGroups.name}",
                      textAlign: TextAlign.center,
                      style: fontInter.copyWith(
                        fontSize: 14,
                        fontWeight: fwMedium,
                        color: colorWhite,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Column(
                  children: <Widget>[
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Text(
                        args.schedule.data.subjectsSchedules.subjects.name,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontFamily: "Inter",
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF64749F),
                          height: 1.5,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        "${args.schedule.data.subjectsSchedules.startTime} - ${args.schedule.data.subjectsSchedules.finishTime}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontFamily: "Inter",
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF333333),
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Column(
                      children: [
                        const SizedBox(
                          width: 50,
                          child: Divider(
                            color: Color(0xFFF4F4F4),
                            height: 10,
                            thickness: 2,
                          ),
                        ),
                        const SizedBox(height: 4),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Text(
                            args.schedule.data.users.fullname,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontFamily: "Inter",
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF145AE3),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(height: 4),
            Container(
              margin: const EdgeInsets.symmetric(
                  horizontal: paddingBase, vertical: paddingXl),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Button(
                    text: "Kembali ke Beranda",
                    callback: () => Get.offNamedUntil(
                      "/home",
                      (Route<dynamic> route) => false,
                    ),
                    primary: true,
                    secondary: false,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BeaconArgs {
  final OpenPresenceModel schedule;
  final dynamic beacon;

  BeaconArgs({
    required this.beacon,
    required this.schedule,
  });
}
