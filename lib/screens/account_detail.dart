import '../widgets/screen_wrapper/stack_screen.dart';
import '../constant/theme.dart';
import '../data/models/login.dart';
import '../services/login_service.dart';

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skeleton_text/skeleton_text.dart';

class AccountDetail extends StatefulWidget {
  const AccountDetail({Key? key}) : super(key: key);

  @override
  State<AccountDetail> createState() => _AccountDetailState();
}

class _AccountDetailState extends State<AccountDetail> {
  LoginService login = LoginService();
  String? _token;
  UserInfo userInfo = UserInfo(
    userId: 0,
    fullname: "",
    email: "",
    emailVerifiedAt: DateTime.now(),
    sidEid: 0,
    gender: "",
    roleId: 0,
    studyGroupId: 0,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    studyGroup: StudyGroup(
      studyGroupId: 0,
      name: "",
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
    setState(() {
      _token = token;
    });
    if (token == null) {
      Navigator.pushReplacementNamed(context, "/login");
    } else {
      getUserInfo();
    }
  }

  getUserInfo() async {
    var res = await login.loggedUser(_token!).then((value) => value);

    if (res.statusCode == 200) {
      UserInfo resBody = UserInfo.fromJson(jsonDecode(res.body));
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
      Navigator.pushReplacementNamed(context, "/login");
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
          userInfo.sidEid != 0
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
          userInfo.studyGroup != null
              ? userInfo.studyGroup?.name != ""
                  ? Text(
                      userInfo.studyGroup!.name,
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
