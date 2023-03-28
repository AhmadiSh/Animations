import 'package:flutter/material.dart';

class RPSCustomLeaf extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {



    Paint paint0 = Paint()
      ..color =  const Color(0xff2e9d75)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path0 = Path();
    path0.moveTo(size.width*0.5040000,size.height*0.8306000);
    path0.cubicTo(size.width*0.7954500,size.height*0.7901000,size.width*0.9589000,size.height*0.4574000,size.width*0.9971000,size.height*0.1608000);
    path0.cubicTo(size.width*0.7336000,size.height*0.2691000,size.width*0.6986500,size.height*0.0008000,size.width*0.5405500,0);
    path0.cubicTo(size.width*0.4054125,0,size.width*0.1351375,0,0,0);
    path0.cubicTo(size.width*0.0879500,size.height*0.3325000,size.width*0.2025000,size.height*0.8019000,size.width*0.5040000,size.height*0.8306000);
    path0.close();


    canvas.drawPath(path0, paint0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }



}