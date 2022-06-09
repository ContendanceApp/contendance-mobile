import 'package:contendance_app/components/stack_screen.dart';
import 'package:contendance_app/constant/theme.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';

class DetailClass extends StatefulWidget {
  const DetailClass({Key? key}) : super(key: key);

  @override
  State<DetailClass> createState() => _DetailClassState();
}

class _DetailClassState extends State<DetailClass> {
  // static const kelas = 'Dalam Kelas';
  @override
  Widget build(BuildContext context) {
    return StackScreen(
      title: "C 102",
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  // Badge(
                  //   badgeContent: Text(
                  //       "Dalam Kelas",
                  //           style: const TextStyle(
                  //               color:  Colors.white
                  //           ),
                  //   ),
                  //     badgeColor: Colors.blue,
                  //     position: BadgePosition.topEnd(),
                  //
                  // ),

                  Row(
                    children: [
                      // Container(
                      //   child: ClipRRect(
                      //     borderRadius: BorderRadius.circular(10),
                      //     child: Image.asset(
                      //       'assets/images/lab-pens.jpg',
                      //       height: 110,
                      //       width: 110,
                      //       fit: BoxFit.fitHeight,
                      //     ),
                      //   ),
                      // ),
                      Badge(
                        toAnimate: false,
                        shape: BadgeShape.square,
                        elevation: 0,
                        badgeColor: const Color(0xFF145AE3),
                        borderRadius: BorderRadius.circular(50),
                        position: BadgePosition.topEnd(),
                        badgeContent: const Text(
                          "Dalam Kelas",
                          style: TextStyle(color: Colors.white),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'assets/images/lab-pens.jpg',
                            height: 110,
                            width: 110,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 18,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text(
                            "C-102",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: "Inter",
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF145AE3),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const <Widget>[
                              SizedBox(
                                width: 200,
                                child: Text(
                                  "Workshop Pemrograman Perangkat Lunak",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontFamily: "Inter",
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF64749F),
                                    height: 1.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          // SizedBox(
                          //   height: 15,
                          // ),
                          Text(
                            "08:00 - 13.00",
                            textAlign: TextAlign.left,
                            style: cInter.copyWith(
                              fontSize: 14,
                              fontWeight: bold,
                              color: cPrimaryBlack,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              InkWell(
                child: Container(
                  margin: const EdgeInsets.only(bottom: 40, top: 27),
                  width: double.infinity,
                  height: 100,
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: [
                          Text(
                            "Ruang Tunggu",
                            textAlign: TextAlign.left,
                            style: cInter.copyWith(
                              fontSize: 16,
                              fontWeight: bold,
                              color: const Color(0xFF333333),
                            ),
                          ),
                          const SizedBox(
                            width: 180,
                          ),
                          Text(
                            "Lihat Semua",
                            textAlign: TextAlign.right,
                            style: cInter.copyWith(
                              fontWeight: medium,
                              fontSize: 14,
                              color: cPrimaryBlue,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "Kosong",
                        textAlign: TextAlign.left,
                        style: cInter.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: cSubText,
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: <Color>[
                          Color(0xf145ae3),
                          Color(0xf15aeef),
                        ],
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      border: Border.all(
                          color: const Color(0xFFF4F4F4),
                          width: 1.0,
                          style: BorderStyle.solid),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          spreadRadius: 2,
                          blurRadius: 10,
                        )
                      ]),
                ),
              ),
              ListView(
                shrinkWrap: true,
                controller: ScrollController(
                  keepScrollOffset: false,
                ),
                padding: const EdgeInsets.all(0),
                children: [
                  Text(
                    "Mahasiswa dalam Kelas",
                    textAlign: TextAlign.left,
                    style: cInter.copyWith(
                      fontSize: 14,
                      fontWeight: bold,
                      color: const Color(0xFF333333),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const SizedBox(
                        width: 200,
                        child: Text(
                          "Ainul Muhlasin ",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF64749F),
                            height: 1.5,
                          ),
                        ),
                      ),
                      TextButton(
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 0),
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all(cDanger),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Terima",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const <Widget>[
                      SizedBox(
                        width: 200,
                        child: Text(
                          "3120600029",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF145AE3),
                            height: 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
