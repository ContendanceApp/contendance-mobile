import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/button.dart';
import '../constant/theme.dart';
import '../data/models/class_presence_model.dart';
import '../services/presence_service.dart';

class ActiveClass extends StatefulWidget {
  const ActiveClass(
      {Key? key, required this.classPresence, required this.roleId})
      : super(key: key);

  final ClassPresenceModel classPresence;
  final int roleId;

  @override
  State<ActiveClass> createState() => _ActiveClassState();
}

class _ActiveClassState extends State<ActiveClass> {
  PresenceService presence = PresenceService();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(paddingBase),
      decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          borderRadius: const BorderRadius.all(Radius.circular(15)),
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
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/images/lab-pens.jpg',
                    height: 110,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                flex: 2,
                child: SizedBox(
                  height: 110,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.classPresence.room.roomCode,
                            textAlign: TextAlign.left,
                            style: fontInter.copyWith(
                              fontWeight: fwBold,
                              fontSize: 16.0,
                              color: colorPrimaryBlue,
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            widget.classPresence.subjectSchedule.subject.name,
                            textAlign: TextAlign.left,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: fontInter.copyWith(
                              fontSize: 14.0,
                              fontWeight: fwMedium,
                              color: colorSubText,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "${widget.classPresence.subjectSchedule.startTime} - ${widget.classPresence.subjectSchedule.finishTime}",
                        textAlign: TextAlign.left,
                        style: fontInter.copyWith(
                          fontSize: 14,
                          fontWeight: fwSemifwBold,
                          color: colorPrimaryBlack,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: widget.roleId != 1 ? paddingLg : 0,
          ),
          Row(
            children: [
              widget.roleId != 1
                  ? Expanded(
                      flex: 1,
                      child: Button(
                        text: "Tutup Presensi",
                        callback: () async {
                          final prefs = await SharedPreferences.getInstance();
                          await prefs.remove('classStatus');
                          showModalBottom(context);
                        },
                        primary: false,
                        secondary: false,
                        custom: true,
                        backgroundColor: colorDanger,
                        fontColor: colorWhite,
                        borderColor: colorDanger,
                      ),
                    )
                  : const SizedBox(),
              // const SizedBox(
              //   width: 24,
              // ),
              // Expanded(
              //   flex: 1,
              //   child: Container(
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(50),
              //       gradient: const LinearGradient(
              //         begin: Alignment.topRight,
              //         end: Alignment.bottomLeft,
              //         colors: [
              //           Color(0xff15aeef),
              //           Color(0xff145ae3),
              //         ],
              //       ),
              //     ),
              //     child: TextButton(
              //       style: TextButton.styleFrom(
              //         padding: const EdgeInsets.symmetric(vertical: 12),
              //         primary: Colors.white,
              //         textStyle: fontInter.copyWith(
              //           fontSize: 16,
              //           fontWeight: FontWeight.fwBold,
              //         ),
              //       ),
              //       onPressed: () {},
              //       child: const Text(
              //         "Buka Presensi",
              //         softWrap: false,
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }

  showModalBottom(BuildContext context) {
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
                  Padding(
                    padding: const EdgeInsets.all(40),
                    child: Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          widget.roleId == 1
                              ? Text(
                                  "Apakah anda yakin keluar kelas?",
                                  style: fontInter.copyWith(
                                    fontWeight: fwBold,
                                    fontSize: 18.0,
                                    color: colorPrimaryBlack,
                                  ),
                                )
                              : Text(
                                  "Apakah anda yakin menutup presensi?",
                                  style: fontInter.copyWith(
                                    fontWeight: fwBold,
                                    fontSize: 18.0,
                                    color: colorPrimaryBlack,
                                  ),
                                ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            widget.roleId == 1
                                ? "Kelas anda belum selesai, anda tidak dapat masuk kembali ke kelas ini"
                                : "Setelah menutup presensi, anda tidak dapat membuka kembali presensi ini",
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Button(
                              text: "Tidak, batal",
                              callback: () => Navigator.pop(context),
                              primary: false,
                              secondary: true,
                            ),
                          ),
                          const SizedBox(
                            width: paddingLg,
                          ),
                          Expanded(
                            flex: 1,
                            child: Button(
                              text: "Ya, yakin",
                              callback: () async {
                                Map<String, String> body = {
                                  'presence_id': widget.classPresence.presenceId
                                      .toString(),
                                };

                                Navigator.pop(context);
                                EasyLoading.instance
                                  ..indicatorWidget = SpinKitFoldingCube(
                                    color: colorSecondaryBlue,
                                    size: 30.0,
                                  )
                                  ..contentPadding = const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 15)
                                  ..indicatorColor = colorPrimaryBlue;
                                EasyLoading.show(
                                    status: 'Loading...',
                                    dismissOnTap: false,
                                    maskType: EasyLoadingMaskType.clear);

                                try {
                                  await presence
                                      .closePresence(body)
                                      .then((value) {
                                    print(value);
                                    EasyLoading.dismiss();
                                    Navigator.pushNamedAndRemoveUntil(
                                        context,
                                        "/home",
                                        (Route<dynamic> route) => false);
                                  });
                                } catch (e) {
                                  print(e);
                                }
                              },
                              primary: false,
                              secondary: false,
                              custom: true,
                              backgroundColor: colorDanger,
                              fontColor: colorWhite,
                              borderColor: colorDanger,
                            ),
                          ),
                        ],
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
