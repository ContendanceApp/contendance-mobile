import 'package:contendance_app/services/classroom_services.dart';
import 'package:get/get.dart';

import '../services/presence_service.dart';
import '../utils/helpers/response_helper.dart';
import '../widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../data/models/detail_class_model.dart';
import '../constant/theme.dart';

class UserItemList extends StatefulWidget {
  const UserItemList({
    Key? key,
    required this.user,
    required this.detailClass,
  }) : super(key: key);

  final User user;
  final DetailClassModel detailClass;

  @override
  State<UserItemList> createState() => _UserItemListState();
}

class _UserItemListState extends State<UserItemList> {
  PresenceService presence = PresenceService();
  ClassroomService classroomService = ClassroomService();
  late Future<DetailClassModel> detailClassData;

  getDetailClassData(int presenceId) async {
    try {
      detailClassData = classroomService.getDetailClass(presenceId);
    } catch (e) {
      if (mounted) {
        // ignore: avoid_print
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.user.users.fullname,
                  textAlign: TextAlign.left,
                  style: fontInter.copyWith(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    color: colorSubText,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  widget.user.users.sidEid,
                  textAlign: TextAlign.left,
                  style: fontInter.copyWith(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                    color: colorPrimaryBlue,
                  ),
                ),
              ],
            ),
            Button(
              text: "Hapus",
              callback: () {
                confirmRemoveParticipant(context);
              },
              primary: false,
              secondary: false,
              custom: true,
              paddingY: 6,
              paddingX: 8,
              customFontSize: 12,
              fontColor: colorWhite,
              backgroundColor: colorDanger,
              borderColor: colorDanger,
            )
          ],
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }

  confirmRemoveParticipant(BuildContext context) {
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
                          Text(
                            "Hapus Peserta Ini?",
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
                            "Setelah dihapus, presensi peserta ini akan hilang dari daftar presensi.",
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: paddingBase),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Button(
                              text: "Batal",
                              callback: () => Navigator.pop(context),
                              primary: false,
                              secondary: true,
                            ),
                          ),
                          const SizedBox(
                            width: paddingBase,
                          ),
                          Expanded(
                            flex: 1,
                            child: Button(
                              text: "Hapus",
                              callback: () async {
                                // await Get.offAllNamed("/detail-class", arguments: value);
                                Map<String, String> body = {
                                  'presence_detail_id':
                                      widget.user.presenceDetailId.toString(),
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
                                  status: 'Menghapus Partisipan...',
                                  dismissOnTap: false,
                                  maskType: EasyLoadingMaskType.clear,
                                );

                                await presence
                                    .removeParticipant(body)
                                    .then((value) {
                                  EasyLoading.dismiss();
                                  // setState(() {});
                                  getDetailClassData(
                                      widget.detailClass.data.presenceId);
                                  detailClassData.then(
                                    (value) => Get.toNamed("/detail-class",
                                        arguments: value),
                                  );
                                  handleResponse(value, context);
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
