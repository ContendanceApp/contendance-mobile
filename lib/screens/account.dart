import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconly/iconly.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skeleton_text/skeleton_text.dart';
import 'package:figma_squircle/figma_squircle.dart';

import '../constant/theme.dart';
import '../data/models/login_model.dart';
import '../services/login_service.dart';
import '../widgets/button.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  LoginService login = LoginService();
  UserInfo userInfo = UserInfo(
    userId: 0,
    fullname: "",
    email: "",
    sidEid: "",
    gender: "",
    roleId: 0,
    studyGroupId: 0,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    roles: Roles(
        roleId: 0,
        role: "",
        createdAt: DateTime.now(),
        updatedAt: DateTime.now()),
    studyGroups: StudyGroups(
      studyGroupId: 0,
      name: "",
      year: 0,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
  );

  @override
  void initState() {
    super.initState;

    getToken();
  }

  Future<void> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    if (token == null) {
      Get.offNamed("/login");
    } else {
      getUserInfo(token);
    }
  }

  getUserInfo(String token) async {
    var res = await login.loggedUser(token).then((value) => value);
    Map<dynamic, dynamic> result = jsonDecode(res.body);
    if (res.statusCode == 200) {
      UserInfo resBody = UserInfo.fromJson(result['data']);
      if (mounted) {
        setState(() {
          userInfo = resBody;
        });
      }
    } else {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      setState(() {
        preferences.remove("token");
      });
      Get.offNamed("/login");
    }
  }

  logOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.remove("token");
    });

    Get.offAllNamed(
      "/login",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      body: SingleChildScrollView(
        child: Stack(
          clipBehavior: Clip.none,
          children: <Widget>[
            Align(
              alignment: AlignmentDirectional.topCenter,
              child: Container(
                decoration: BoxDecoration(
                  gradient: colorGradient,
                ),
                height: 225,
                child: Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional.topStart,
                      child: InkWell(
                        child: Container(
                          margin: const EdgeInsets.only(left: 19.25, top: 50),
                          child: const Icon(
                            IconlyLight.arrow_left,
                            color: Colors.white,
                          ),
                        ),
                        onTap: () {
                          Get.back();
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          margin: const EdgeInsets.only(top: 50),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Akun",
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
                  minHeight: MediaQuery.of(context).size.height * 0.75),
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(top: 200),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 18),
                child: Container(
                  margin: const EdgeInsets.only(top: 70),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Column(
                          children: [
                            userInfo.fullname != ""
                                ? Text(
                                    userInfo.fullname,
                                    style: fontInter.copyWith(
                                      fontWeight: fwBold,
                                      fontSize: 18,
                                      color: colorPrimaryBlack,
                                    ),
                                  )
                                : SkeletonAnimation(
                                    borderRadius: BorderRadius.circular(8.0),
                                    shimmerColor: Colors.grey[100]!,
                                    child: Container(
                                      height: 25,
                                      width: MediaQuery.of(context).size.width *
                                          0.5,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        color: Colors.grey[200],
                                      ),
                                    ),
                                  ),
                            const SizedBox(
                              height: 2,
                            ),
                            userInfo.email != ""
                                ? Text(
                                    userInfo.email,
                                    style: fontInter.copyWith(
                                      fontWeight: fwMedium,
                                      fontSize: 16,
                                      color: colorSubText,
                                    ),
                                  )
                                : SkeletonAnimation(
                                    borderRadius: BorderRadius.circular(8.0),
                                    shimmerColor: Colors.grey[100]!,
                                    child: Container(
                                      margin: const EdgeInsets.only(top: 5),
                                      height: 15,
                                      width: MediaQuery.of(context).size.width *
                                          0.25,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        color: Colors.grey[200],
                                      ),
                                    ),
                                  ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: paddingBase),
                        child: Text(
                          "Menu",
                          style: fontInter.copyWith(
                            fontWeight: fwBold,
                            fontSize: 16,
                            color: colorPrimaryBlack,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: paddingBase,
                              vertical: 10,
                            ),
                            child: Row(
                              children: [
                                SvgPicture.asset("assets/images/profile.svg"),
                                const SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  "Detail Akun",
                                  style: fontInter.copyWith(
                                    fontWeight: fwMedium,
                                    fontSize: 16,
                                    color: colorPrimaryBlack,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            Get.toNamed("/account-detail");
                          },
                        ),
                      ),
                      // Material(
                      //   color: Colors.transparent,
                      //   child: InkWell(
                      //     child: Container(
                      //       padding: const EdgeInsets.symmetric(
                      //         horizontal: paddingBase,
                      //         vertical: 10,
                      //       ),
                      //       child: Row(
                      //         children: [
                      //           SvgPicture.asset("assets/images/document.svg"),
                      //           const SizedBox(
                      //             width: 15,
                      //           ),
                      //           Text(
                      //             "Privacy Policy",
                      //             style: fontInter.copyWith(
                      //               fontWeight: fwMedium,
                      //               fontSize: 16,
                      //               color: colorPrimaryBlack,
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //     onTap: () {
                      //       Navigator.pushNamed(context, "/privacy-policy");
                      //     },
                      //   ),
                      // ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: paddingBase,
                              vertical: 10,
                            ),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                    "assets/images/info-circle.svg"),
                                const SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  "Tentang Aplikasi",
                                  style: fontInter.copyWith(
                                    fontWeight: fwMedium,
                                    fontSize: 16,
                                    color: colorPrimaryBlack,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            Get.toNamed("/about-app");
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned.directional(
              textDirection: TextDirection.ltr,
              top: MediaQuery.of(context).size.height * 0.17,
              start: 0,
              end: 0,
              child: Align(
                child: Container(
                  height: MediaQuery.of(context).size.width * 0.3,
                  width: MediaQuery.of(context).size.width * 0.3,
                  decoration: ShapeDecoration(
                    image: const DecorationImage(
                      image: AssetImage(
                        'assets/images/user-thumbnail.png',
                      ),
                      fit: BoxFit.cover,
                    ),
                    color: colorSubWhite,
                    shape: SmoothRectangleBorder(
                      borderRadius: SmoothBorderRadius(
                        cornerRadius: 30,
                        cornerSmoothing: 1,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: paddingBase),
                child: Button(
                  text: "KELUAR DARI AKUN",
                  primary: false,
                  secondary: false,
                  custom: true,
                  backgroundColor: colorWhite,
                  borderColor: colorDanger,
                  fontColor: colorDanger,
                  callback: () {
                    showModalBottom();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  showModalBottom() {
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
                            "Keluar dari akun ini?",
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
                            "Anda masih dapat login kembali setelah keluar dari akun ini 😉",
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
                              text: "Batal",
                              callback: () => Get.back(),
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
                              text: "Keluar",
                              callback: () => logOut(),
                              primary: true,
                              secondary: false,
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
