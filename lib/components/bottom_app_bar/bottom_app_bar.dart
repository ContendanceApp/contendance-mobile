import 'package:contendance_app/constant/theme.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class BottomAppBarComp extends StatelessWidget {
  const BottomAppBarComp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: const Color(0xFF1482E9),
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      clipBehavior: Clip.none,
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 16,
          top: 8,
        ),
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: Wrap(
                alignment: WrapAlignment.spaceBetween,
                runSpacing: 20,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(left: 50),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(IconlyLight.home),
                          iconSize: 26,
                          color: Colors.white,
                        ),
                        Text(
                          "Beranda",
                          textAlign: TextAlign.center,
                          style: cInter.copyWith(
                            fontSize: 14,
                            fontWeight: semibold,
                            color: const Color(0xFFFFFFFF),
                            height: 0.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 50),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pushNamed(context, "/account");
                            },
                            icon: const Icon(IconlyLight.profile),
                            iconSize: 26,
                            color: Colors.white),
                        Text(
                          "Akun",
                          textAlign: TextAlign.center,
                          style: cInter.copyWith(
                            fontSize: 14,
                            fontWeight: semibold,
                            color: const Color(0xFFFFFFFF),
                            height: 0.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned.directional(
              textDirection: TextDirection.ltr,
              bottom: -3,
              start: 0,
              width: MediaQuery.of(context).size.width,
              child: Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: Text(
                  "Cari Kelas",
                  textAlign: TextAlign.center,
                  style: cInter.copyWith(
                    fontSize: 14,
                    fontWeight: semibold,
                    color: const Color(0xFFFFFFFF),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
