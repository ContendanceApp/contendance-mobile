import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:skeleton_text/skeleton_text.dart';

import '../constant/theme.dart';
import '../data/models/login_model.dart';
import '../services/login_service.dart';
import '../widgets/screen_wrapper/stack_screen.dart';

class AccountDetail extends StatefulWidget {
  const AccountDetail({Key? key}) : super(key: key);

  @override
  State<AccountDetail> createState() => _AccountDetailState();
}

class _AccountDetailState extends State<AccountDetail> {
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

  @override
  Widget build(BuildContext context) {
    return StackScreen(
      title: "Detail Akun",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Nama",
            style: fontInter.copyWith(
              fontWeight: fwBold,
              fontSize: 16,
              color: colorPrimaryBlack,
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          userInfo.fullname != ""
              ? Text(
                  userInfo.fullname,
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
                    height: 25,
                    width: MediaQuery.of(context).size.width * 0.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.grey[200],
                    ),
                  ),
                ),
          const SizedBox(
            height: paddingLg,
          ),
          Text(
            "NRP",
            style: fontInter.copyWith(
              fontWeight: fwBold,
              fontSize: 16,
              color: colorPrimaryBlack,
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          userInfo.sidEid != ""
              ? Text(
                  userInfo.sidEid.toString(),
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
                    height: 25,
                    width: MediaQuery.of(context).size.width * 0.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.grey[200],
                    ),
                  ),
                ),
          const SizedBox(
            height: paddingLg,
          ),
          Text(
            "Kelas",
            style: fontInter.copyWith(
              fontWeight: fwBold,
              fontSize: 16,
              color: colorPrimaryBlack,
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          userInfo.studyGroups != null
              ? userInfo.studyGroups?.name != ""
                  ? Text(
                      userInfo.studyGroups!.name,
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
                        height: 25,
                        width: MediaQuery.of(context).size.width * 0.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.grey[200],
                        ),
                      ),
                    )
              : Text(
                  "-",
                  style: fontInter.copyWith(
                    fontWeight: fwMedium,
                    fontSize: 16,
                    color: colorSubText,
                  ),
                ),
          const SizedBox(
            height: paddingLg,
          ),
          Text(
            "Email",
            style: fontInter.copyWith(
              fontWeight: fwBold,
              fontSize: 16,
              color: colorPrimaryBlack,
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
                    height: 25,
                    width: MediaQuery.of(context).size.width * 0.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.grey[200],
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
