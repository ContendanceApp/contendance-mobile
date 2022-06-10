import 'package:badges/badges.dart';
import 'package:contendance_app/constant/theme.dart';
import 'package:contendance_app/data/models/class_presence.dart';
import 'package:contendance_app/services/presence_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ActiveClass extends StatefulWidget {
  const ActiveClass({Key? key, required this.classPresence}) : super(key: key);

  final ClassPresence classPresence;

  @override
  State<ActiveClass> createState() => _ActiveClassState();
}

class _ActiveClassState extends State<ActiveClass> {
  PresenceService presence = PresenceService();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(cPadding1),
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
                            style: cInter.copyWith(
                              fontWeight: bold,
                              fontSize: 16.0,
                              color: cPrimaryBlue,
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
                            style: cInter.copyWith(
                              fontSize: 14.0,
                              fontWeight: medium,
                              color: cSubText,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "${widget.classPresence.subjectSchedule.startTime} - ${widget.classPresence.subjectSchedule.finishTime}",
                        textAlign: TextAlign.left,
                        style: cInter.copyWith(
                          fontSize: 14,
                          fontWeight: semibold,
                          color: cPrimaryBlack,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: cPadding2,
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: cDanger,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 0),
                      primary: cWhite,
                      textStyle: cInter.copyWith(
                        fontSize: 14,
                        fontWeight: bold,
                      ),
                    ),
                    onPressed: () {
                      showModalBottom(context);
                    },
                    child: const Text("Tutup Presensi"),
                  ),
                ),
              ),
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
              //         textStyle: cInter.copyWith(
              //           fontSize: 16,
              //           fontWeight: FontWeight.bold,
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
                topLeft: Radius.circular(cRounded),
                topRight: Radius.circular(cRounded),
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
                          Text(
                            "Apakah anda yakin menutup presensi?",
                            style: cInter.copyWith(
                              fontWeight: bold,
                              fontSize: 18.0,
                              color: cPrimaryBlack,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Setelah menutup presensi, anda tidak dapat membuka kembali presensi ini",
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(80.0),
                              color: Colors.white,
                              border: Border.all(color: cPrimaryBlue),
                            ),
                            child: TextButton(
                              style: TextButton.styleFrom(
                                fixedSize: const Size.fromWidth(150),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12),
                                primary: cPrimaryBlue,
                                textStyle: cInter.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onPressed: () => Navigator.pop(context),
                              child: const Text("Tidak, batal"),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(80.0),
                              color: cDanger,
                            ),
                            child: TextButton(
                              style: TextButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12),
                                fixedSize: const Size.fromWidth(150),
                                primary: Colors.white,
                                textStyle: cInter.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onPressed: () async {
                                Map<String, String> body = {
                                  'presence_id': widget.classPresence.presenceId
                                      .toString(),
                                };

                                Navigator.pop(context);
                                EasyLoading.instance
                                  ..indicatorWidget = SpinKitFoldingCube(
                                    color: cSecondaryBlue,
                                    size: 30.0,
                                  )
                                  ..contentPadding = const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 15)
                                  ..indicatorColor = cPrimaryBlue;
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
                              child: const Text(
                                "Ya, yakin",
                                textAlign: TextAlign.center,
                              ),
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
