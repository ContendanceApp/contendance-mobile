import 'package:contendance_app/widgets/button.dart';
import 'package:contendance_app/widgets/screen_wrapper/stack_screen.dart';
import 'package:contendance_app/constant/theme.dart';
import 'package:flutter/material.dart';

class WaitingRoom extends StatefulWidget {
  const WaitingRoom({Key? key}) : super(key: key);

  @override
  State<WaitingRoom> createState() => _WaitingRoomState();
}

class _WaitingRoomState extends State<WaitingRoom> {
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
