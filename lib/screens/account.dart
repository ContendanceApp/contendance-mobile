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
      setState(() {
        userInfo = resBody;
      });
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
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    margin: const EdgeInsets.only(top: 50),
                    alignment: AlignmentDirectional.topCenter,
                    child: Text(
                      "Akun",
                      //textAlign: TextAlign.center,
                      style: cInter.copyWith(
                        fontWeight: bold,
                        fontSize: 16,
                        color: cWhite,
                      ),
                    ),
                  ),
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
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                      const SizedBox(
                        height: 100,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          logOut();
                        },
                        child: Text(
                          "KELUAR DARI AKUN",
                          style: cInter.copyWith(
                            fontWeight: semibold,
                            color: const Color(0xFFE3145F),
                          ),
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                          elevation: MaterialStateProperty.all(0),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          side: MaterialStateProperty.all(
                            const BorderSide(
                              width: 1.5,
                              color: Color(0xFFE3145F),
                            ),
                          ),
                          minimumSize: MaterialStateProperty.all(
                            Size.fromHeight(50),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 20),
                        constraints: const BoxConstraints(
                            minWidth: 88.0,
                            minHeight: 36.0), // min sizes for Material buttons
                        alignment: Alignment.center,
                        child: const Text(
                          'LOGIN',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
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
          ],
        ),
      ),
      floatingActionButton: const FloatingActionButtonComp(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const BottomAppBarComp(),
    );
  }
}
