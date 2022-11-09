import 'package:flutter/material.dart';

import 'package:badges/badges.dart';
import 'package:get/get.dart';

import '../../../data/models/detail_class_model.dart';
import '../../../services/classroom_services.dart';
import '../../../widgets/user_item_list.dart';
import '../../../constant/theme.dart';
import '../../../widgets/screen_wrapper/stack_screen.dart';
import '../controllers/detail_class_controller.dart';

class DetailClass extends StatelessWidget {
  final DetailClassController controller = Get.find();
  ClassroomService classroomService = ClassroomService();
  late Future<DetailClassModel> detailClassData;

  final DetailClassModel args = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        (args.data.presenceId);
        return Future<void>.delayed(const Duration(seconds: 2));
      },
      child: StackScreen(
        title: args.data.rooms.roomCode,
        child: Column(
          children: [
            const SizedBox(height: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Badge(
                            toAnimate: false,
                            shape: BadgeShape.square,
                            elevation: 0,
                            badgeColor: const Color(0xFF145AE3),
                            borderRadius: BorderRadius.circular(50),
                            position: BadgePosition.topEnd(),
                            badgeContent: Text(
                              "Dalam Kelas",
                              style: fontInter.copyWith(
                                color: colorWhite,
                                fontWeight: fwSemiBold,
                                fontSize: 12,
                              ),
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
                        ),
                        const SizedBox(
                          width: 18,
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                args.data.subjectsSchedules.subjects.name,
                                style: TextStyle(
                                  fontFamily: "Inter",
                                  fontSize: 16.0,
                                  fontWeight: fwBold,
                                  color: colorPrimaryBlue,
                                ),
                              ),
                              Text(
                                "${args.data.rooms.name} - ${args.data.rooms.roomCode}",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  overflow: TextOverflow.clip,
                                  fontFamily: "Inter",
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                  color: colorSubText,
                                  height: 1.5,
                                ),
                              ),
                              const SizedBox(height: 15),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Waktu Pelaksanaan",
                                    textAlign: TextAlign.left,
                                    style: fontInter.copyWith(
                                      fontSize: 14,
                                      fontWeight: fwSemiBold,
                                      color: colorSubText,
                                    ),
                                  ),
                                  Text(
                                    "${args.data.subjectsSchedules.startTime} - ${args.data.subjectsSchedules.finishTime}",
                                    textAlign: TextAlign.left,
                                    style: fontInter.copyWith(
                                      fontSize: 14,
                                      fontWeight: fwBold,
                                      color: colorPrimaryBlack,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                // InkWell(
                //   child: Container(
                //     margin: const EdgeInsets.only(bottom: 40, top: 27),
                //     width: double.infinity,
                //     height: 100,
                //     padding: const EdgeInsets.all(16),
                //     child: Column(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: <Widget>[
                //         Row(
                //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //           children: [
                //             Text(
                //               "Ruang Tunggu",
                //               textAlign: TextAlign.left,
                //               style: fontInter.copyWith(
                //                 fontSize: 16,
                //                 fontWeight: fwBold,
                //                 color: colorPrimaryBlack,
                //               ),
                //             ),
                //             Text(
                //               "Lihat Semua",
                //               textAlign: TextAlign.right,
                //               style: fontInter.copyWith(
                //                 fontWeight: fwSemiBold,
                //                 fontSize: 14,
                //                 color: colorPrimaryBlue,
                //               ),
                //             ),
                //           ],
                //         ),
                //         Text(
                //           "Kosong",
                //           textAlign: TextAlign.left,
                //           style: fontInter.copyWith(
                //             fontSize: 16,
                //             fontWeight: fwMedium,
                //             color: colorSubText,
                //           ),
                //         ),
                //       ],
                //     ),
                //     decoration: BoxDecoration(
                //       color: const Color(0xFFFFFFFF),
                //       borderRadius: const BorderRadius.all(Radius.circular(15)),
                //       border: Border.all(
                //           color: const Color(0xFFE2E2E2),
                //           width: 1.0,
                //           style: BorderStyle.solid),
                //     ),
                //   ),
                // ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  "Mahasiswa dalam Kelas",
                  textAlign: TextAlign.left,
                  style: fontInter.copyWith(
                    fontSize: 14,
                    fontWeight: fwBold,
                    color: const Color(0xFF333333),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                FutureBuilder(
                  future: detailClassData,
                  builder: (context, AsyncSnapshot<DetailClassModel> snapshot) {
                    var state = snapshot.connectionState;
                    if (state != ConnectionState.done) {
                      return Container(
                        margin: const EdgeInsets.only(top: 24),
                        child: Column(
                          children: [
                            Center(
                              child: CircularProgressIndicator(
                                color: colorPrimaryBlue,
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Text(
                              "Memuat data...",
                              style: fontInter.copyWith(
                                fontWeight: fwSemiBold,
                                color: colorSubText,
                              ),
                            )
                          ],
                        ),
                      );
                    } else {
                      if (snapshot.hasData) {
                        return ListView(
                          shrinkWrap: true,
                          padding: const EdgeInsets.only(top: 0),
                          controller: ScrollController(
                            keepScrollOffset: false,
                          ),
                          children: snapshot.data!.data.users.isNotEmpty
                              ? snapshot.data!.data.users
                                  .map((user) => UserItemList(
                                        user: user,
                                      ))
                                  .toList()
                              : [
                                  Center(
                                      child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 36),
                                    child: Text(
                                      "Belum ada mahasiswa",
                                      style: fontInter.copyWith(
                                          fontSize: 20,
                                          fontWeight: fwSemiBold,
                                          color: colorSubText),
                                    ),
                                  ))
                                ],
                        );
                      } else if (snapshot.hasError) {
                        return Center(child: Text(snapshot.error.toString()));
                      } else {
                        return const Text('');
                      }
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
