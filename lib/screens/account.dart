import 'dart:convert';

import 'package:contendance_app/components/bottom_app_bar/bottom_app_bar.dart';
import 'package:contendance_app/components/bottom_app_bar/floating_action_button.dart';
import 'package:contendance_app/constant/theme.dart';
import 'package:contendance_app/data/models/login.dart';
import 'package:contendance_app/services/login_service.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skeleton_text/skeleton_text.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
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

  logOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.remove("token");
    });

    Navigator.pushNamedAndRemoveUntil(
      context,
      "/login",
      (route) => false,
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
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color(0xff145ae3),
                      Color(0xff15aeef),
                    ],
                  ),
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
                          Navigator.pop(context);
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
                                style: cInter.copyWith(
                                  fontWeight: bold,
                                  fontSize: 16,
                                  color: cWhite,
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                child: Container(
                  margin: const EdgeInsets.only(top: 70),
                  child: Column(
                    children: [
                      userInfo.fullname != ""
                          ? Text(
                              userInfo.fullname,
                              style: cInter.copyWith(
                                fontWeight: bold,
                                fontSize: 18,
                                color: cPrimaryBlack,
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
                        height: 2,
                      ),
                      userInfo.email != ""
                          ? Text(
                              userInfo.email,
                              style: cInter.copyWith(
                                fontWeight: medium,
                                fontSize: 16,
                                color: cSubText,
                              ),
                            )
                          : SkeletonAnimation(
                              borderRadius: BorderRadius.circular(8.0),
                              shimmerColor: Colors.grey[100]!,
                              child: Container(
                                margin: const EdgeInsets.only(top: 5),
                                height: 15,
                                width: MediaQuery.of(context).size.width * 0.25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  color: Colors.grey[200],
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned.directional(
              textDirection: TextDirection.ltr,
              top: 150,
              start: 0,
              end: 0,
              child: Align(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.asset(
                    'assets/images/lab-pens.jpg',
                    width: 125,
                    height: 125,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: ElevatedButton(
                  onPressed: () {
                    showModalBottom();
                    // logOut();
                  },
                  child: Text(
                    "KELUAR DARI AKUN",
                    style: cInter.copyWith(
                      fontWeight: semibold,
                      color: cDanger,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.transparent),
                    elevation: MaterialStateProperty.all(0),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    side: MaterialStateProperty.all(
                      BorderSide(
                        width: 1.5,
                        color: cDanger,
                      ),
                    ),
                    minimumSize: MaterialStateProperty.all(
                      Size.fromHeight(50),
                    ),
                  ),
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
                            "Keluar dari akun ini?",
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
                            "Anda masih dapat login kembali setelah keluar dari akun ini 😉",
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
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 45, vertical: 12),
                                primary: cPrimaryBlue,
                                textStyle: cInter.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onPressed: () => Navigator.pop(context),
                              child: const Text("Batal"),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(80.0),
                              gradient: const LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [
                                  Color(0xff145ae3),
                                  Color(0xff15aeef),
                                ],
                              ),
                            ),
                            child: TextButton(
                              style: TextButton.styleFrom(
                                fixedSize: const Size.fromWidth(150),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 45, vertical: 12),
                                primary: Colors.white,
                                textStyle: cInter.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onPressed: () => logOut(),
                              child: const Text("Keluar"),
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
