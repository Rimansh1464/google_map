
import 'package:flutter/material.dart';

import 'Animsion.dart';

class AppDetailsScreen extends StatefulWidget {
  AppDetailsScreen({Key? key, required this.val}) : super(key: key);

  final val;

  @override
  _AppDetailsScreenState createState() => _AppDetailsScreenState();
}

class _AppDetailsScreenState extends State<AppDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back,
            color: Colors.grey,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
            ),
            color: Colors.grey,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_vert,
            ),
            color: Colors.grey,
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 130,
                child: Row(
                  children: [
                    Column(
                      children: [
                        Hero(
                          tag: "${AppDetails[widget.val]["val"]}",
                          child: Container(
                            height: 110,
                            width: 110,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image: AssetImage(
                                    "${AppDetails[widget.val]["App1Image"]}"),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
// First Text
                        Text(
                          "${AppDetails[widget.val]["App1Titel"]}",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 26,
                          ),
                        ),

// second Text
                        Text(
                          "${AppDetails[widget.val]["App1Titel"]}",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.blue,
                            fontSize: 15,
                          ),
                        ),

// Third text

                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 30,
              ),
              Container(
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.blue,
                ),
                child: Center(
                  child: Text(
                    "Install",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 160,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: Container(
                        height: 130,
                        width: 90,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.withOpacity(0.6),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "About this game",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward,
                  ),
                ],
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                "Discover the endless desert",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 30,
              ),

              const SizedBox(
                height: 40,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
