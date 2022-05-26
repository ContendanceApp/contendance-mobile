import 'package:contendance_app/components/presence_history_card.dart';
import 'package:contendance_app/constant/string.dart';
import 'package:contendance_app/constant/theme.dart';
import 'package:contendance_app/data/models/presence_history.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class PresenceHistoryScreen extends StatefulWidget {
  const PresenceHistoryScreen({Key? key}) : super(key: key);

  @override
  State<PresenceHistoryScreen> createState() => _PresenceHistoryStateScreen();
}

class _PresenceHistoryStateScreen extends State<PresenceHistoryScreen> {
  String? selectedDay;
  String? selectedMonth;
  String? selectedYear;

  List histories = [
    PresenceHistory(
      subject: "Workshop Pemrograman Perangkat Lunak",
      acronym: "WPPL",
      lab: "Lab C-120",
      presenceTime: "11.02",
    ),
    PresenceHistory(
      subject: "Workshop Pemrograman Perangkat Bergerak",
      acronym: "WPPB",
      lab: "Lab C-120",
      presenceTime: "11.02",
    ),
    PresenceHistory(
      subject: "Workshop Administrasi dan Manajemen Jaringan",
      acronym: "WPPL",
      lab: "Lab C-120",
      presenceTime: "11.02",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SingleChildScrollView(
        child: Stack(
          // alignment: AlignmentDirectional.center,
          clipBehavior: Clip.none,
          children: <Widget>[
            Align(
              alignment: AlignmentDirectional.topCenter,
              child: Container(
                height: 140,
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
                child: Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: InkWell(
                        child: Container(
                          margin: const EdgeInsets.only(left: 19.25),
                          child: const Icon(
                            IconlyLight.arrow_left,
                            color: Colors.white,
                          ),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
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
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
              ),
              margin: const EdgeInsets.only(top: 120),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.white,
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
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
                                    fontSize: 16,
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
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                                value: selectedDay,
                                onChanged: (value) {
                                  setState(() {
                                    selectedDay = value as String;
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
                                      fontSize: 16,
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
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                  value: selectedMonth,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedMonth = value as String;
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
                                    fontSize: 16,
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
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                                value: selectedYear,
                                onChanged: (value) {
                                  setState(() {
                                    selectedYear = value as String;
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
                      padding: const EdgeInsets.only(top: 40, bottom: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hari Ini', //need improve
                            style: cInter.copyWith(
                              fontWeight: bold,
                              fontSize: 24,
                              color: cPrimaryBlack,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'Selasa, 24 Maret 2022', //need improve
                            style: cInter.copyWith(
                              fontWeight: medium,
                              fontSize: 15,
                              color: cSubText,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      child: Column(
                        children: histories
                            .map((history) =>
                                PresenceHistoryCard(history: history))
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}