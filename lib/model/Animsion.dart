import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'appdetails.dart';

class HeroWidget extends StatefulWidget {
  const HeroWidget({Key? key}) : super(key: key);

  @override
  State<HeroWidget> createState() => _HeroWidgetState();
}
List<Map> AppDetails = [
  //1
  {
    "App1Image": "asset/image/4.jpeg",
    "App1Titel": "Google Street",
    "tag":"1",
  },
  {
    "App1Image": "asset/image/5.jpeg",
    "App1Titel": "Google fit",
    "tag":"2",
  },
  {
    "App1Image": "asset/image/6.jpeg",
    "App1Titel": "Google Street",
    "tag":"3",
  },
  {
    "App1Image": "asset/image/4.jpeg",
    "App1Titel": "Google Street",
    "tag":"4",
  },

  //2
  {
    "App1Image": "asset/image/2.jpeg",
    "App1Titel": "Amazon alexa",
    "tag":"5",
  },
  {
    "App1Image": "asset/image/WhatsApp Image 2022-08-29 at 2.28.55 PM.jpeg",
    "App1Titel": "Flipkard",
    "tag":"6",
  },
  {
    "App1Image": "asset/image/3.jpeg",
    "App1Titel": "ola, Safe",
    "tag":"7",
  },
  {
    "App1Image": "asset/image/2.jpeg",
    "App1Titel": "Amazon alexa",
    "tag":"8",
  },
  //3
  {
    "App1Image": "asset/image/7.jpeg",
    "App1Titel": "Blinkit",
    "tag":"9",
  },
  {
    "App1Image": "asset/image/8.jpeg",
    "App1Titel": "Lenskart",
    "tag":"10",
  },
  {
    "App1Image": "asset/image/9.jpeg",
    "App1Titel": "Lazada",
    "tag":"11",
  },
  {
    "App1Image": "asset/image/7.jpeg",
    "App1Titel": "Blinkit",
    "tag":"12",
  },
];
class _HeroWidgetState extends State<HeroWidget> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Container(
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 3,
                      offset: Offset(1.0, 1.0),
                    ),
                  ],
                ),
                child: Row(
                  children: const [
                    SizedBox(
                      width: 15,
                    ),
                    Icon(Icons.menu),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "seach for apps& game",
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                children: const [
                  Text("Based on your recent activity"),
                  Spacer(),
                  Icon(Icons.arrow_forward)
                ],
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 150,
                width: 370,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (BuildContext contaxt, val) {
                      return InkWell(
                        onTap:()=> Navigator.push(context, MaterialPageRoute(builder: (context) => AppDetailsScreen(val: val,),)),
                        child: Hero(
                          tag: "${AppDetails[val]["val"]}",
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "${AppDetails[val]["App1Image"]}"),
                                            fit: BoxFit.fill),
                                        color: Colors.grey),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text("${AppDetails[val]["App1Titel"]}"),
                                ],
                              ),
                              Row(
                                children: [
                                  Text("4.3 ★"),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                children: const [
                  Text("Recommendend for you"),
                  Spacer(),
                  Icon(Icons.arrow_forward)
                ],
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 150,
                width: 370,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (BuildContext context, val) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "${AppDetails[val + 4]["App1Image"]}"),
                                        fit: BoxFit.fill),
                                    color: Colors.grey),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text("${AppDetails[val + 4]["App1Titel"]}"),
                            ],
                          ),
                          Row(
                            children: [
                              Text("4.3 ★"),
                            ],
                          ),
                        ],
                      );
                    }),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                children: const [
                  Text("Go Shopping"),
                  Spacer(),
                  Icon(Icons.arrow_forward)
                ],
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 150,
                width: 370,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (BuildContext context, val) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "${AppDetails[val + 8]["App1Image"]}"),
                                        fit: BoxFit.fill),
                                    color: Colors.grey),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text("${AppDetails[val + 8]["App1Titel"]}"),
                            ],
                          ),
                          Row(
                            children: [
                              Text("4.3 ★"),
                            ],
                          ),
                        ],
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
