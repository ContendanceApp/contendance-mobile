import 'package:flutter/material.dart';

import '../widgets/cards_room_builder.dart';
import '../widgets/screen_wrapper/stack_screen.dart';

class RoomList extends StatefulWidget {
  const RoomList({Key? key}) : super(key: key);

  @override
  State<RoomList> createState() => _RoomListState();
}

class _RoomListState extends State<RoomList> {
  @override
  Widget build(BuildContext context) {
    return const StackScreen(
      title: "Daftar Ruangan",
      child: CardsRoomBuilder(),
    );
  }
}
