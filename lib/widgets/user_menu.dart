import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constant/theme.dart';

class UserMenu extends StatelessWidget {
  const UserMenu({Key? key, required this.role}) : super(key: key);

  final String role;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.symmetric(vertical: 24),
      controller: ScrollController(
        keepScrollOffset: false,
      ),
      clipBehavior: Clip.none,
      shrinkWrap: true,
      crossAxisCount: role == "dosen" ? 3 : 3,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      childAspectRatio: role == "dosen" ? 1 : 1,
      children: role == "dosen"
          ? ([
              cardMenuStudent(
                context: context,
                icon: SvgPicture.asset(
                  "assets/images/calendar.svg",
                  width: 35,
                ),
                text: "Jadwal \nMata Kuliah",
                onTap: () {
                  Navigator.pushNamed(context, "/subject-schedule");
                },
              ),
              cardMenuStudent(
                context: context,
                icon: SvgPicture.asset(
                  "assets/images/category.svg",
                  width: 35,
                ),
                text: "Daftar \nRuangan",
                onTap: () {
                  Navigator.pushNamed(context, "/room-list");
                },
              ),
              cardMenuStudent(
                context: context,
                icon: SvgPicture.asset(
                  "assets/images/bookmark-minus.svg",
                  width: 35,
                ),
                text: "Riwayat \nPresensi",
                onTap: () {
                  Navigator.pushNamed(context, "/presence-history");
                },
              ),
            ]
              // [
              //   cardMenuLecturer(
              //     context: context,
              //     icon: SvgPicture.asset(
              //       "assets/images/calendar.svg",
              //       width: 35,
              //     ),
              //     text: "Jadwal \nMata Kuliah",
              //     onTap: () {
              //       Navigator.pushNamed(context, "/subject-schedule");
              //     },
              //   ),
              //   cardMenuLecturer(
              //     context: context,
              //     icon: SvgPicture.asset(
              //       "assets/images/category.svg",
              //       width: 35,
              //     ),
              //     text: "Daftar \nRuangan",
              //     onTap: () {
              //       Navigator.pushNamed(context, "/room-list");
              //     },
              //   ),
              //   cardMenuLecturer(
              //     context: context,
              //     icon: SvgPicture.asset(
              //       "assets/images/bookmark-minus.svg",
              //       width: 35,
              //     ),
              //     text: "Riwayat \nPresensi",
              //     onTap: () {
              //       Navigator.pushNamed(context, "/presence-history");
              //     },
              //   ),
              //   // cardMenuLecturer(
              //   //   context: context,
              //   //   icon: SvgPicture.asset(
              //   //     "assets/images/swap.svg",
              //   //     width: 35,
              //   //   ),
              //   //   text: "Jadwal \nPengganti",
              //   //   onTap: () {
              //   //     Navigator.pushNamed(context, "/change-schedule");
              //   //   },
              //   // ),
              // ]
              )
          : ([
              cardMenuStudent(
                context: context,
                icon: SvgPicture.asset(
                  "assets/images/calendar.svg",
                  width: 35,
                ),
                text: "Jadwal \nMata Kuliah",
                onTap: () {
                  Navigator.pushNamed(context, "/subject-schedule");
                },
              ),
              cardMenuStudent(
                context: context,
                icon: SvgPicture.asset(
                  "assets/images/category.svg",
                  width: 35,
                ),
                text: "Daftar \nRuangan",
                onTap: () {
                  Navigator.pushNamed(context, "/room-list");
                },
              ),
              cardMenuStudent(
                context: context,
                icon: SvgPicture.asset(
                  "assets/images/bookmark-minus.svg",
                  width: 35,
                ),
                text: "Riwayat \nPresensi",
                onTap: () {
                  Navigator.pushNamed(context, "/presence-history");
                },
              ),
            ]),
    );
  }

  Widget cardMenuLecturer({
    required BuildContext context,
    required Widget icon,
    required String text,
    required GestureTapCallback onTap,
  }) {
    return InkWell(
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon,
            const SizedBox(width: 10),
            Text(
              text,
              textAlign: TextAlign.start,
              style: fontInter.copyWith(
                fontSize: 14,
                fontWeight: fwBold,
                color: colorPrimaryBlack,
              ),
            ),
          ],
        ),
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
      ),
      onTap: onTap,
    );
  }

  Widget cardMenuStudent({
    required BuildContext context,
    required Widget icon,
    required String text,
    required GestureTapCallback onTap,
  }) {
    return InkWell(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            icon,
            const SizedBox(height: 8),
            Text(
              text,
              textAlign: TextAlign.center,
              style: fontInter.copyWith(
                fontSize: 14,
                fontWeight: fwBold,
                color: colorPrimaryBlack,
              ),
            ),
          ],
        ),
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
      ),
      onTap: onTap,
    );
  }
}
