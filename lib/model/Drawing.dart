import 'package:flutter/material.dart';

class Drawing extends StatefulWidget {
  const Drawing({Key? key}) : super(key: key);

  @override
  State<Drawing> createState() => _DrawingState();
}

class _DrawingState extends State<Drawing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Drawing"),
      ),
      body: SafeArea(
        child: Center(
          child: CustomPaint(
            child: Container(
              height: 300,
              width: 300,
              color: Colors.grey[300],
            ),
            foregroundPainter:Painter(),
          ),
        ),
      ),
    );
  }
}
class Painter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
     Paint brush =Paint();
     brush.style = PaintingStyle.stroke;
     brush.strokeWidth = 5;

     Path path = Path();


     brush.color= Colors.red;
     path.moveTo(size.width /2,0);
     path.lineTo(0,size.width);
     path.lineTo(size.height,size.width/3 );
     path.lineTo(size.width/3, size.height);


     canvas.drawPath(path, brush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

}