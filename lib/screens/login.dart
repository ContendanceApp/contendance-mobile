import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../constant/theme.dart';
import '../data/models/login_model.dart';
import '../services/login_service.dart';
import '../widgets/button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  LoginService login = LoginService();
  List<String> emailOptions = <String>[];
  String email = "";
  bool ishiddenPassword = true;
  bool _validateEmail = true;
  bool _validatePassword = true;
  bool isClicked = false;
  bool containsAt = false;
  bool containsDot = false;

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
    getEmailSuggestions();
  }

  Future<void> getToken() async {
    final prefs = await SharedPreferences.getInstance();

    if (prefs.getString('token') != null) {
      Get.offNamed("/home");
    }
  }

  void getEmailSuggestions() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.getStringList('emailSuggestions') != null
        ? emailOptions = prefs.getStringList('emailSuggestions')!
        : emailOptions = [];
  }

  List<String> autocompleteDomain(String email) {
    List<String> autocompleteOptions = <String>[
      '...student.pens.ac.id',
      '...lecturer.pens.ac.id'
    ];

    if (email.contains("@")) {
      setState(() {
        containsAt = true;
      });
    } else {
      setState(() {
        containsAt = false;
      });
    }

    if (email.contains(".") && containsAt) {
      setState(() {
        containsDot = true;
      });
    } else {
      setState(() {
        containsDot = false;
      });
    }

    if (containsAt && containsDot) {
      List<String> tempOptions = <String>[];
      for (var element in autocompleteOptions) {
        tempOptions.add(element.replaceAll('...', email));
      }
      return tempOptions;
    } else {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Text(
            "CONTENDANCE",
            style: TextStyle(
              color: const Color(0xff145ae3),
              fontSize: 20.0,
              fontWeight: fwBold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Masuk ke akunmu",
                style: TextStyle(
                  fontWeight: fwBold,
                  fontSize: 20,
                ),
              ),
              const Text(
                "Gunakan akun dari instansi anda",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          // Container(
          //   decoration: BoxDecoration(
          //     borderRadius: const BorderRadius.all(
          //       Radius.circular(10),
          //     ),
          //     gradient: colorGradient,
          //   ),
          //   margin: const EdgeInsets.only(top: paddingLg),
          //   padding: const EdgeInsets.all(paddingLg),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Text(
          //         "Akun Demo (Demo Account)",
          //         style: TextStyle(
          //           color: colorWhite,
          //           fontSize: 16.0,
          //           fontWeight: fwBold,
          //         ),
          //       ),
          //       const SizedBox(
          //         height: 8,
          //       ),
          //       Text(
          //         "Email: demo@contendance.com",
          //         style: TextStyle(
          //           color: colorSubWhite,
          //           fontSize: 16.0,
          //         ),
          //       ),
          //       const SizedBox(
          //         height: 4,
          //       ),
          //       Text(
          //         "Password: 12345678",
          //         style: TextStyle(
          //           color: colorSubWhite,
          //           fontSize: 16.0,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                RawAutocomplete(
                  optionsBuilder: (TextEditingValue textEditingValue) {
                    if (textEditingValue.text == '') {
                      return const Iterable<String>.empty();
                    } else {
                      List<String> matches = <String>[];
                      matches.addAll(emailOptions);

                      // ignore: unnecessary_null_comparison
                      if (matches != null) {
                        matches.retainWhere((s) {
                          return s
                              .toLowerCase()
                              .contains(textEditingValue.text.toLowerCase());
                        });

                        if (matches.isEmpty) {
                          List<String> suggestions =
                              autocompleteDomain(textEditingValue.text);
                          return suggestions;
                        } else {
                          return matches;
                        }
                      } else {
                        List<String> suggestions =
                            autocompleteDomain(textEditingValue.text);
                        return suggestions;
                      }
                    }
                  },
                  onSelected: (option) {
                    setState(() {
                      email = option.toString();
                    });
                  },
                  fieldViewBuilder: (
                    BuildContext context,
                    TextEditingController emailController,
                    FocusNode focusNode,
                    VoidCallback onFieldSubmitted,
                  ) {
                    return Container(
                      margin: const EdgeInsets.only(top: 40),
                      child: TextFormField(
                        textInputAction: TextInputAction.next,
                        controller: emailController,
                        focusNode: focusNode,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
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
                          errorText: _validateEmail
                              ? null
                              : "Email tidak boleh kosong!",
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
                          labelText: 'Email',
                        ),
                        onChanged: (value) {
                          setState(() {
                            email = value;
                          });
                        },
                      ),
                    );
                  },
                  optionsViewBuilder: (BuildContext context,
                      void Function(String) onSelected,
                      Iterable<String> options) {
                    return SingleChildScrollView(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 7,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        margin: const EdgeInsets.only(right: 32),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: options.map((opt) {
                            return InkWell(
                              onTap: () {
                                onSelected(opt);
                              },
                              child: Card(
                                elevation: 0,
                                child: Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(12),
                                  child: Text(opt),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    );
                  },
                ),
                Container(
                  margin: const EdgeInsets.only(top: 16, bottom: 48),
                  child: TextFormField(
                    textInputAction: TextInputAction.go,
                    obscureText: ishiddenPassword,
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
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
                      errorText: _validatePassword
                          ? null
                          : "Password tidak boleh kosong!",
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
                      suffixIcon: InkWell(
                        onTap: _togglePasswordView,
                        child: ishiddenPassword
                            ? Icon(
                                Icons.visibility_off_outlined,
                                color: colorSubText,
                              )
                            : const Icon(
                                Icons.visibility_outlined,
                                color: Color(0xFF1482E9),
                              ),
                      ),
                    ),
                    onFieldSubmitted: (value) {
                      loginHandler();
                    },
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Button(
                    text: "LOGIN",
                    callback: loginHandler,
                    primary: true,
                    secondary: false,
                    withChild: !isClicked
                        ? Text(
                            'LOGIN',
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
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      ishiddenPassword = !ishiddenPassword;
    });
  }

  void loginHandler() async {
    email.isEmpty
        ? setState(() {
            _validateEmail = false;
          })
        : setState(() {
            _validateEmail = true;
          });
    passwordController.text.isEmpty
        ? setState(() {
            _validatePassword = false;
          })
        : setState(() {
            _validatePassword = true;
          });

    if (_validateEmail == true && _validatePassword == true) {
      setState(() {
        isClicked = true;
      });
      _formKey.currentState!.save();
      Map<String, String> body = {
        'email': email,
        'password': passwordController.text,
      };

      login
          .authLogin(body)
          .then(
            (response) => {
              _afterLoginHandler(response),
            },
          )
          .catchError((err) {
        setState(() {
          isClicked = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(err),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 3),
            behavior: SnackBarBehavior.floating,
            shape: ShapeBorder.lerp(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              1,
            ),
            margin: const EdgeInsets.all(
              paddingBase,
            ),
            elevation: 10,
          ),
        );
      });
    }
  }

  Future<void> _afterLoginHandler(LoginModel response) async {
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    if (token != null) {
      getUserInfo(token);
      Get.offNamed("/home");
    } else {
      setState(() {
        isClicked = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(response.message),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 3),
          behavior: SnackBarBehavior.floating,
          shape: ShapeBorder.lerp(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            1,
          ),
          margin: const EdgeInsets.all(
            paddingBase,
          ),
          elevation: 10,
        ),
      );
    }
  }

  Future<void> getUserInfo(String accessToken) async {
    final prefs = await SharedPreferences.getInstance();
    var res = await login.loggedUser(accessToken).then((value) => value);
    Map<dynamic, dynamic> result = jsonDecode(res.body);
    if (res.statusCode == 200) {
      UserInfo resBody = UserInfo.fromJson(result['data']);
      // UserInfo resBody = UserInfo.fromJson(jsonDecode(res.body));
      prefs.setInt('roleId', resBody.roleId);
      prefs.setInt('userId', resBody.userId);
      prefs.setInt('studyGroupId', resBody.studyGroupId ?? 0);
    }
  }
}
