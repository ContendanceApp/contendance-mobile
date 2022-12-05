import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_redirect/store_redirect.dart';

import '../constant/theme.dart';
import '../widgets/button.dart';
import '../widgets/screen_wrapper/base_white_screen.dart';

class UpdateNotice extends StatelessWidget {
  const UpdateNotice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWhiteScreen(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Pembaruan Aplikasi Tersedia!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 20.0,
                    fontWeight: fwBold,
                    color: colorPrimaryBlack,
                  ),
                ),
                const SizedBox(height: 25),
                SvgPicture.asset("assets/images/update-illustration.svg"),
                const SizedBox(height: 57),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: paddingXl),
                    child: Text(
                      "Versi terbaru Contendance telah tersedia. Lakukan update aplikasi untuk dapat tetap menggunakan aplikasi.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF64749F),
                        height: 1.5,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
            Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: Container(
                margin: const EdgeInsets.symmetric(
                    horizontal: paddingBase, vertical: 48),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Button(
                        text: "Update Sekarang",
                        primary: true,
                        secondary: false,
                        callback: () async {
                          StoreRedirect.redirect(
                              androidAppId: "com.contendance");
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
