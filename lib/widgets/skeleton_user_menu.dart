import 'package:flutter/material.dart';

import 'package:skeleton_text/skeleton_text.dart';

class SkeletonUserMenu extends StatelessWidget {
  const SkeletonUserMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      controller: ScrollController(
        keepScrollOffset: false,
      ),
      clipBehavior: Clip.none,
      shrinkWrap: true,
      crossAxisCount: 1,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      childAspectRatio: 2.75,
      children: [
        InkWell(
          child: Container(
            child: SkeletonAnimation(
              borderRadius: BorderRadius.circular(8.0),
              shimmerColor: Colors.grey[50]!,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.white,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: const Color(0xFFFFFFFF),
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              border: Border.all(
                  color: const Color(0xFFF4F4F4),
                  width: 1.0,
                  style: BorderStyle.solid),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  spreadRadius: 2,
                  blurRadius: 10,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
