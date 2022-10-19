import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonContainer extends StatefulWidget {
   CommonContainer({Key? key,required this.image,required this.comTitel,required this.comTitel2}) : super(key: key);


  String image;
  String comTitel;
  String comTitel2;
  @override
  State<CommonContainer> createState() => _CommonContainerState();
}

class _CommonContainerState extends State<CommonContainer> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),image: DecorationImage(image: AssetImage(widget.image),fit: BoxFit.fill),
              color: Colors.grey),
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(widget.comTitel),
          ],
        ),
        Row(
          children: [
            Text(widget.comTitel2),
          ],
        ),
      ],
    );
  }
}
