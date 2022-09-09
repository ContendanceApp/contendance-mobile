import '../widgets/button.dart';
import '../widgets/cards_room_builder.dart';
import '../constant/theme.dart';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:date_format/date_format.dart';
import 'package:iconly/iconly.dart';

class ChangeScheduleScreen extends StatefulWidget {
  const ChangeScheduleScreen({Key? key}) : super(key: key);

  @override
  State<ChangeScheduleScreen> createState() => _ChangeScheduleScreenState();
}

class _ChangeScheduleScreenState extends State<ChangeScheduleScreen> {
  get child => null;
  String? pickedDate = '';
  String? pickedStart = '';
  String? pickedEnd = '';
  String? selectedSubject;
  List<String> subjects = [
    "Workshop Pemrograman Perangkat Lunak",
    "Kecerdasan Komputasional",
    "Desain Pengalaman Pengguna",
    "Workshop Administrasi Jaringan",
    "Bahasa Inggris 2",
    "Matematika 4"
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
                decoration: BoxDecoration(
                  gradient: colorGradient,
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
                                "Jadwal Pengganti",
                                //textAlign: TextAlign.center,
                                style: fontInter.copyWith(
                                  fontWeight: fwBold,
                                  fontSize: 16,
                                  color: colorWhite,
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
                minWidth: MediaQuery.of(context).size.width,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Pilih Mata Kuliah",
                      textAlign: TextAlign.left,
                      style: fontInter.copyWith(
                        fontSize: 14,
                        fontWeight: fwBold,
                        color: colorPrimaryBlack,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          dropdownMaxHeight: 300,
                          hint: Text(
                            'Matakuliah',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: fwMedium,
                              color: colorSubText,
                            ),
                          ),
                          items: subjects
                              .map(
                                (item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: colorPrimaryBlue,
                                      fontWeight: fwMedium,
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          value: selectedSubject,
                          onChanged: (value) {
                            setState(() {
                              selectedSubject = value as String;
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
                                color:
                                    const Color(0xFF000000).withOpacity(0.05),
                                blurRadius: 10,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: paddingLg,
                    ),
                    Text(
                      "Pilih Tanggal",
                      textAlign: TextAlign.left,
                      style: fontInter.copyWith(
                        fontSize: 14,
                        fontWeight: fwBold,
                        color: colorPrimaryBlack,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    clickableBox(
                      child: TextButton(
                        child: Text(
                          pickedDate == ''
                              ? 'Pilih tanggal untuk mengganti kelas'
                              : pickedDate!,
                          style: TextStyle(
                            color: pickedDate == ''
                                ? colorSubText
                                : colorPrimaryBlue,
                            fontWeight: fwMedium,
                            fontSize: 16,
                          ),
                        ),
                        onPressed: () {
                          DatePicker.showDatePicker(context,
                              showTitleActions: true,
                              minTime: DateTime(2022, 3, 5),
                              maxTime: DateTime(2030, 6, 7),
                              onChanged: (date) {}, onConfirm: (date) {
                            String? pickedDay =
                                date.toString().substring(8, 11);
                            String? pickedMonth =
                                date.toString().substring(5, 7);
                            String? pickedYear =
                                date.toString().substring(0, 4);
                            setState(() {
                              pickedDate = formatDate(
                                  DateTime(
                                      int.parse(pickedYear),
                                      int.parse(pickedMonth),
                                      int.parse(pickedDay)),
                                  [d, ' ', MM, ' ', yyyy]);
                            });
                          },
                              currentTime: DateTime.now(),
                              locale: LocaleType.id);
                        },
                      ),
                    ),
                    const SizedBox(
                      height: paddingLg,
                    ),
                    Text(
                      "Pilih Jam",
                      textAlign: TextAlign.left,
                      style: fontInter.copyWith(
                        fontSize: 14,
                        fontWeight: fwBold,
                        color: colorPrimaryBlack,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              clickableBox(
                                child: TextButton(
                                  onPressed: () {
                                    DatePicker.showTimePicker(context,
                                        showTitleActions: true,
                                        onConfirm: (time) {
                                      String? pickedSchedule =
                                          time.toString().substring(11, 16);
                                      setState(() {
                                        pickedStart = pickedSchedule;
                                      });
                                    }, currentTime: DateTime.now());
                                  },
                                  child: Text(
                                    pickedStart == '' ? 'Mulai' : pickedStart!,
                                    style: TextStyle(
                                      color: pickedStart == ''
                                          ? colorSubText
                                          : colorPrimaryBlue,
                                      fontWeight: fwMedium,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: SizedBox(
                            width: 20,
                            child: Divider(
                              thickness: 2,
                              color: colorSubText.withOpacity(0.5),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              clickableBox(
                                child: TextButton(
                                  onPressed: () {
                                    DatePicker.showTimePicker(context,
                                        showTitleActions: true,
                                        onConfirm: (time) {
                                      String? pickedSchedule =
                                          time.toString().substring(11, 16);
                                      setState(() {
                                        pickedEnd = pickedSchedule;
                                      });
                                    }, currentTime: DateTime.now());
                                  },
                                  child: Text(
                                    pickedEnd == '' ? 'Selesai' : pickedEnd!,
                                    style: TextStyle(
                                      color: pickedEnd == ''
                                          ? colorSubText
                                          : colorPrimaryBlue,
                                      fontWeight: fwMedium,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: paddingLg,
                    ),
                    Text(
                      "Pilih Lab/Ruangan",
                      textAlign: TextAlign.left,
                      style: fontInter.copyWith(
                        fontSize: 14,
                        fontWeight: fwBold,
                        color: colorPrimaryBlack,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const CardsRoomBuilder(),
                    const SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Button(
                        text: "Tetapkan Jadwal",
                        callback: () {},
                        primary: true,
                        secondary: false,
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

  Widget clickableBox({required Widget child}) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(10),
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
      child: SizedBox(
        child: child,
      ),
    );
  }
}
