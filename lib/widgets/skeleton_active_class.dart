import 'package:flutter/material.dart';
import 'package:skeleton_text/skeleton_text.dart';

class SkeletonActiveClass extends StatelessWidget {
  const SkeletonActiveClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 135,
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
    );
  }
}
