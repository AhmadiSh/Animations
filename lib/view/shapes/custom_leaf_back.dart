import 'package:flutter/material.dart';

class RPSCustomLeafBack extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {



    Paint paint0 = Paint()
      ..color =  const Color(0xff2e9d75)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;


    Path path0 = Path();
    path0.moveTo(size.width*0.0020000,size.height*0.4768000);
    path0.cubicTo(size.width*0.3610000,size.height*0.0224000,size.width*0.4634000,size.height*0.0544000,size.width*0.5068000,size.height*0.0448000);
    path0.cubicTo(size.width*0.5444000,size.height*0.0484000,size.width*0.8052000,size.height*0.0140000,size.width*0.9980000,size.height*0.3760000);
    path0.quadraticBezierTo(size.width*0.9980000,size.height*0.4590000,size.width*0.9980000,size.height*0.7080000);
    path0.quadraticBezierTo(size.width*0.8406000,size.height*0.9284000,size.width*0.6500000,size.height*0.9656000);
    path0.cubicTo(size.width*0.2956000,size.height*0.9538000,size.width*0.3052000,size.height*0.3842000,size.width*0.0020000,size.height*0.4768000);
    path0.close();

    canvas.drawPath(path0, paint0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}
