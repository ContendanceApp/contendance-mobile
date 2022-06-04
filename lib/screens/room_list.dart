import 'package:contendance_app/components/stack_screen.dart';
import 'package:contendance_app/constant/theme.dart';
import 'package:contendance_app/data/models/room.dart';
import 'package:flutter/material.dart';

class RoomList extends StatefulWidget {
  const RoomList({Key? key}) : super(key: key);

  @override
  State<RoomList> createState() => _RoomListState();
}

class _RoomListState extends State<RoomList> {
  List rooms = [
    Room(
        name: "Jaringan Komputer",
        roomCode: "C 305",
        location: "Lantai 3 - Gedung D4",
        description: "Ruangan yang digunakan untuk praktek jaringan komputer"),
    Room(
        name: "Komputer Vision (CV)",
        roomCode: "C 306",
        location: "Lantai 3 - Gedung D4",
        description: "Ruangan yang digunakan untuk praktek pengolohan citra"),
    Room(
        name: "Sistem Informasi (SI)",
        roomCode: "C 101",
        location: "Lantai 1 - Gedung D4",
        description: "Ruangan yang digunakan untuk praktek sistem informasi"),
    Room(
        name: "Database",
        roomCode: "C 102",
        location: "Lantai 1 - Gedung D4",
        description: "Ruangan yang digunakan untuk praktek database"),
    Room(
        name: "Sistem Informasi Geografis (GIS)",
        roomCode: "C 201",
        location: "Lantai 2 - Gedung D4",
        description:
            "Ruangan yang digunakan untuk praktek sistem informasi geografis"),
  ];

  @override
  Widget build(BuildContext context) {
    return StackScreen(
      title: "Daftar Ruangan",
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 2.2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: rooms.length,
        itemBuilder: (BuildContext context, int index) => InkWell(
          child: Container(
            padding: const EdgeInsets.all(18),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  rooms[index].roomCode,
                  textAlign: TextAlign.center,
                  style: cInter.copyWith(
                    fontSize: 14,
                    fontWeight: bold,
                    color: cPrimaryBlack,
                  ),
                ),
                Text(
                  rooms[index].name,
                  textAlign: TextAlign.left,
                  softWrap: true,
                  style: cInter.copyWith(
                    overflow: TextOverflow.ellipsis,
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
          onTap: () {
            showModalBottom(
              rooms[index].roomCode,
              rooms[index].name,
              rooms[index].location,
              rooms[index].description,
            );
          },
        ),
        padding: const EdgeInsets.all(0),
        controller: ScrollController(
          keepScrollOffset: false,
        ),
        clipBehavior: Clip.none,
        shrinkWrap: true,
      ),
    );
  }

  showModalBottom(
    String roomCode,
    String name,
    String location,
    String description,
  ) {
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (builder) {
        return Container(
          height: 250.0,
          color: Colors.transparent,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(cRounded),
                topRight: Radius.circular(cRounded),
              ),
            ),
            child: Center(
              child: Stack(
                children: [
                  Positioned.fill(
                    top: 40,
                    left: 40,
                    child: Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name + " - " + roomCode,
                            style: cInter.copyWith(
                              fontWeight: bold,
                              fontSize: 18.0,
                              color: cPrimaryBlack,
                            ),
                          ),
                          Text(
                            location,
                            style: cInter.copyWith(
                              fontWeight: bold,
                              fontSize: 16.0,
                              color: cPrimaryBlue,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            description,
                            style: cInter.copyWith(
                              fontSize: 16.0,
                              color: cSubText,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(cPadding1),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(80.0),
                          gradient: const LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              Color(0xff145ae3),
                              Color(0xff15aeef),
                            ],
                          ),
                        ),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            fixedSize: const Size.fromWidth(150),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 45, vertical: 12),
                            primary: Colors.white,
                            textStyle: cInter.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () => Navigator.pop(context),
                          child: const Text("Tutup"),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
