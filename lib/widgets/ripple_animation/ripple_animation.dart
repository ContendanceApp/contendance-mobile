import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../widgets/ripple_animation/circle_painter.dart';
import '../../constant/theme.dart';

class RipplesAnimation extends StatefulWidget {
  const RipplesAnimation({
    required Key? key,
    this.size = 100.0,
    this.color = const Color(0xFF145AE3),
    required this.onPressed,
    required this.child,
  }) : super(key: key);
  final double size;
  final Color color;
  final Widget child;
  final VoidCallback onPressed;
  @override
  _RipplesAnimationState createState() => _RipplesAnimationState();
}

class _RipplesAnimationState extends State<RipplesAnimation>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _ripple() {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(widget.size),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScaleTransition(
              scale: Tween(begin: 0.95, end: 1.0).animate(
                CurvedAnimation(
                  parent: _controller,
                  curve: const PulsateCurve(),
                ),
              ),
            ),
            SvgPicture.asset('assets/images/beacon-search.svg', width: 50),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "CONTENDANCE",
          style: fontInter.copyWith(
            color: colorPrimaryBlue,
            fontWeight: FontWeight.w800,
            fontSize: 14,
            letterSpacing: 1,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          verticalDirection: VerticalDirection.down,
          children: [
            Text(
              "Mencari Kelas ...",
              style: fontInter.copyWith(
                fontSize: 20,
                fontWeight: fwBold,
                color: colorPrimaryBlack,
              ),
            ),
            Center(
              child: CustomPaint(
                painter: CirclePainter(
                  _controller,
                  color: widget.color,
                ),
                child: SizedBox(
                  width: widget.size * 4,
                  height: widget.size * 4,
                  child: _ripple(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
