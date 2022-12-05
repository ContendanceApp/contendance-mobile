import 'package:flutter/material.dart';

import '../data/models/detail_class_model.dart';
import '../constant/theme.dart';

class UserItemList extends StatefulWidget {
  const UserItemList({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  State<UserItemList> createState() => _UserItemListState();
}

class _UserItemListState extends State<UserItemList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.user.users.fullname,
                  textAlign: TextAlign.left,
                  style: fontInter.copyWith(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    color: colorSubText,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  widget.user.users.sidEid,
                  textAlign: TextAlign.left,
                  style: fontInter.copyWith(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                    color: colorPrimaryBlue,
                  ),
                ),
              ],
            ),
            // TextButton(
            //   style: ButtonStyle(
            //     padding: MaterialStateProperty.all(
            //       const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
            //     ),
            //     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            //       RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(18.0),
            //       ),
            //     ),
            //     backgroundColor: MaterialStateProperty.all(colorDanger),
            //   ),
            //   onPressed: () {},
            //   child: Text(
            //     "Hapus",
            //     style: fontInter.copyWith(
            //       color: Colors.white,
            //       fontWeight: fwSemiBold,
            //     ),
            //   ),
            // )
          ],
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
