import 'package:contendance_app/services/classroom_services.dart';
import 'package:flutter/material.dart';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constant/theme.dart';
import '../widgets/button.dart';
import '../data/models/active_presence_model.dart';
import '../services/presence_service.dart';

class ActivePresence extends StatefulWidget {
  const ActivePresence(
      {Key? key, required this.activePresence, required this.roleId})
      : super(key: key);

  final ActivePresenceModel activePresence;
  final int roleId;

  @override
  State<ActivePresence> createState() => _ActiveClassState();
}

class _ActiveClassState extends State<ActivePresence> {
  PresenceService presence = PresenceService();
  ClassroomService classroomService = ClassroomService();

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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.activePresence.data.subjectsSchedules
                                .subjects.name,
                            textAlign: TextAlign.left,
                            style: fontInter.copyWith(
                              fontWeight: fwBold,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04,
                              color: colorPrimaryBlue,
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text(
                              "${widget.activePresence.data.rooms.name} - ${widget.activePresence.data.rooms.roomCode}",
                              textAlign: TextAlign.left,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: fontInter.copyWith(
                                fontSize: 14.0,
                                fontWeight: fwMedium,
                                color: colorSubText,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text(
                              "Waktu Pelaksanaan",
                              textAlign: TextAlign.left,
                              style: fontInter.copyWith(
                                fontSize: 14,
                                fontWeight: fwSemiBold,
                                color: colorSubText,
                              ),
                            ),
                          ),
                          FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text(
                              "${widget.activePresence.data.subjectsSchedules.startTime} - ${widget.activePresence.data.subjectsSchedules.finishTime}",
                              textAlign: TextAlign.left,
                              style: fontInter.copyWith(
                                fontSize: 14,
                                fontWeight: fwBold,
                                color: colorPrimaryBlack,
                              ),
                            ),
                          ),
                        ],
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
          Container(
            child: widget.roleId != 1
                ? Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Button(
                          paddingY: 14,
                          paddingX: 0,
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
                      ),
                      const SizedBox(
                        width: paddingBase,
                      ),
                      Expanded(
                        flex: 1,
                        child: Button(
                          paddingY: 14,
                          paddingX: 0,
                          text: "Lihat Kelas",
                          callback: () async {
                            try {
                              await classroomService
                                  .getDetailClass(
                                      widget.activePresence.data.presenceId)
                                  .then((value) => Get.toNamed('/detail-class',
                                      arguments: value));
                            } catch (e) {
                              Exception(e);
                            }
                          },
                          primary: false,
                          secondary: false,
                          custom: true,
                          backgroundColor: colorPrimaryBlue,
                          fontColor: colorWhite,
                          borderColor: colorPrimaryBlue,
                        ),
                      ),
                    ],
                  )
                : const SizedBox(),
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
                              ? FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Text(
                                    "Apakah anda yakin keluar kelas?",
                                    style: fontInter.copyWith(
                                      fontWeight: fwBold,
                                      fontSize: 18.0,
                                      color: colorPrimaryBlack,
                                    ),
                                  ),
                                )
                              : FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Text(
                                    "Apakah anda yakin ingin menutup presensi?",
                                    style: fontInter.copyWith(
                                      fontWeight: fwBold,
                                      fontSize: 18.0,
                                      color: colorPrimaryBlack,
                                    ),
                                  ),
                                ),
                          const SizedBox(
                            height: 20,
                          ),
                          FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text(
                              "Setelah menutup presensi, anda tidak dapat membuka kembali presensi ini",
                              style: fontInter.copyWith(
                                fontSize: 16.0,
                                color: colorSubText,
                              ),
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
                                  'presence_id': widget
                                      .activePresence.data.presenceId
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

                                presence.closePresence(body).then((value) {
                                  EasyLoading.dismiss();
                                  Navigator.pushNamedAndRemoveUntil(context,
                                      "/home", (Route<dynamic> route) => false);
                                }).catchError((e) {
                                  // ignore: avoid_print
                                  print(e);
                                });
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
