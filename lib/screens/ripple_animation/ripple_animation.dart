import 'package:contendance_app/screens/home.dart';
import 'package:contendance_app/screens/ripple_animation/circle_painter.dart';
import 'package:flutter/material.dart';
import 'package:contendance_app/constant/theme.dart';
import 'package:contendance_app/screens/success_presence.dart';
import 'package:contendance_app/services/presence_service.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

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

  PresenceService presence = PresenceService();
  String? userId = "1";
  String? ruanganId = "1";

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat();
    // checkConnection();
    // searchingTimer();
  }

  checkConnection() async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (result == true) {
      doPresence();
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Home()),
      );
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Tidak ada koneksi internet')));
    }
  }

  doPresence() async {
    Map<String, String> body = {
      'userId': userId!,
      'ruanganId': ruanganId!,
    };
    await presence.createPresence(body).then((value) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SuccessPresence(presence: value.data),
        ),
      );
    });
  }

  // searchingTimer() async {
  //   var duration = const Duration(seconds: 3);
  //   return Timer(duration, () {
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(builder: (context) => const SuccessPresence()),
  //     );
  //   });
  // }

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
        // leading: BackButton(
        //   color: const Color(0xFF130F26),
        //   onPressed: () {
        //     // _goBack(context);
        //   },
        // ),
        automaticallyImplyLeading: false,
        title: Text(
          "CONTENDANCE",
          style: cInter.copyWith(
            color: cPrimaryBlue,
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
              style: cInter.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: cPrimaryBlack,
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
