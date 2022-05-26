import 'package:contendance_app/constant/string.dart';
import 'package:contendance_app/constant/theme.dart';
import 'package:contendance_app/screens/search_class.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:awesome_dropdown/awesome_dropdown.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:badges/badges.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class HistoryPresence extends StatefulWidget {
  const HistoryPresence({Key? key}) : super(key: key);

  @override
  State<HistoryPresence> createState() => _HistoryPresenceState();
}

class _HistoryPresenceState extends State<HistoryPresence> {
  String? selectedValueDay;
  String? selectedValueMonth;
  String? selectedValueYear;

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
              height: 119,
              child: Stack(
                children: [
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Container(
                      margin: const EdgeInsets.only(left: 19.25),
                      child: const Icon(
                        IconlyLight.arrow_left,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Riwayat Presensi',
                              //textAlign: TextAlign.center,
                              style: cInter.copyWith(
                                fontWeight: bold,
                                fontSize: 16,
                                color: cWhite,
                              ),
                            ),
                            const SizedBox(height: 2),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 100),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
              child: Column(
                //------dsd
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Cari Berdasarkan Tanggal",
                    textAlign: TextAlign.left,
                    style: cInter.copyWith(
                      fontSize: 14,
                      fontWeight: bold,
                      color: cPrimaryBlack,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2(
                              dropdownMaxHeight: 300,
                              hint: Text(
                                'Tgl',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: medium,
                                  color: cSubText,
                                ),
                              ),
                              items: day
                                  .map(
                                    (item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(
                                        item,
                                        style: const TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                              value: selectedValueDay,
                              onChanged: (value) {
                                setState(() {
                                  selectedValueDay = value as String;
                                });
                              },
                              icon: const Icon(IconlyLight.arrow_down_2),
                              buttonWidth: 140,
                              itemHeight: 40,
                              buttonElevation: 10,
                              buttonPadding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 6),
                              buttonDecoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color(0xFFF4F4F4),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xFF000000)
                                        .withOpacity(0.05),
                                    blurRadius: 10,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton2(
                                dropdownMaxHeight: 300,
                                hint: Text(
                                  'Bulan',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: medium,
                                    color: cSubText,
                                  ),
                                ),
                                items: month
                                    .map(
                                      (item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(
                                          item,
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                                value: selectedValueMonth,
                                onChanged: (value) {
                                  setState(() {
                                    selectedValueMonth = value as String;
                                  });
                                },
                                icon: const Icon(IconlyLight.arrow_down_2),
                                buttonWidth: 140,
                                itemHeight: 40,
                                buttonElevation: 10,
                                buttonPadding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 6),
                                buttonDecoration: BoxDecoration(
                                  border: Border.all(
                                    color: const Color(0xFFF4F4F4),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0xFF000000)
                                          .withOpacity(0.05),
                                      blurRadius: 10,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2(
                              dropdownMaxHeight: 300,
                              hint: Text(
                                'Tahun',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: medium,
                                  color: cSubText,
                                ),
                              ),
                              items: year
                                  .map(
                                    (item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(
                                        item,
                                        style: const TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                              value: selectedValueYear,
                              onChanged: (value) {
                                setState(() {
                                  selectedValueYear = value as String;
                                });
                              },
                              icon: const Icon(IconlyLight.arrow_down_2),
                              buttonWidth: 140,
                              itemHeight: 40,
                              buttonElevation: 10,
                              buttonPadding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 6),
                              buttonDecoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color(0xFFF4F4F4),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xFF000000)
                                        .withOpacity(0.05),
                                    blurRadius: 10,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 40, bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hari Ini', //need improve
                          style: cInter.copyWith(
                            fontWeight: bold,
                            fontSize: 20,
                            color: cPrimaryBlack,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'Selasa, 24 Maret 2022', //need improve
                          style: cInter.copyWith(
                            fontWeight: medium,
                            fontSize: 14,
                            color: cSubText,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 490,
                    child: ListView(
                      children: [
                        InkWell(
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            width: double.infinity,
                            height: 114,
                            padding: const EdgeInsets.all(18),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 71,
                                  width: 71,
                                  margin: const EdgeInsets.only(right: 8),
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        "WPPL",
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
                                    color: const Color(0xFF15AEEF)
                                        .withOpacity(0.15),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15)),
                                    // border: Border.all(
                                    //     color: const Color(0xFFF4F4F4),
                                    //     width: 1.0,
                                    //     style: BorderStyle.solid),
                                    // boxShadow: [
                                    //   BoxShadow(
                                    //     color: Colors.black.withOpacity(0.05),
                                    //     spreadRadius: 2,
                                    //     blurRadius: 10,
                                    //   )
                                    // ],
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.all(3),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Text(
                                          'Workshop Pemrograman Perangkat Lunak',
                                          style: cInter.copyWith(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: cSubText,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Lab C-102',
                                              style: cInter.copyWith(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700,
                                                color: cPrimaryBlue,
                                              ),
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                  'Presensi Pukul',
                                                  style: cInter.copyWith(
                                                    color: cPrimaryBlack,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                Text(
                                                  '11.20',
                                                  style: cInter.copyWith(
                                                    color: cPrimaryBlue,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
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
                                    style: BorderStyle.solid),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.05),
                                    spreadRadius: 2,
                                    blurRadius: 10,
                                  )
                                ]),
                          ),
                          // onTap: () {
                          //   Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //         builder: (context) => const SearchClass(),
                          //       ));
                          // },
                        ),
                        InkWell(
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            width: double.infinity,
                            height: 114,
                            padding: const EdgeInsets.all(18),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 71,
                                  width: 71,
                                  margin: const EdgeInsets.only(right: 8),
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        "WPPB",
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
                                    color: const Color(0xFF15AEEF)
                                        .withOpacity(0.15),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15)),
                                    // border: Border.all(
                                    //     color: const Color(0xFFF4F4F4),
                                    //     width: 1.0,
                                    //     style: BorderStyle.solid),
                                    // boxShadow: [
                                    //   BoxShadow(
                                    //     color: Colors.black.withOpacity(0.05),
                                    //     spreadRadius: 2,
                                    //     blurRadius: 10,
                                    //   )
                                    // ],
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.all(3),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Text(
                                          'Workshop Pemrograman Perangkat Bergerak',
                                          style: cInter.copyWith(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: cSubText,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Lab C-102',
                                              style: cInter.copyWith(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700,
                                                color: cPrimaryBlue,
                                              ),
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                  'Presensi Pukul',
                                                  style: cInter.copyWith(
                                                    color: cPrimaryBlack,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                Text(
                                                  '11.20',
                                                  style: cInter.copyWith(
                                                    color: cPrimaryBlue,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
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
                                    style: BorderStyle.solid),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.05),
                                    spreadRadius: 2,
                                    blurRadius: 10,
                                  )
                                ]),
                          ),
                          // onTap: () {
                          //   Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //         builder: (context) => const SearchClass(),
                          //       ));
                          // },
                        ),
                        InkWell(
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            width: double.infinity,
                            height: 114,
                            padding: const EdgeInsets.all(18),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 71,
                                  width: 71,
                                  margin: const EdgeInsets.only(right: 8),
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        "DPP",
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
                                    color: const Color(0xFF15AEEF)
                                        .withOpacity(0.15),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15)),
                                    // border: Border.all(
                                    //     color: const Color(0xFFF4F4F4),
                                    //     width: 1.0,
                                    //     style: BorderStyle.solid),
                                    // boxShadow: [
                                    //   BoxShadow(
                                    //     color: Colors.black.withOpacity(0.05),
                                    //     spreadRadius: 2,
                                    //     blurRadius: 10,
                                    //   )
                                    // ],
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.all(3),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Text(
                                          'Desain Pengalaman Pengguna',
                                          style: cInter.copyWith(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: cSubText,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Lab C-102',
                                              style: cInter.copyWith(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700,
                                                color: cPrimaryBlue,
                                              ),
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                  'Presensi Pukul',
                                                  style: cInter.copyWith(
                                                    color: cPrimaryBlack,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                Text(
                                                  '11.20',
                                                  style: cInter.copyWith(
                                                    color: cPrimaryBlue,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
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
                                    style: BorderStyle.solid),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.05),
                                    spreadRadius: 2,
                                    blurRadius: 10,
                                  )
                                ]),
                          ),
                          // onTap: () {
                          //   Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //         builder: (context) => const SearchClass(),
                          //       ));
                          // },
                        ),
                        InkWell(
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            width: double.infinity,
                            height: 114,
                            padding: const EdgeInsets.all(18),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 71,
                                  width: 71,
                                  margin: const EdgeInsets.only(right: 8),
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        "M4",
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
                                    color: const Color(0xFF15AEEF)
                                        .withOpacity(0.15),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15)),
                                    // border: Border.all(
                                    //     color: const Color(0xFFF4F4F4),
                                    //     width: 1.0,
                                    //     style: BorderStyle.solid),
                                    // boxShadow: [
                                    //   BoxShadow(
                                    //     color: Colors.black.withOpacity(0.05),
                                    //     spreadRadius: 2,
                                    //     blurRadius: 10,
                                    //   )
                                    // ],
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.all(3),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Text(
                                          'Matematika 4',
                                          style: cInter.copyWith(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: cSubText,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Lab C-102',
                                              style: cInter.copyWith(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700,
                                                color: cPrimaryBlue,
                                              ),
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                  'Presensi Pukul',
                                                  style: cInter.copyWith(
                                                    color: cPrimaryBlack,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                Text(
                                                  '11.20',
                                                  style: cInter.copyWith(
                                                    color: cPrimaryBlue,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
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
                                    style: BorderStyle.solid),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.05),
                                    spreadRadius: 2,
                                    blurRadius: 10,
                                  )
                                ]),
                          ),
                          // onTap: () {
                          //   Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //         builder: (context) => const SearchClass(),
                          //       ));
                          // },
                        ),
                        InkWell(
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            width: double.infinity,
                            height: 114,
                            padding: const EdgeInsets.all(18),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 71,
                                  width: 71,
                                  margin: const EdgeInsets.only(right: 8),
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        "WAMJ",
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
                                    color: const Color(0xFF15AEEF)
                                        .withOpacity(0.15),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15)),
                                    // border: Border.all(
                                    //     color: const Color(0xFFF4F4F4),
                                    //     width: 1.0,
                                    //     style: BorderStyle.solid),
                                    // boxShadow: [
                                    //   BoxShadow(
                                    //     color: Colors.black.withOpacity(0.05),
                                    //     spreadRadius: 2,
                                    //     blurRadius: 10,
                                    //   )
                                    // ],
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.all(3),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Text(
                                          'Workshop Administrasi & Manajemen Jaringan',
                                          style: cInter.copyWith(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: cSubText,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Lab C-102',
                                              style: cInter.copyWith(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700,
                                                color: cPrimaryBlue,
                                              ),
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                  'Presensi Pukul',
                                                  style: cInter.copyWith(
                                                    color: cPrimaryBlack,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                Text(
                                                  '11.20',
                                                  style: cInter.copyWith(
                                                    color: cPrimaryBlue,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
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
                                    style: BorderStyle.solid),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.05),
                                    spreadRadius: 2,
                                    blurRadius: 10,
                                  )
                                ]),
                          ),
                          // onTap: () {
                          //   Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //         builder: (context) => const SearchClass(),
                          //       ));
                          // },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // showModalBottom() {
  //   return showModalBottomSheet(
  //     backgroundColor: Colors.transparent,
  //     context: context,
  //     builder: (builder) {
  //       return Container(
  //         height: 250.0,
  //         color: Colors.transparent, //could change this to Color(0xFF737373),
  //         //so you don't have to change MaterialApp canvasColor
  //         child: Container(
  //           decoration: const BoxDecoration(
  //               color: Colors.white,
  //               borderRadius: BorderRadius.only(
  //                   topLeft: Radius.circular(cRounded),
  //                   topRight: Radius.circular(cRounded))),
  //           child: Center(
  //             child: Stack(
  //               children: [
  //                 Positioned.fill(
  //                   top: -40,
  //                   child: Align(
  //                     alignment: AlignmentDirectional.center,
  //                     child: Text(
  //                       "Fitur ini akan segera tersedia!",
  //                       style: cInter.copyWith(
  //                         fontWeight: bold,
  //                         fontSize: 18.0,
  //                         color: cPrimaryBlack,
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //                 Align(
  //                   alignment: AlignmentDirectional.bottomCenter,
  //                   child: Padding(
  //                     padding: const EdgeInsets.all(cPadding1),
  //                     child: Container(
  //                       decoration: BoxDecoration(
  //                         borderRadius: BorderRadius.circular(cRounded),
  //                         gradient: const LinearGradient(
  //                           begin: Alignment.topRight,
  //                           end: Alignment.bottomLeft,
  //                           colors: [
  //                             Color(0xff145ae3),
  //                             Color(0xff15aeef),
  //                           ],
  //                         ),
  //                       ),
  //                       child: TextButton(
  //                         style: TextButton.styleFrom(
  //                           minimumSize: const Size.fromHeight(0),
  //                           padding: const EdgeInsets.symmetric(
  //                               horizontal: 45, vertical: 12),
  //                           primary: Colors.white,
  //                           textStyle: cInter.copyWith(
  //                             fontSize: 16,
  //                             fontWeight: FontWeight.bold,
  //                           ),
  //                         ),
  //                         onPressed: () => Navigator.pop(context),
  //                         child: const Text("OKE!"),
  //                       ),
  //                     ),
  //                   ),
  //                 )
  //               ],
  //             ),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }
}
