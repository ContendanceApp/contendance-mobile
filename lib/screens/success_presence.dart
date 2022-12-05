import 'package:contendance_app/widgets/screen_wrapper/base_white_screen.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:badges/badges.dart';
import 'package:get/get.dart';

import '../constant/theme.dart';
import '../widgets/button.dart';
import '../data/models/success_presence_model.dart';
import '../controllers/succes_presence_controller.dart';

class SuccessPresence extends StatelessWidget {
  final controller = Get.put(SuccesPresenceController());
  SuccessPresence({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as SuccessPresenceModel;
    return BaseWhiteScreen(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 16),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 0,
              ),
              Column(
                children: [
                  Text(
                    'Presensi Berhasil!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 20.0,
                      fontWeight: fwBold,
                      color: colorPrimaryBlack,
                    ),
                  ),
                  const SizedBox(height: 30),
                  SvgPicture.asset(
                    "assets/images/bookmark-solid.svg",
                    height: 75,
                  ),
                  const SizedBox(height: 16),
                  FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      args.data.presences.rooms.name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 18.0,
                        fontWeight: fwBold,
                        color: colorPrimaryBlue,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Badge(
                    toAnimate: false,
                    shape: BadgeShape.square,
                    elevation: 0,
                    badgeColor: colorPrimaryBlue,
                    borderRadius: BorderRadius.circular(150),
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                    badgeContent: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        args.data.presences.rooms.roomCode,
                        style: fontInter.copyWith(
                          color: const Color(0xFFFFFFFF).withOpacity(0.9),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 36,
                  ),
                  Column(
                    children: <Widget>[
                      FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          args.data.presences.subjectsSchedules.subjects.name,
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
                          "${args.data.presences.subjectsSchedules.startTime} - ${args.data.presences.subjectsSchedules.finishTime}",
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
                          FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text(
                              args.data.presences.users.fullname,
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
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: colorGradient,
                        ),
                      ),
                    ),
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
      ),
    );
  }
}
