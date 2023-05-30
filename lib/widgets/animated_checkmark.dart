import 'package:flutter/material.dart';

class AnimatedCheckmark extends StatefulWidget {
  final Duration duration;

  const AnimatedCheckmark({super.key, required this.duration});

  @override
  _AnimatedCheckmarkState createState() => _AnimatedCheckmarkState();
}

class _AnimatedCheckmarkState extends State<AnimatedCheckmark>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _lineOneAnimation;
  late Animation<double> _lineTwoAnimation;
  double _lineOneEndPoint = 0.0;
  double _lineTwoEndPoint = 0.0;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _lineOneAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_animationController);

    _lineTwoAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.3, 1.0, curve: Curves.easeOut),
    ));

    _animationController.addListener(() {
      setState(() {
        _lineOneEndPoint = 40.0 * _lineOneAnimation.value;
        _lineTwoEndPoint = 40.0 * _lineTwoAnimation.value;
      });
    });

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CheckmarkPainter(
        lineOneEndPoint: _lineOneEndPoint,
        lineTwoEndPoint: _lineTwoEndPoint,
      ),
      size: const Size(50.0, 50.0),
    );
  }
}

class CheckmarkPainter extends CustomPainter {
  final double lineOneEndPoint;
  final double lineTwoEndPoint;

  const CheckmarkPainter({
    required this.lineOneEndPoint,
    required this.lineTwoEndPoint,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.green
      ..strokeWidth = 5.0
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(
      Offset(5.0, 25.0),
      Offset(5.0 + lineOneEndPoint, 25.0 - lineOneEndPoint), // Change here
      paint,
    );

    canvas.drawLine(
      Offset(5.0 + lineOneEndPoint, 25.0 - lineOneEndPoint), // Change here
      Offset(
        5.0 + lineTwoEndPoint,
        25.0 + lineTwoEndPoint,
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
