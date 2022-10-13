import 'package:contendance_app/controllers/waiting_room_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../constant/theme.dart';
import '../widgets/button.dart';
import '../widgets/screen_wrapper/stack_screen.dart';

class WaitingRoom extends StatelessWidget {
  final controller = Get.put(WaitingRoomController());
  WaitingRoom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StackScreen(
      title: "Daftar Ruangan",
      child: ListView(
        shrinkWrap: true,
        controller: ScrollController(
          keepScrollOffset: false,
        ),
        padding: const EdgeInsets.all(0),
        children: [
          waitingUser(name: "Ainul Muhlasin"),
          waitingUser(name: "Faisal Amrullah Pratama"),
          waitingUser(name: "Raihan Ahnaf Nafisaputra"),
        ],
      ),
    );
  }

  Widget waitingUser({required String name}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: paddingBase),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            name,
            style: fontInter.copyWith(
              fontSize: 16.0,
              fontWeight: fwMedium,
              color: colorPrimaryBlack,
            ),
          ),
          Button(
            text: "Terima",
            callback: () {},
            primary: false,
            secondary: false,
            backgroundColor: colorPrimaryBlue,
            fontColor: colorWhite,
            paddingX: 10,
            paddingY: 5,
            customFontSize: 14,
          )
        ],
      ),
    );
  }
}
