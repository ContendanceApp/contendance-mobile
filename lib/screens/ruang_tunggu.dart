import 'package:contendance_app/components/stack_screen.dart';
import 'package:contendance_app/constant/theme.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class RuangTunggu extends StatefulWidget {
  const RuangTunggu({Key? key}) : super(key: key);

  @override
  State<RuangTunggu> createState() => _RuangTungguState();
}

class _RuangTungguState extends State<RuangTunggu> {
  @override
  Widget build(BuildContext context) {
    return StackScreen(
      title: "Daftar Ruangan",
      child: ListView(
        shrinkWrap: true,
        controller: ScrollController(
          keepScrollOffset: false,
        ),
        padding: const EdgeInsets.all(0),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Ainul Muhlasin",
                style: cInter.copyWith(
                  fontSize: 14,
                  fontWeight: medium,
                  color: cPrimaryBlack,
                ),
              ),
              TextButton(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all(cPrimaryBlue),
                ),
                onPressed: () {},
                child: const Text(
                  "Terima",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
