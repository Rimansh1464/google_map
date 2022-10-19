import 'package:flutter/material.dart';

class DraagGame extends StatefulWidget {
  const DraagGame({Key? key}) : super(key: key);

  @override
  State<DraagGame> createState() => _DraagGameState();
}
final Map<String,bool> score = {};
final Map<String,dynamic> Choice = {
  "asset/image/Tiger.png":"Cat",
  "asset/image/elefant.png":"Tiger",
  "asset/image/monky.png":"Elefant",
  "asset/image/dogg.png":"Monky",
  "asset/image/cat.png":"Dog",


  // "asset/image/elefant.png":Text(
  //   "Tiger",
  //   style: TextStyle(fontSize: 20),
  // ),
  // "asset/image/monky.png":Text(
  //   "Elefant",
  //   style: TextStyle(fontSize: 20),
  // ),
  // "asset/image/dogg.png":Text(
  //   "Monky",
  //   style: TextStyle(fontSize: 20),
  // ),
  // "asset/image/cat.png":Text(
  //   "Dog",
  //   style: TextStyle(fontSize: 20),
  // ),
};
class _DraagGameState extends State<DraagGame> {

  bool isDropped = false;
  bool isDroppedTiger = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("3c"),
          backgroundColor: Colors.red,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(13),
            child: Row(
              children: [
                // Padding(padding: EdgeInsets.all(10)),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children:Choice.keys.map((i) {
                     return Draggable(
                        data: i,
                        child:Image.asset(i,scale: 6,) ,
                        feedback: Image.asset(i,scale: 6,) ,
                     );
                  } ).toList(),
                    // Draggable(
                    //   data: "tiger",
                    //   child: Image.asset(
                    //     "asset/image/Tiger.png",
                    //     scale: 6,
                    //   ),
                    //   feedback: Image.asset(
                    //     "",
                    //     scale: 6,
                    //   ),
                    // ),
                    // Image.asset(
                    //   "asset/image/elefant.png",
                    //   scale: 6,
                    // ),
                    // Image.asset(
                    //   "asset/image/monky.png",
                    //   scale: 6,
                    // ),
                    // Image.asset(
                    //   "asset/image/dogg.png",
                    //   scale: 6,
                    // ),
                    // Image.asset(
                    //   "asset/image/cat.png",
                    //   scale: 6,
                    // ),

                ),
                const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:Choice.keys.map((i) {
                return DragTarget(
                  builder: (
                      BuildContext context,
                      List<dynamic> accepted,
                      List<dynamic> rejected,
                      )  {return  (score[i] == true) ?
                     Image.asset(
                      "asset/image/check.png",
                      scale: 15,
                      fit: BoxFit.fill,
                    ):

                   Text(Choice[i],style: TextStyle(fontSize:20 ),);

                    // return (isDroppedTiger == false)
                    //     ? Text(
                    //   "Tiger",
                    //   style: TextStyle(fontSize: 20),
                    // )
                    //     : Image.asset(
                    //   "asset/image/check.png",
                    //   scale: 15,
                    //   fit: BoxFit.fill,
                    // );
                  },

                  onWillAccept: (data) {return
                    data == i;
                  },
                  onAccept: (data) {
setState(() {
  score[i] = true;
});
                  },
                );
              } ).toList(),
              // Draggable(
              //   data: "tiger",
              //   child: Image.asset(
              //     "asset/image/Tiger.png",
              //     scale: 6,
              //   ),
              //   feedback: Image.asset(
              //     "",
              //     scale: 6,
              //   ),
              // ),
              // Image.asset(
              //   "asset/image/elefant.png",
              //   scale: 6,
              // ),
              // Image.asset(
              //   "asset/image/monky.png",
              //   scale: 6,
              // ),
              // Image.asset(
              //   "asset/image/dogg.png",
              //   scale: 6,
              // ),
              // Image.asset(
              //   "asset/image/cat.png",
              //   scale: 6,
              // ),

            ),
            ]
          )
        )) );
  }
}


// Center(
// child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
// Draggable(
// data: "puepel",
// child: Container(
// height: 100,
// width: 100,
// color: Colors.purple,
// ),
// feedback: Container(height: 120, width: 120, color: Colors.red),
// ),
// SizedBox(
// height: 100,
// ),
// DragTarget<String>(
// builder: (
// BuildContext context,
//     List<dynamic> accepted,
// List<dynamic> rejected,
// ) {
// return Container(height: 170,width: 170, color:(isDropped== false)  ? Colors.yellow: Colors.red);
// },
// onWillAccept: (data) {
// return data == 'puepel';
// },
// onAccept: (data) {
// setState(() {
// isDropped = true;
//
// });
// },
// ),
// ]),
// )
