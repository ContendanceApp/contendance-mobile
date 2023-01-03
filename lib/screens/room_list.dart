import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/room_list_controller.dart';
import '../widgets/cards_room_builder.dart';
import '../widgets/screen_wrapper/stack_screen.dart';

class RoomList extends StatelessWidget {
  final controller = Get.put(RoomListController());
  RoomList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const StackScreen(
      title: "Daftar Ruangan",
      child: CardsRoomBuilder(),
    );
  }
}
