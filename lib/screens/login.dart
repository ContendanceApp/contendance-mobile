import 'package:contendance_app/constant/theme.dart';
import 'package:contendance_app/services/login_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:contendance_app/data/models/login.dart';

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
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  LoginService login = LoginService();
  final _formKey = GlobalKey<FormState>();
  String email = "sattar@it.student.pens.ac.id";
  String password = "12345678";
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          const SizedBox(
            height: 117,
          ),
          Text(
            "CONTENDANCE",
            style: TextStyle(
              color: const Color(0xff145ae3),
              fontSize: 20.0,
              fontWeight: bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 91,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Masuk Ke akunmu",
                style: TextStyle(
                  fontWeight: bold,
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
                    fontWeight: semibold,
                    color: cSubText,
                  ),
                  errorText:
                      _validateEmail ? null : "Email tidak boleh kosong!",
                  focusColor: cPrimaryBlue,
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
                  fontWeight: semibold,
                  color: cSubText,
                ),
                errorText:
                    _validatePassword ? null : "Password tidak boleh kosong!",
                focusColor: cPrimaryBlue,
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
                          color: cSubText,
                        )
                      : const Icon(
                          Icons.visibility_outlined,
                          color: Color(0xFF1482E9),
                        ),
                ),
              ),
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all(const EdgeInsets.all(0.0)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(80.0),
                ),
              ),
            ),
            child: Ink(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xff145ae3),
                    Color(0xff15aeef),
                  ],
                ),
                borderRadius: BorderRadius.all(Radius.circular(80.0)),
              ),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                constraints: const BoxConstraints(
                    minWidth: 88.0,
                    minHeight: 36.0), // min sizes for Material buttons
                alignment: Alignment.center,
                child: !isClicked
                    ? const Text(
                        'LOGIN',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      )
                    : SizedBox(
                        width: 15,
                        height: 15,
                        child: CircularProgressIndicator(
                          strokeWidth: 3,
                          color: cWhite,
                        ),
                      ),
              ),
            ),
            onPressed: () async {
              setState(() {
                isClicked = true;
              });
              emailController.text.isEmpty
                  ? _validateEmail = false
                  : _validateEmail = true;
              passwordController.text.isEmpty
                  ? _validatePassword = false
                  : _validatePassword = true;

              // if (_validateEmail == true && _validatePassword == true) {
              _formKey.currentState!.save();
              Map<String, String> body = {
                'email': emailController.text,
                'password': passwordController.text,
              };

              await login.authLogin(body).then(
                    (value) => {
                      _setToken(value),
                    },
                  );
              // }
            },
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

  Future<void> _setToken(Login response) async {
    final SharedPreferences prefs = await _prefs;
    final String token = (prefs.getString('token') ?? "");
    setState(() {
      prefs.setString('token', response.accessToken ?? "").then((bool success) {
        return token;
      });
    });
    if (response.accessToken != null) {
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
}
