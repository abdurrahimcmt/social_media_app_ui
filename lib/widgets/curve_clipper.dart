import 'package:flutter/material.dart';

class CurveClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path = Path();
    // for curve first part
    path.lineTo(0, size.height * 0.80);
    Offset curvePoint1 = Offset(size.width * 0.25, size.height);
    Offset centerPoint = Offset(size.width * 0.50, size.height * 0.80);
    path.quadraticBezierTo(
      curvePoint1.dx,
      curvePoint1.dy,
      centerPoint.dx,
      centerPoint.dy,
    );
    // for curve second part
    Offset curvePoint2 = Offset(size.width * 0.75, size.height * 0.60);
    Offset endPoint = Offset(size.width, size.height * 0.80);
    path.quadraticBezierTo(
      curvePoint2.dx,
      curvePoint2.dy,
      endPoint.dx,
      endPoint.dy,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return false;
  }
}
