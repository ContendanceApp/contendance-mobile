import 'package:contendance_app/constant/theme.dart';
import 'package:contendance_app/screens/home.dart';
import 'package:contendance_app/screens/success_presence.dart';
import 'package:contendance_app/services/presence_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'dart:math' as math;

void main() => runApp(const SearchClass());

class SearchClass extends StatefulWidget {
  const SearchClass({Key? key}) : super(key: key);

  @override
  State<SearchClass> createState() => _SearchClassState();
}

class _SearchClassState extends State<SearchClass> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // ignore: prefer_const_constructors
      home: RipplesAnimation(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Home(),
          ),
        ),
        key: null,
        child: Container(),
      ),
    );
  }
}

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
    checkConnection();
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

class CirclePainter extends CustomPainter {
  CirclePainter(
    this._animation, {
    required this.color,
  }) : super(repaint: _animation);
  final Color color;
  final Animation<double> _animation;
  void circle(Canvas canvas, Rect rect, double value) {
    final double opacity = (1.0 - (value / 4.0)).clamp(0.0, 1.0);
    final Color _color = color.withOpacity(opacity);
    final double size = rect.width / 2;
    final double area = size * size;
    final double radius = math.sqrt(area * value / 4);
    final Paint paint = Paint()
      ..color = _color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    canvas.drawCircle(rect.center, radius, paint);
  }

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromLTRB(0.0, 0.0, size.width, size.height);
    for (int wave = 3; wave >= 0; wave--) {
      circle(canvas, rect, wave + _animation.value);
    }
  }

  @override
  bool shouldRepaint(CirclePainter oldDelegate) => true;
}

class PulsateCurve extends Curve {
  const PulsateCurve();

  @override
  double transform(double t) {
    if (t == 0 || t == 1) {
      return 0.01;
    }
    return math.sin(t * math.pi);
  }
}
