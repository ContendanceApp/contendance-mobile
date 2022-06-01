import 'package:contendance_app/constant/theme.dart';
import 'package:contendance_app/data/models/presence_history.dart';
import 'package:flutter/material.dart';

class SubjectCard extends StatelessWidget {
  const SubjectCard({
    Key? key,
    required this.history,
  }) : super(key: key);

  final PresenceHistory history;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        width: double.infinity,
        padding: const EdgeInsets.all(18),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 70,
              width: 70,
              margin: const EdgeInsets.only(right: 8),
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    history.acronym,
                    textAlign: TextAlign.center,
                    style: cInter.copyWith(
                      fontSize: 14,
                      fontWeight: bold,
                      color: cPrimaryBlue,
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: const Color(0xFF15AEEF).withOpacity(0.15),
                borderRadius: const BorderRadius.all(Radius.circular(15)),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                margin: const EdgeInsets.only(bottom: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      history.subject,
                      style: cInter.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: cSubText,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '08:00 - 101:00',
                              style: cInter.copyWith(
                                color: cPrimaryBlack,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              history.lab,
                              style: cInter.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: cPrimaryBlue,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          border: Border.all(
              color: const Color(0xFFF4F4F4),
              width: 1.0,
              style: BorderStyle.solid),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.black.withOpacity(0.05),
          //     spreadRadius: 2,
          //     blurRadius: 10,
          //   )
          // ],
        ),
      ),
      onTap: () {
        showModalBottom(context);
      },
    );
  }

  showModalBottom(BuildContext context) {
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (builder) {
        return Container(
          constraints: const BoxConstraints(minHeight: 250),
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
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 70,
                            width: 70,
                            margin: const EdgeInsets.only(right: 8),
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  history.acronym,
                                  textAlign: TextAlign.center,
                                  style: cInter.copyWith(
                                    fontSize: 14,
                                    fontWeight: bold,
                                    color: cPrimaryBlue,
                                  ),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF15AEEF).withOpacity(0.15),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                            ),
                          ),
                          const SizedBox(height: cPadding1),
                          Expanded(
                            flex: 2,
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 4),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text(
                                    history.subject,
                                    style: cInter.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: cSubText,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '08:00 - 10:00',
                                            style: cInter.copyWith(
                                              color: cPrimaryBlack,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          Text(
                                            history.lab,
                                            style: cInter.copyWith(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                              color: cPrimaryBlue,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: cPadding2,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Dosen Pengampu',
                                        style: cInter.copyWith(
                                          color: cSubText,
                                          fontSize: 16,
                                          fontWeight: medium,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        "Andhik Ampuh Yunanto",
                                        style: cInter.copyWith(
                                          fontSize: 16,
                                          fontWeight: semibold,
                                          color: cPrimaryBlack,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
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
                              child: const Text("Tutup"),
                            ),
                          ),
                          // Container(
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(80.0),
                          //     gradient: const LinearGradient(
                          //       begin: Alignment.topRight,
                          //       end: Alignment.bottomLeft,
                          //       colors: [
                          //         Color(0xff145ae3),
                          //         Color(0xff15aeef),
                          //       ],
                          //     ),
                          //   ),
                          //   child: TextButton(
                          //     style: TextButton.styleFrom(
                          //       padding: const EdgeInsets.symmetric(
                          //           horizontal: 45, vertical: 12),
                          //       primary: Colors.white,
                          //       textStyle: cInter.copyWith(
                          //         fontSize: 16,
                          //         fontWeight: FontWeight.bold,
                          //       ),
                          //     ),
                          //     onPressed: () {},
                          //     child: const Text("Presensi"),
                          //   ),
                          // ),
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
