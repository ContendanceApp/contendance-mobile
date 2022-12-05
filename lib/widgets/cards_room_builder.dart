import 'package:flutter/material.dart';

import '../constant/theme.dart';
import '../data/models/room_model.dart';
import '../widgets/button.dart';

class CardsRoomBuilder extends StatefulWidget {
  const CardsRoomBuilder({Key? key}) : super(key: key);

  @override
  State<CardsRoomBuilder> createState() => _CardsRoomBuilderState();
}

class _CardsRoomBuilderState extends State<CardsRoomBuilder> {
  List rooms = [
    RoomModel(
        name: "Jaringan Komputer",
        roomCode: "C 305",
        location: "Lantai 3 - Gedung D4",
        description: "Ruangan yang digunakan untuk praktek jaringan komputer"),
    RoomModel(
        name: "Komputer Vision (CV)",
        roomCode: "C 306",
        location: "Lantai 3 - Gedung D4",
        description: "Ruangan yang digunakan untuk praktek pengolohan citra"),
    RoomModel(
        name: "Sistem Informasi (SI)",
        roomCode: "C 101",
        location: "Lantai 1 - Gedung D4",
        description: "Ruangan yang digunakan untuk praktek sistem informasi"),
    RoomModel(
        name: "Database",
        roomCode: "C 102",
        location: "Lantai 1 - Gedung D4",
        description: "Ruangan yang digunakan untuk praktek database"),
    RoomModel(
        name: "Sistem Informasi Geografis (GIS)",
        roomCode: "C 201",
        location: "Lantai 2 - Gedung D4",
        description:
            "Ruangan yang digunakan untuk praktek sistem informasi geografis"),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
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
                style: fontInter.copyWith(
                  fontSize: 14,
                  fontWeight: fwBold,
                  color: colorPrimaryBlack,
                ),
              ),
              Text(
                rooms[index].name,
                textAlign: TextAlign.left,
                softWrap: true,
                style: fontInter.copyWith(
                  overflow: TextOverflow.ellipsis,
                  fontSize: 14,
                  fontWeight: fwBold,
                  color: colorPrimaryBlue,
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
                topLeft: Radius.circular(roundedBase),
                topRight: Radius.circular(roundedBase),
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
                            style: fontInter.copyWith(
                              fontWeight: fwBold,
                              fontSize: 18.0,
                              color: colorPrimaryBlack,
                            ),
                          ),
                          Text(
                            location,
                            style: fontInter.copyWith(
                              fontWeight: fwBold,
                              fontSize: 16.0,
                              color: colorPrimaryBlue,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            description,
                            style: fontInter.copyWith(
                              fontSize: 16.0,
                              color: colorSubText,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(paddingBase),
                      child: Button(
                        text: "Tutup",
                        primary: true,
                        secondary: false,
                        callback: () {
                          Navigator.pop(context);
                        },
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
