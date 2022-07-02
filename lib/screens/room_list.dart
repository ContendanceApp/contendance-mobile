import 'package:contendance_app/widgets/cards_room_builder.dart';
import 'package:contendance_app/widgets/screen_wrapper/stack_screen.dart';
import 'package:flutter/material.dart';

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
