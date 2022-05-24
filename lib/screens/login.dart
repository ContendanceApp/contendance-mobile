import 'package:contendance_app/constant/theme.dart';
import 'package:contendance_app/screens/home.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool ishiddenPassword = true;

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
          Container(
            margin: const EdgeInsets.only(top: 40),
            child: TextField(
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
          Container(
            margin: const EdgeInsets.only(top: 16, bottom: 48),
            child: TextField(
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
                      ? const Icon(Icons.visibility_off_outlined)
                      : const Icon(Icons.visibility_outlined),
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Home()),
              );
            },
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
                child: const Text(
                  'LOGIN',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
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
}
