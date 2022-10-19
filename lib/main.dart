import 'package:apicalling/model/Animsion.dart';
import 'package:apicalling/model/animation.dart';
import 'package:apicalling/helper/post_api_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'model/DragAndDrop.dart';

import 'model/new_user.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: mainPage(),
    ),
  );
}

class mainPage extends StatefulWidget {
  const mainPage({Key? key}) : super(key: key);

  @override
  State<mainPage> createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwrodController = TextEditingController();
  bool istap = false;
  var data;

  @override
  void initState() {
    PostAPIHelper.postAPIHelper.fetchSinglePost();
    super.initState();
  }

  // void login(String email, password) async {
  //   try {
  //     Response response = await post(
  //         Uri.parse("https://reqres.in/api/register"),
  //         body: {'email': email, 'password': password});
  //     if (response.statusCode == 200) {
  //       data = jsonDecode(response.body.toString());
  //       print(data);
  //       print("succes");
  //     } else {
  //       print("faiel");
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Map"),
        backgroundColor: Colors.red,
      ),
      body: FutureBuilder(
          future: PostAPIHelper.postAPIHelper.fetchSinglePost(),
          builder: (context, AsyncSnapshot snapshot) {
            return SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // SizedBox(
                      //   height: 20,
                      // ),
                      // TextFormField(
                      //   controller: emailController,
                      //   decoration: InputDecoration(hintText: "o"),
                      //
                      // ),
                      // SizedBox(
                      //   height: 8,
                      // ),
                      // TextFormField(
                      //   controller: passwrodController,
                      //   decoration: InputDecoration(hintText: "o"),
                      // ),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Column(
                          children: [
                            // InkWell(
                            //   onTap: () {
                            //     // login(emailController.text.toString(),
                            //     //     passwrodController.text.toString());
                            //   },
                            //   child: Container(
                            //     height: 60,
                            //     width: 200,
                            //     alignment: Alignment.center,
                            //     child: Text(
                            //       "register",
                            //       style: TextStyle(
                            //           fontSize: 20, color: Colors.white),
                            //     ),
                            //     decoration: BoxDecoration(
                            //         borderRadius: BorderRadius.circular(10),
                            //         color: Colors.blue),
                            //   ),
                            // ),
                            // SizedBox(
                            //   height: 30,
                            // ),
                            // GestureDetector(
                            //   onTap: () {
                            //     if (istap == true)
                            //       istap = false;
                            //     else if (istap == false) istap = true;
                            //     setState(() {});
                            //   },
                            //   child: Container(
                            //     height: 100,
                            //     width: 300,
                            //     child: Center(
                            //         child:
                            //         istap ? Text(data.toString()) : Text('hello')),
                            //     decoration: BoxDecoration(
                            //       borderRadius: BorderRadius.circular(10),
                            //       color: Colors.grey[200],
                            //     ),
                            //   ),
                            // ),
                            // InkWell(
                            //   onTap: () async {
                            //     // Navigator.push(
                            //     //   context,
                            //     //   MaterialPageRoute(
                            //     //       builder: (context) => const imageUplod()),
                            //     // );
                            //      Permission.location.request();
                            //
                            //      //getLocation() async{Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);}
                            //   },
                            //   child: Container(
                            //     height: 60,
                            //     width: 200,
                            //     alignment: Alignment.center,
                            //     child: Text(
                            //       "loction",
                            //       style: TextStyle(
                            //           fontSize: 20, color: Colors.white),
                            //     ),
                            //     decoration: BoxDecoration(
                            //         borderRadius: BorderRadius.circular(10),
                            //         color: Colors.blue),
                            //   ),
                            // ),
                            // SizedBox(
                            //   height: 20,
                            // ),
                            // InkWell(
                            //   onTap: () {
                            //     Navigator.push(
                            //       context,
                            //       MaterialPageRoute(
                            //           builder: (context) => Vidiocall()),
                            //     );
                            //   },
                            //   child: Container(
                            //     height: 60,
                            //     width: 200,
                            //     alignment: Alignment.center,
                            //     child: Text(
                            //       "video call",
                            //       style: TextStyle(
                            //           fontSize: 20, color: Colors.white),
                            //     ),
                            //     decoration: BoxDecoration(
                            //         borderRadius: BorderRadius.circular(10),
                            //         color: Colors.blue),
                            //   ),
                            // ),
                            // SizedBox(
                            //   height: 20,
                            // ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const googleMap()),
                                );
                              },
                              child: Container(
                                height: 60,
                                width: 200,
                                alignment: Alignment.center,
                                child: const Text(
                                  "map",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.red),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            // InkWell(
                            //   onTap: () {
                            //     Navigator.push(
                            //       context,
                            //       MaterialPageRoute(
                            //           builder: (context) =>
                            //               const CustomScroollView()),
                            //     );
                            //   },
                            //   child: Container(
                            //     height: 60,
                            //     width: 200,
                            //     alignment: Alignment.center,
                            //     child: const Text(
                            //       "CustomScrollView",
                            //       style: TextStyle(
                            //           fontSize: 20, color: Colors.white),
                            //     ),
                            //     decoration: BoxDecoration(
                            //         borderRadius: BorderRadius.circular(10),
                            //         color: Colors.red),
                            //   ),
                            // ),
                            // const SizedBox(
                            //   height: 20,
                            // ),
                            // InkWell(
                            //   onTap: () {
                            //     Navigator.push(
                            //       context,
                            //       MaterialPageRoute(
                            //           builder: (context) => const DraagGame()),
                            //     );
                            //   },
                            //   child: Container(
                            //     height: 60,
                            //     width: 200,
                            //     alignment: Alignment.center,
                            //     child: const Text(
                            //       "Drag app",
                            //       style: TextStyle(
                            //           fontSize: 20, color: Colors.white),
                            //     ),
                            //     decoration: BoxDecoration(
                            //         borderRadius: BorderRadius.circular(10),
                            //         color: Colors.red),
                            //   ),
                            // ),
                            // const SizedBox(
                            //   height: 20,
                            // ),
                            // InkWell(
                            //   onTap: () {
                            //     Navigator.push(
                            //       context,
                            //       MaterialPageRoute(
                            //           builder: (context) => const HeroWidget()),
                            //     );
                            //   },
                            //   child: Container(
                            //     height: 60,
                            //     width: 200,
                            //     alignment: Alignment.center,
                            //     child: const Text(
                            //       "Hero Widget",
                            //       style: TextStyle(
                            //           fontSize: 20, color: Colors.white),
                            //     ),
                            //     decoration: BoxDecoration(
                            //         borderRadius: BorderRadius.circular(10),
                            //         color: Colors.red),
                            //   ),
                            // ),
                            // const SizedBox(
                            //   height: 20,
                            // ),
                            // InkWell(
                            //   onTap: () {
                            //     Navigator.push(
                            //       context,
                            //       MaterialPageRoute(
                            //           builder: (context) => const animation()),
                            //     );
                            //   },
                            //   child: Container(
                            //     height: 60,
                            //     width: 200,
                            //     alignment: Alignment.center,
                            //     child: const Text(
                            //       "Animasion",
                            //       style: TextStyle(
                            //           fontSize: 20, color: Colors.white),
                            //     ),
                            //     decoration: BoxDecoration(
                            //         borderRadius: BorderRadius.circular(10),
                            //         color: Colors.red),
                            //   ),
                            // ),
                            // const SizedBox(
                            //   height: 20,
                            // ),
                            // InkWell(
                            //   onTap: () {
                            //     Navigator.push(
                            //       context,
                            //       MaterialPageRoute(
                            //           builder: (context) => const Drawing()),
                            //     );
                            //   },
                            //   child: Container(
                            //     height: 60,
                            //     width: 200,
                            //     alignment: Alignment.center,
                            //     child: const Text(
                            //       "Drawing",
                            //       style: TextStyle(
                            //           fontSize: 20, color: Colors.white),
                            //     ),
                            //     decoration: BoxDecoration(
                            //         borderRadius: BorderRadius.circular(10),
                            //         color: Colors.red),
                            //   ),
                            // ),
                            // const SizedBox(
                            //   height: 20,
                            // ),
                            // InkWell(
                            //   onTap: () {
                            //     Navigator.push(
                            //       context,
                            //       MaterialPageRoute(
                            //           builder: (context) => const DataBase()),
                            //     );
                            //   },
                            //   child: Container(
                            //     height: 60,
                            //     width: 200,
                            //     alignment: Alignment.center,
                            //     child: const Text(
                            //       "Local Database",
                            //       style: TextStyle(
                            //           fontSize: 20, color: Colors.white),
                            //     ),
                            //     decoration: BoxDecoration(
                            //         borderRadius: BorderRadius.circular(10),
                            //         color: Colors.red),
                            //   ),
                            // ),

                            // InkWell(
                            //   onTap: () {
                            //     Navigator.push(
                            //       context,
                            //       MaterialPageRoute(
                            //           builder: (context) => const apicalling()),
                            //     );
                            //   },
                            //   child: Container(
                            //     height: 60,
                            //     width: 200,
                            //     alignment: Alignment.center,
                            //     child: Text(
                            //       "API CALL"
                            //       ,
                            //       style: TextStyle(
                            //           fontSize: 20, color: Colors.white),
                            //     ),
                            //     decoration: BoxDecoration(
                            //         borderRadius: BorderRadius.circular(10),
                            //         color: Colors.blue),
                            //   ),
                            // ),
                            // SizedBox(
                            //   height: 20,
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
