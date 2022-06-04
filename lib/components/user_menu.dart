import 'package:contendance_app/constant/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserMenu extends StatelessWidget {
  const UserMenu({Key? key, required this.role}) : super(key: key);

  final String role;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.symmetric(vertical: 24),
      controller: ScrollController(
        keepScrollOffset: false,
      ),
      clipBehavior: Clip.none,
      shrinkWrap: true,
      crossAxisCount: role == "dosen" ? 2 : 3,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      childAspectRatio: role == "dosen" ? 2 : 1,
      children: role == "dosen"
          ? ([
              InkWell(
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SvgPicture.asset(
                        "assets/images/calendar.svg",
                        width: 35,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "Jadwal \nMata Kuliah",
                        textAlign: TextAlign.start,
                        style: cInter.copyWith(
                          fontSize: 14,
                          fontWeight: bold,
                          color: cPrimaryBlack,
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
                onTap: () {
                  Navigator.pushNamed(context, "/subject-schedule");
                },
              ),
              // InkWell(
              //   child: Container(
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       crossAxisAlignment: CrossAxisAlignment.center,
              //       children: <Widget>[
              //         SvgPicture.asset(
              //           "assets/images/swap.svg",
              //           width: 35,
              //         ),
              //         const SizedBox(width: 10),
              //         Text(
              //           "Jadwal \nPengganti",
              //           textAlign: TextAlign.start,
              //           style: cInter.copyWith(
              //             fontSize: 14,
              //             fontWeight: bold,
              //             color: cPrimaryBlack,
              //           ),
              //         ),
              //       ],
              //     ),
              //     decoration: BoxDecoration(
              //         color: const Color(0xFFFFFFFF),
              //         borderRadius: const BorderRadius.all(Radius.circular(15)),
              //         border: Border.all(
              //             color: const Color(0xFFF4F4F4),
              //             width: 1.0,
              //             style: BorderStyle.solid),
              //         boxShadow: [
              //           BoxShadow(
              //             color: Colors.black.withOpacity(0.05),
              //             spreadRadius: 2,
              //             blurRadius: 10,
              //           )
              //         ]),
              //   ),
              //   onTap: () {
              //     Navigator.pushNamed(context, "/change-schedule");
              //   },
              // ),
              InkWell(
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SvgPicture.asset(
                        "assets/images/category.svg",
                        width: 35,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "Daftar \nRuangan",
                        textAlign: TextAlign.start,
                        style: cInter.copyWith(
                          fontSize: 14,
                          fontWeight: bold,
                          color: cPrimaryBlack,
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
                onTap: () {
                  Navigator.pushNamed(context, "/room-list");
                },
              ),
              InkWell(
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SvgPicture.asset(
                        "assets/images/bookmark-minus.svg",
                        width: 35,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "Riwayat \nPresensi",
                        textAlign: TextAlign.start,
                        style: cInter.copyWith(
                          fontSize: 14,
                          fontWeight: bold,
                          color: cPrimaryBlack,
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
                onTap: () {
                  Navigator.pushNamed(context, "/presence-history");
                },
              ),
            ])
          : ([
              InkWell(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SvgPicture.asset(
                        "assets/images/calendar.svg",
                        width: 35,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Jadwal \nMata Kuliah",
                        textAlign: TextAlign.center,
                        style: cInter.copyWith(
                          fontSize: 14,
                          fontWeight: bold,
                          color: cPrimaryBlack,
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
                onTap: () {
                  Navigator.pushNamed(context, "/subject-schedule");
                },
              ),
              InkWell(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SvgPicture.asset(
                        "assets/images/category.svg",
                        width: 35,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Daftar \nRuangan",
                        textAlign: TextAlign.center,
                        style: cInter.copyWith(
                          fontSize: 14,
                          fontWeight: bold,
                          color: cPrimaryBlack,
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
                onTap: () {
                  Navigator.pushNamed(context, "/room-list");
                },
              ),
              InkWell(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SvgPicture.asset(
                        "assets/images/bookmark-minus.svg",
                        width: 35,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Riwayat \nPresensi",
                        textAlign: TextAlign.center,
                        style: cInter.copyWith(
                          fontSize: 14,
                          fontWeight: bold,
                          color: cPrimaryBlack,
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
                onTap: () {
                  Navigator.pushNamed(context, "/presence-history");
                },
              ),
            ]),
    );
  }
}
