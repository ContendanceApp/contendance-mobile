import 'package:contendance_app/constant/theme.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class RoomList extends StatefulWidget {
  const RoomList({Key? key}) : super(key: key);

  @override
  State<RoomList> createState() => _RoomListState();
}

class _RoomListState extends State<RoomList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        alignment: AlignmentDirectional.center,
        clipBehavior: Clip.none,
        children: <Widget>[
          Align(
            alignment: AlignmentDirectional.topCenter,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color(0xff145ae3),
                    Color(0xff15aeef),
                  ],
                ),
              ),
              height: 150,
              child: const SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.only(top: 50.0),
                  child: Text(
                    "Daftar Ruangan",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Positioned(
            top: 50,
            left: cPadding1,
            child: Icon(IconlyLight.arrow_left, color: Color(0xFFFFFFFF)),
          ),
          Container(
            margin: const EdgeInsets.only(top: 100),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: GridView.count(
                      clipBehavior: Clip.none,
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 2.2,
                      children: List.generate(
                        10,
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
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
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
                            showModalBottom();
                          },
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  showModalBottom() {
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
                            "Auditorium",
                            style: cInter.copyWith(
                              fontWeight: bold,
                              fontSize: 18.0,
                              color: cPrimaryBlack,
                            ),
                          ),
                          Text(
                            "Lantai 6 - Gedung Pascasarjana Pens",
                            style: cInter.copyWith(
                              fontWeight: bold,
                              fontSize: 14.0,
                              color: cPrimaryBlue,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Digunakan untuk Pertemua Orang Tua",
                            style: cInter.copyWith(
                              fontSize: 14.0,
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
                          child: const Text("OKE"),
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
