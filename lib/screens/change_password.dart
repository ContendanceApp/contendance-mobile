import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/theme.dart';
import '../data/models/login_model.dart';
import '../services/login_service.dart';
import '../widgets/button.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool ishiddenPassword = true;
  bool _validateOldPassword = true;
  bool _validateNewPassword = true;
  bool _validateConfirmPassword = true;
  LoginService login = LoginService();
  final _formKey = GlobalKey<FormState>();
  bool isClicked = false;
  String newPassword = "";
  String confirmPassword = "";
  bool isEqual = true;

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "CONTENDANCE",
          style: fontInter.copyWith(
            color: colorPrimaryBlue,
            fontWeight: fwBold,
            fontSize: 14,
            letterSpacing: 1,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  "Ubah Password",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: fwBold,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(
                height: 44,
              ),
            ],
          ),
          Form(
            key: _formKey,
            child: Container(
              margin: const EdgeInsets.only(top: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    controller: oldPasswordController,
                    obscureText: ishiddenPassword,
                    decoration: InputDecoration(
                      labelText: 'Password Lama',
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFE0E0E0),
                          width: 1,
                        ),
                      ),
                      labelStyle: TextStyle(
                        fontWeight: fwSemiBold,
                        color: colorSubText,
                      ),
                      errorText: _validateOldPassword
                          ? null
                          : "Password lama tidak boleh kosong!",
                      focusColor: colorPrimaryBlue,
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: Color(0xFF1482E9),
                        ),
                      ),
                      errorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: Color(0xFFD10404),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 32, bottom: 48),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          obscureText: ishiddenPassword,
                          scrollPadding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          controller: newPasswordController,
                          decoration: InputDecoration(
                            labelText: 'Masukkan Password Baru',
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFE0E0E0),
                                width: 1,
                              ),
                            ),
                            labelStyle: TextStyle(
                              fontWeight: fwSemiBold,
                              color: colorSubText,
                            ),
                            errorText: _validateNewPassword
                                ? null
                                : "Password baru tidak boleh kosong!",
                            focusColor: colorPrimaryBlue,
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2,
                                color: Color(0xFF1482E9),
                              ),
                            ),
                            errorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2,
                                color: Color(0xFFD10404),
                              ),
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              newPassword = value;
                            });
                            checkNewPassword();
                          },
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          obscureText: ishiddenPassword,
                          controller: confirmPasswordController,
                          scrollPadding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          decoration: InputDecoration(
                            labelText: 'Konfirmasi Password Baru',
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFE0E0E0),
                                width: 1,
                              ),
                            ),
                            labelStyle: TextStyle(
                              fontWeight: fwSemiBold,
                              color: colorSubText,
                            ),
                            errorText: _validateConfirmPassword
                                ? null
                                : "Password konfirmasi tidak boleh kosong!",
                            focusColor: colorPrimaryBlue,
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2,
                                color: Color(0xFF1482E9),
                              ),
                            ),
                            errorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2,
                                color: Color(0xFFD10404),
                              ),
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              confirmPassword = value;
                            });
                            checkNewPassword();
                          },
                        ),
                        const SizedBox(height: 8),
                        isEqual
                            ? const SizedBox()
                            : Text(
                                "Password tidak cocok!",
                                style: fontInter.copyWith(
                                  fontWeight: fwMedium,
                                  fontSize: 14,
                                  color: Colors.red,
                                ),
                              )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Button(
                      text: "Ubah Password",
                      callback: () async {
                        oldPasswordController.text.isEmpty
                            ? setState(() {
                                _validateOldPassword = false;
                              })
                            : setState(() {
                                _validateOldPassword = true;
                              });
                        newPasswordController.text.isEmpty
                            ? setState(() {
                                _validateNewPassword = false;
                              })
                            : setState(() {
                                _validateNewPassword = true;
                              });
                        confirmPasswordController.text.isEmpty
                            ? setState(() {
                                _validateConfirmPassword = false;
                              })
                            : setState(() {
                                _validateConfirmPassword = true;
                              });

                        if (_validateOldPassword &&
                            _validateNewPassword &&
                            _validateConfirmPassword &&
                            isEqual) {
                          setState(() {
                            isClicked = true;
                          });
                          _formKey.currentState!.save();
                          Map<String, String> body = {
                            'old_password': oldPasswordController.text,
                            'new_password': newPasswordController.text,
                          };

                          login.changePassword(body).then((response) => {
                                handleResponse(response),
                              });
                        }
                      },
                      primary: true,
                      secondary: false,
                      withChild: !isClicked
                          ? Text(
                              'Ubah Password',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: fwBold,
                                color: Colors.white,
                              ),
                            )
                          : SizedBox(
                              width: 15,
                              height: 15,
                              child: CircularProgressIndicator(
                                strokeWidth: 3,
                                color: colorWhite,
                              ),
                            ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  checkNewPassword() {
    if (newPassword != "" && confirmPassword != "") {
      if (newPassword == confirmPassword) {
        setState(() {
          isEqual = true;
        });
      } else {
        setState(() {
          isEqual = false;
        });
      }
    }
  }

  Future<void> handleResponse(http.Response response) async {
    String message = jsonDecode(response.body)['message'];
    if (response.statusCode == 200) {
      setState(() {
        isClicked = false;
      });
      Get.offNamed("/account");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Colors.green,
          duration: const Duration(seconds: 3),
        ),
      );
    } else {
      setState(() {
        isClicked = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }
}
