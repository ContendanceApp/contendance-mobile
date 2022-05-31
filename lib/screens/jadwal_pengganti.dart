import 'package:flutter/material.dart';
import 'package:contendance_app/constant/theme.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:date_format/date_format.dart';

import 'package:iconly/iconly.dart';

class JadwalPengganti extends StatefulWidget {
  const JadwalPengganti({Key? key}) : super(key: key);

  @override
  State<JadwalPengganti> createState() => _JadwalPenggantiState();
}

class _JadwalPenggantiState extends State<JadwalPengganti> {
  get child => null;
  String? pickedDate = '';

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
                          //borderRadius: BorderRadius.circular(24.0),
                          color: Colors.white,
                          border: Border.all(color: cSubText),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: SizedBox(
                          child: TextButton(
                            child: Text(
                              pickedDate == ''
                                  ? 'Pilih tanggal untuk mengganti kelas'
                                  : pickedDate!,
                              style: TextStyle(color: Colors.blue),
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
                                  ;
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
                                Text(
                                  "Mulai",
                                  textAlign: TextAlign.left,
                                  style: cInter.copyWith(
                                    fontSize: 12,
                                    color: cPrimaryBlack,
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 42.0,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: cSubText),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: SizedBox(
                                    child: TextButton(
                                      onPressed: () {
                                        DatePicker.showTimePicker(context,
                                            showTitleActions: true,
                                            onChanged: (date) {
                                          print('change $date in time zone ' +
                                              date.timeZoneOffset.inHours
                                                  .toString());
                                        }, onConfirm: (date) {
                                          print('confirm $date');
                                        }, currentTime: DateTime.now());
                                      },
                                      child: const Text(
                                        'Mulai',
                                        style: TextStyle(color: Colors.blue),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 25,
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Selesai",
                                  textAlign: TextAlign.left,
                                  style: cInter.copyWith(
                                    fontSize: 12,
                                    color: cPrimaryBlack,
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 42.0,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: cSubText),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: SizedBox(
                                    child: TextButton(
                                      onPressed: () {
                                        DatePicker.showTimePicker(context,
                                            showTitleActions: true,
                                            onChanged: (date) {
                                          print('change $date in time zone ' +
                                              date.timeZoneOffset.inHours
                                                  .toString());
                                        }, onConfirm: (date) {
                                          print('confirm $date');
                                        }, currentTime: DateTime.now());
                                      },
                                      child: const Text(
                                        'Selesai',
                                        style: TextStyle(color: Colors.blue),
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
