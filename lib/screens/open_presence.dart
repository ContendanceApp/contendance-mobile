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
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            //Container for tittle
            Positioned(
              top: MediaQuery.of(context).size.height * 0.15,
              child: Column(
                children: [
                  Text(
                    "Presensi Berhasil Dibuka!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 20.0,
                      fontWeight: fwBold,
                      color: colorPrimaryBlack,
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
                  Text(
                    "Ruangan ${args.schedule.data.rooms.roomCode}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 18.0,
                      fontWeight: fwBold,
                      color: colorPrimaryBlue,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Badge(
                    toAnimate: false,
                    shape: BadgeShape.square,
                    elevation: 0,
                    badgeColor: colorPrimaryBlue,
                    borderRadius: BorderRadius.circular(50),
                    badgeContent: Text(
                      "Kelas ${args.schedule.data.subjectsSchedules.studyGroups.name}",
                      textAlign: TextAlign.center,
                      style: fontInter.copyWith(
                        fontSize: 14,
                        fontWeight: fwMedium,
                        color: colorWhite,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.30,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    width: 225,
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
                  Text(
                    "${args.schedule.data.subjectsSchedules.startTime} - ${args.schedule.data.subjectsSchedules.finishTime}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: "Inter",
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF333333),
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
                      Text(
                        args.schedule.data.users.fullname,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontFamily: "Inter",
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF145AE3),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 4),
            Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: Container(
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
                    // !isClicked
                    //     ? Expanded(
                    //         flex: 1,
                    //         child: Button(
                    //           text: "Batal",
                    //           callback: () => Get.back(),
                    //           primary: false,
                    //           secondary: true,
                    //         ),
                    //       )
                    //     : const SizedBox(),
                    // !isClicked
                    //     ? const SizedBox(
                    //         width: 24,
                    //       )
                    //     : const SizedBox(),
                    // Expanded(
                    //   flex: 1,
                    //   child: Button(
                    //     text: "Buka Presensi",
                    //     callback: () async {
                    //       setState(() {
                    //         isClicked = !isClicked;
                    //       });
                    //       final prefs = await SharedPreferences.getInstance();
                    //       int userId = prefs.getInt('userId') ?? 0;
                    //       Map<String, int> body = {
                    //         'proximity_uuid':
                    //             args.beacon.proximityUUID.toLowerCase(),
                    //         'major': args.beacon.major,
                    //         'minor': args.beacon.minor,
                    //         'user_id': userId,
                    //       };
                    //       try {
                    //         await presence
                    //             .openPresence(body)
                    //             .then((value) async {
                    //           final success = await prefs.remove('classStatus');
                    //           if (success) {
                    //             if (mounted) {
                    //               Get.offAllNamed(
                    //                 "/success-open-presence",
                    //               );
                    //             }
                    //           }
                    //         });
                    //       } catch (e) {
                    //         throw Exception(e);
                    //       }
                    //     },
                    //     primary: true,
                    //     secondary: false,
                    //     withChild: !isClicked
                    //         ? const Text(
                    //             "Buka Presensi",
                    //             softWrap: false,
                    //           )
                    //         : SizedBox(
                    //             width: 15,
                    //             height: 15,
                    //             child: CircularProgressIndicator(
                    //               strokeWidth: 3,
                    //               color: colorWhite,
                    //             ),
                    //           ),
                    //   ),
                    // ),
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

class BeaconArgs {
  final OpenPresenceModel schedule;
  final dynamic beacon;

  BeaconArgs({
    required this.beacon,
    required this.schedule,
  });
}
