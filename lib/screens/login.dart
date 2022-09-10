import 'dart:convert';

import 'package:flutter/material.dart';

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
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool ishiddenPassword = true;
  bool _validateEmail = true;
  bool _validatePassword = true;
  LoginService login = LoginService();
  final _formKey = GlobalKey<FormState>();
  bool isClicked = false;

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
    final prefs = await SharedPreferences.getInstance();

    if (prefs.getString('token') != null) {
      Navigator.pushReplacementNamed(context, "/home");
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
                "Masuk Ke akunmu",
                style: TextStyle(
                  fontWeight: fwBold,
                  fontSize: 20,
                ),
              ),
              const Text(
                "Gunakan akun ethol untuk masuk",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              gradient: colorGradient,
            ),
            margin: const EdgeInsets.only(top: paddingLg),
            padding: const EdgeInsets.all(paddingLg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Akun Demo (Demo Account)",
                  style: TextStyle(
                    color: colorWhite,
                    fontSize: 16.0,
                    fontWeight: fwBold,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "Email: demo@contendance.com",
                  style: TextStyle(
                    color: colorSubWhite,
                    fontSize: 16.0,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "Password: 12345678",
                  style: TextStyle(
                    color: colorSubWhite,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
          Form(
            key: _formKey,
            child: Container(
              margin: const EdgeInsets.only(top: 40),
              child: TextFormField(
                textInputAction: TextInputAction.next,
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFE0E0E0),
                      width: 1,
                    ),
                  ),
                  labelStyle: TextStyle(
                    fontWeight: fwSemifwBold,
                    color: colorSubText,
                  ),
                  errorText:
                      _validateEmail ? null : "Email tidak boleh kosong!",
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
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 16, bottom: 48),
            child: TextFormField(
              textInputAction: TextInputAction.done,
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
                  fontWeight: fwSemifwBold,
                  color: colorSubText,
                ),
                errorText:
                    _validatePassword ? null : "Password tidak boleh kosong!",
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
            ),
          ),
          Button(
            text: "LOGIN",
            callback: () async {
              emailController.text.isEmpty
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
                  'email': emailController.text,
                  'password': passwordController.text,
                };

                await login.authLogin(body).then(
                      (response) => {
                        _afterLoginHandler(response),
                      },
                    );
              }
            },
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
        ],
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      ishiddenPassword = !ishiddenPassword;
    });
  }

  Future<void> _afterLoginHandler(LoginModel response) async {
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    if (token != null) {
      getUserInfo(response.accessToken!);
      Navigator.pushReplacementNamed(context, "/home");
    } else {
      setState(() {
        isClicked = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(response.message!),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  Future<void> getUserInfo(String accessToken) async {
    final prefs = await SharedPreferences.getInstance();
    var res = await login.loggedUser(accessToken).then((value) => value);
    if (res.statusCode == 200) {
      UserInfo resBody = UserInfo.fromJson(jsonDecode(res.body));
      prefs.setInt('roleId', resBody.roleId);
      prefs.setInt('userId', resBody.userId);
      prefs.setInt('studyGroupId', resBody.studyGroupId ?? 0);
    }
  }
}
