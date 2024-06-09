// import 'package:flutter/material.dart';
//

import '../../utils/basic_screen_imports.dart';

class ScaffoldBgSignUpCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.4734300, size.height * 0.9000000);
    path_0.cubicTo(
        size.width * 0.2425121,
        size.height * 0.7698305,
        size.width * 0.007648961,
        size.height * 0.9011288,
        size.width * -0.08091787,
        size.height * 0.9830508);
    path_0.lineTo(size.width * -0.01932367, size.height * -0.01016949);
    path_0.lineTo(size.width * 0.9987923, size.height * -0.01016949);
    path_0.cubicTo(
        size.width * 1.158213,
        size.height * 0.1796610,
        size.width * 1.433575,
        size.height * 0.6054237,
        size.width * 1.259662,
        size.height * 0.7898305);
    path_0.cubicTo(
        size.width * 1.042271,
        size.height * 1.020339,
        size.width * 0.7620773,
        size.height * 1.062712,
        size.width * 0.4734300,
        size.height * 0.9000000);
    path_0.close();

    path_0.close();
    return path_0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

// import 'dart:ui' as ui;
// import 'dart:ui';
//
// import 'basic_screen_imports.dart';
//
// //Add this CustomPaint widget to the Widget Tree
// CustomPaint(
// size: Size(WIDTH, (WIDTH*0.7125603864734299).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
// painter: RPSCustomPainter(),
// )
//
// //Copy this CustomPainter code to the Bottom of the File
// class RPSCustomPainter extends CustomPainter {
// @override
// void paint(Canvas canvas, Size size) {
//
// Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
// paint_0_fill.color = Color(0xff64CDCE).withOpacity(1.0);
// canvas.drawRRect(RRect.fromRectAndCorners(Rect.fromLTWH(size.width*-0.2004831,size.height*-0.2070820,size.width*1.528010,size.height*1.398519),bottomRight: Radius.circular(size.width*0.4371981),bottomLeft:  Radius.circular(size.width*0.4371981),topLeft:  Radius.circular(size.width*0.4371981),topRight:  Radius.circular(size.width*0.4371981)),paint_0_fill);
//
// }
//
// @override
// bool shouldRepaint(covariant CustomPainter oldDelegate) {
// return true;
// }
// }
