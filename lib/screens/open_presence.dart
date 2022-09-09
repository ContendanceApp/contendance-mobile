import 'package:contendance_app/widgets/button.dart';
import 'package:contendance_app/constant/theme.dart';
import 'package:contendance_app/data/models/presence.dart';
import 'package:contendance_app/services/presence_service.dart';
import 'package:contendance_app/widgets/screen_wrapper/base_white_screen.dart';
import 'package:iconly/iconly.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
                    "Kelas Ditemukan!",
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
                    "Ruangan ${args.schedule.data.room.roomCode}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 18.0,
                      fontWeight: fwBold,
                      color: colorPrimaryBlue,
                    ),
                  ),
                  const SizedBox(height: 57),
                ],
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.32,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    width: 200,
                    child: Text(
                      args.schedule.data.subject.name,
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
                    "${args.schedule.data.subjectSchedule.startTime} - ${args.schedule.data.subjectSchedule.finishTime}",
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
                        args.schedule.data.lecturer.fullname,
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
                  children: [
                    !isClicked
                        ? Expanded(
                            flex: 1,
                            child: Button(
                              text: "Batal",
                              callback: () => Navigator.pop(context),
                              primary: false,
                              secondary: true,
                            ),
                          )
                        : const SizedBox(),
                    !isClicked
                        ? const SizedBox(
                            width: 24,
                          )
                        : const SizedBox(),
                    Expanded(
                      flex: 1,
                      child: Button(
                        text: "Buka Presensi",
                        callback: () async {
                          setState(() {
                            isClicked = !isClicked;
                          });
                          final prefs = await SharedPreferences.getInstance();
                          int userId = prefs.getInt('userId') ?? 0;
                          Map<String, String> body = {
                            'proximity_uuid':
                                args.beacon.proximityUUID.toLowerCase(),
                            'major': args.beacon.major.toString(),
                            'minor': args.beacon.minor.toString(),
                            'user_id': userId.toString(),
                          };
                          try {
                            await presence
                                .openPresence(body)
                                .then((value) async {
                              final success = await prefs.remove('classStatus');
                              if (success) {
                                print(prefs.getString('classStatus'));
                                print("kehapus kok");
                                if (mounted) {
                                  Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    "/success-open-presence",
                                    (Route<dynamic> route) => false,
                                    arguments: value,
                                  );
                                }
                              }
                            });
                          } catch (e) {
                            print(e);
                          }
                        },
                        primary: true,
                        secondary: false,
                        withChild: !isClicked
                            ? const Text(
                                "Buka Presensi",
                                softWrap: false,
                              )
                            : SizedBox(
                                width: 15,
                                height: 15,
                                child: CircularProgressIndicator(
                                  strokeWidth: 3,
                                  color: colorWhite,
                                ),
                              ),
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

class BeaconArgs {
  final Schedule schedule;
  final dynamic beacon;

  BeaconArgs({
    required this.beacon,
    required this.schedule,
  });
}
