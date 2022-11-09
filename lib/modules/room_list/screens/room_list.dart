import 'package:contendance_app/modules/room_list/controllers/room_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/cards_room_builder.dart';
import '../../../widgets/screen_wrapper/stack_screen.dart';

class RoomList extends StatelessWidget {
  final RoomListController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return const StackScreen(
      title: "Daftar Ruangan",
      child: CardsRoomBuilder(),
    );
  }
}
