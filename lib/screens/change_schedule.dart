import 'package:flutter/material.dart';
import 'package:contendance_app/constant/theme.dart';
import 'package:dropdown_search/dropdown_search.dart';
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
                                "Jadwal Pengganti",
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
                      style: cInter.copyWith(
                        fontSize: 14,
                        fontWeight: bold,
                        color: cPrimaryBlack,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      child: DropdownSearch<String>(
                        popupProps: const PopupProps.menu(
                          showSelectedItems: true,
                          //disabledItemFn: (String s) => s.startsWith('I'),
                        ),
                        items: const [
                          "Workshop Pemrograman Perangkat Lunak",
                          "Kecerdasan Komputasional",
                          "Desain Pengalaman Pengguna",
                          "Workshop Administrasi Jaringan",
                          "Bahasa Inggris 2",
                          "Matematika 4"
                        ],
                        onChanged: print,
                        //selectedItem: "Brazil",
                      ),
                    ),
                    Text(
                      "Pilih Tanggal",
                      textAlign: TextAlign.left,
                      style: cInter.copyWith(
                        fontSize: 14,
                        fontWeight: bold,
                        color: cPrimaryBlack,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      child: Container(
                        width: 350.0,
                        height: 42.0,
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
                        child: SizedBox(
                          child: TextButton(
                            child: Text(
                              pickedDate == ''
                                  ? 'Pilih tanggal untuk mengganti kelas'
                                  : pickedDate!,
                              style: const TextStyle(color: Colors.blue),
                            ),
                            onPressed: () {
                              DatePicker.showDatePicker(context,
                                  showTitleActions: true,
                                  minTime: DateTime(2022, 3, 5),
                                  maxTime: DateTime(2030, 6, 7),
                                  onChanged: (date) {
                                print('change $date');
                              }, onConfirm: (date) {
                                print('confirm $date');
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
                      ),
                    ),
                    Text(
                      "Pilih Jam",
                      textAlign: TextAlign.left,
                      style: cInter.copyWith(
                        fontSize: 14,
                        fontWeight: bold,
                        color: cPrimaryBlack,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 42.0,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFFFFFFF),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15)),
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
                                        pickedStart == ''
                                            ? 'Mulai'
                                            : pickedStart!,
                                        style:
                                            const TextStyle(color: Colors.blue),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: SizedBox(
                              width: 25,
                              child: Text("-"),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 42.0,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFFFFFFF),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15)),
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
                                        pickedEnd == ''
                                            ? 'Selesai'
                                            : pickedEnd!,
                                        style:
                                            const TextStyle(color: Colors.blue),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "Pilih Mata Kuliah",
                      textAlign: TextAlign.left,
                      style: cInter.copyWith(
                        fontSize: 14,
                        fontWeight: bold,
                        color: cPrimaryBlack,
                      ),
                    ),
                    GridView.count(
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
                        8,
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
                          onTap: () {},
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: ElevatedButton(
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.all(0.0)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(80.0),
                              ),
                            ),
                          ),
                          child: Ink(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color(0xff145ae3),
                                  Color(0xff15aeef),
                                ],
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(80.0)),
                            ),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 45, vertical: 12),
                              constraints: const BoxConstraints(
                                  minWidth: 88.0,
                                  minHeight:
                                      36.0), // min sizes for Material buttons
                              alignment: Alignment.center,
                              child: const Text(
                                'Tetapkan Jadwal',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          onPressed: () {}),
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

class CustomPicker extends CommonPickerModel {
  String digits(int value, int length) {
    return '$value'.padLeft(length, "0");
  }

  CustomPicker({DateTime? currentTime, LocaleType? locale})
      : super(locale: locale) {
    this.currentTime = currentTime ?? DateTime.now();
    setLeftIndex(this.currentTime.hour);
    setMiddleIndex(this.currentTime.minute);
    setRightIndex(this.currentTime.second);
  }

  @override
  String? leftStringAtIndex(int index) {
    if (index >= 0 && index < 24) {
      return digits(index, 2);
    } else {
      return null;
    }
  }

  @override
  String? middleStringAtIndex(int index) {
    if (index >= 0 && index < 60) {
      return digits(index, 2);
    } else {
      return null;
    }
  }

  @override
  String? rightStringAtIndex(int index) {
    if (index >= 0 && index < 60) {
      return digits(index, 2);
    } else {
      return null;
    }
  }

  @override
  String leftDivider() {
    return "|";
  }

  @override
  String rightDivider() {
    return "|";
  }

  @override
  List<int> layoutProportions() {
    return [1, 2, 1];
  }

  @override
  DateTime finalTime() {
    return currentTime.isUtc
        ? DateTime.utc(currentTime.year, currentTime.month, currentTime.day,
            currentLeftIndex(), currentMiddleIndex(), currentRightIndex())
        : DateTime(currentTime.year, currentTime.month, currentTime.day,
            currentLeftIndex(), currentMiddleIndex(), currentRightIndex());
  }
}
