import 'package:contendance_app/components/stack_screen.dart';
import 'package:contendance_app/constant/theme.dart';
import 'package:flutter/material.dart';

class RoomList extends StatefulWidget {
  const RoomList({Key? key}) : super(key: key);

  @override
  State<RoomList> createState() => _RoomListState();
}

class _RoomListState extends State<RoomList> {
  @override
  Widget build(BuildContext context) {
    return StackScreen(
        title: "Daftar Ruangan",
        child: GridView.count(
          padding: const EdgeInsets.all(0),
          controller: ScrollController(
            keepScrollOffset: false,
          ),
          clipBehavior: Clip.none,
          shrinkWrap: true,
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 2.2,
          children: List.generate(
            20,
            (index) => InkWell(
              child: Container(
                padding: const EdgeInsets.all(18),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "C 102",
                      textAlign: TextAlign.center,
                      style: cInter.copyWith(
                        fontSize: 14,
                        fontWeight: bold,
                        color: cPrimaryBlack,
                      ),
                    ),
                    Text(
                      "Lantai 1 - D4",
                      textAlign: TextAlign.center,
                      style: cInter.copyWith(
                        fontSize: 14,
                        fontWeight: bold,
                        color: cPrimaryBlue,
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFFFF),
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  border: Border.all(
                    color: const Color(0xFFF4F4F4),
                    width: 1.0,
                    style: BorderStyle.solid,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      spreadRadius: 2,
                      blurRadius: 10,
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
