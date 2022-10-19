// import 'dart:developer';
// import 'package:animation_app/screens/home_screen/page/app_detail_screen.dart';
// import 'package:animation_app/utils/colours.dart';
// import 'package:animation_app/utils/list.dart';
// import 'package:flutter/material.dart';
//
// class HomePage extends StatefulWidget {
//   HomePage({Key? key}) : super(key: key);
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
//   late TabController _tabController;
//
//   late PageController _pageController;
//   int bottomNavbarIndex = 0;
//   bool isSwitch = false;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _tabController = TabController(length: 4, vsync: this);
//     _pageController = PageController();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Column(
//           children: [
//             const SizedBox(
//               height: 10,
//             ),
//             // Appbar
//             Container(
//               height: 50,
//               width: double.infinity,
//               margin: EdgeInsets.symmetric(
//                 vertical: 8,
//                 horizontal: 15,
//               ),
//               padding: EdgeInsets.symmetric(
//                 horizontal: 13,
//               ),
//               decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.all(
//                     Radius.circular(10),
//                   ),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.5),
//                       spreadRadius: 3,
//                       blurRadius: 7,
//                     ),
//                   ]),
//               child: Row(
//                 children: [
//                   Icon(
//                     Icons.menu,
//                   ),
//                   SizedBox(
//                     width: 10,
//                   ),
//                   Text(
//                     "Search for apps & games",
//                     style: TextStyle(
//                       color: Colors.grey.withOpacity(0.6),
//                       fontSize: 18,
//                     ),
//                   ),
//                   Spacer(),
//                   Icon(Icons.mic),
//                 ],
//               ),
//             ),
//             // tab bar
//             TabBar(
//               padding: EdgeInsets.symmetric(horizontal: 20),
//               controller: _tabController,
//               labelColor: greenColor,
//               unselectedLabelColor: Colors.grey,
//               labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.yellow, fontSize: 17),
//               indicatorSize: TabBarIndicatorSize.label,
//               indicatorWeight: 3,
//               indicatorColor: greenColor,
//               isScrollable: true,
//               onTap: (val) {
//                 setState(() {
//                   _pageController.animateToPage(val, duration: Duration(seconds: 1), curve: Curves.easeInOut);
//                   bottomNavbarIndex = val;
//                 });
//               },
//               tabs: [
//                 Tab(
//                   text: "For you",
//                 ),
//                 Tab(
//                   text: "Top charts",
//                 ),
//                 Tab(
//                   text: "Categories",
//                 ),
//                 Tab(
//                   text: "Editor's Choice",
//                 ),
//               ],
//             ),
//             const Divider(),
//             // page view
//             SizedBox(
//               height: 496,
//               child: PageView(
//                 controller: _pageController,
//                 onPageChanged: (val) {
//                   setState(() {
//                     _tabController.animateTo(val);
//                     bottomNavbarIndex = val;
//                   });
//                 },
//                 children: [
//                   SingleChildScrollView(
//                     child: Column(
//                       children: [
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 18),
//                           child: Row(
//                             children: [
//                               Text(
//                                 "Recommended for you",
//                                 style: TextStyle(
//                                   fontSize: 17,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               Spacer(),
//                               Icon(Icons.arrow_forward),
//                             ],
//                           ),
//                         ),
//                         SizedBox(
//                           height: 15,
//                         ),
//                         SizedBox(
//                           height: 150,
//                           width: 370,
//                           child: ListView.builder(
//                             scrollDirection: Axis.horizontal,
//                             itemCount: 10,
//                             itemBuilder: (BuildContext context, val) {
//                               return InkWell(
//                                 onTap: () => Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder: (context) => AppDetailsScreen(val: val),
//                                     )),
//                                 child: Hero(
//                                   tag: "${gameDetails[val]["tag"]}",
//                                   child: SizedBox(
//                                     height: 140,
//                                     width: 120,
//                                     child: Padding(
//                                       padding: const EdgeInsets.only(left: 15),
//                                       child: Column(
//                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                         children: [
//                                           Container(
//                                             height: 105,
//                                             width: 105,
//                                             decoration: BoxDecoration(
//                                               color: Colors.redAccent,
//                                               borderRadius: BorderRadius.circular(10),
//                                               image: DecorationImage(image: AssetImage("${gameDetails[val]["image"]}")),
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: 5,
//                                           ),
//                                           Text("${gameDetails[val]["name"]}", style: TextStyle(fontSize: 16)),
//                                           Row(
//                                             children: [
//                                               Text(
//                                                 "${gameDetails[val]["rating"]}",
//                                                 style: TextStyle(fontSize: 16),
//                                               ),
//                                               Icon(
//                                                 Icons.star,
//                                                 size: 14,
//                                               ),
//                                             ],
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               );
//                             },
//                           ),
//                         ),
//
//                         /// second Roww
//                         SizedBox(
//                           height: 20,
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 18),
//                           child: Row(
//                             children: [
//                               Text(
//                                 "New & Updated apps",
//                                 style: TextStyle(
//                                   fontSize: 17,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               Spacer(),
//                               Icon(Icons.arrow_forward),
//                             ],
//                           ),
//                         ),
//                         SizedBox(
//                           height: 15,
//                         ),
//                         SizedBox(
//                           height: 150,
//                           width: 370,
//                           child: ListView.builder(
//                             scrollDirection: Axis.horizontal,
//                             itemCount: 10,
//                             itemBuilder: (BuildContext context, val) {
//                               return InkWell(
//                                 onTap: () => Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder: (context) => AppDetailsScreen(val: val),
//                                     )),
//                                 child: SizedBox(
//                                   height: 140,
//                                   width: 120,
//                                   child: Padding(
//                                     padding: const EdgeInsets.only(left: 15),
//                                     child: Column(
//                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       children: [
//                                         Container(
//                                           height: 105,
//                                           width: 105,
//                                           decoration: BoxDecoration(
//                                             color: Colors.deepOrangeAccent,
//                                             borderRadius: BorderRadius.circular(10),
//                                             image: DecorationImage(
//                                               image: AssetImage("${gameDetails[9 - val]["image"]}"),
//                                             ),
//                                           ),
//                                         ),
//                                         SizedBox(
//                                           height: 5,
//                                         ),
//                                         Text("${gameDetails[9 - val]["name"]}", style: TextStyle(fontSize: 16)),
//                                         Row(
//                                           children: [
//                                             Text(
//                                               "${gameDetails[9 - val]["rating"]}",
//                                               style: TextStyle(fontSize: 16),
//                                             ),
//                                             Icon(
//                                               Icons.star,
//                                               size: 14,
//                                             ),
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               );
//                             },
//                           ),
//                         ),
//
//                         /// Third Roww
//                         SizedBox(
//                           height: 20,
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 18),
//                           child: Row(
//                             children: [
//                               Text(
//                                 "Suggested for you",
//                                 style: TextStyle(
//                                   fontSize: 17,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               Spacer(),
//                               Icon(Icons.arrow_forward),
//                             ],
//                           ),
//                         ),
//                         SizedBox(
//                           height: 15,
//                         ),
//                         SizedBox(
//                           height: 150,
//                           width: 370,
//                           child: ListView.builder(
//                             scrollDirection: Axis.horizontal,
//                             itemCount: 10,
//                             itemBuilder: (BuildContext context, val) {
//                               return InkWell(
//                                 child: SizedBox(
//                                   height: 140,
//                                   width: 120,
//                                   child: Padding(
//                                     padding: const EdgeInsets.only(left: 15),
//                                     child: Column(
//                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       children: [
//                                         Container(
//                                           height: 105,
//                                           width: 105,
//                                           decoration: BoxDecoration(
//                                             color: Colors.orangeAccent,
//                                             borderRadius: BorderRadius.circular(10),
//                                           ),
//                                         ),
//                                         SizedBox(
//                                           height: 5,
//                                         ),
//                                         Text("Title", style: TextStyle(fontSize: 16)),
//                                         Row(
//                                           children: [
//                                             Text(
//                                               "4.2",
//                                               style: TextStyle(fontSize: 16),
//                                             ),
//                                             Icon(
//                                               Icons.star,
//                                               size: 14,
//                                             ),
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               );
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SingleChildScrollView(
//                     child: Column(
//                       children: [
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 18),
//                           child: Row(
//                             children: [
//                               Text(
//                                 "Show installed apps",
//                                 style: TextStyle(
//                                   fontSize: 17,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               Spacer(),
//                               Switch(
//                                 activeColor: greenColor,
//                                 value: isSwitch,
//                                 onChanged: (val) {
//                                   setState(() {
//                                     isSwitch = val;
//                                   });
//                                 },
//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(
//                           height: 35,
//                           width: 400,
//                           child: Padding(
//                             padding: const EdgeInsets.only(left: 18),
//                             child: ListView(
//                               scrollDirection: Axis.horizontal,
//                               children: [
//                                 Container(
//                                   height: 30,
//                                   width: 100,
//                                   decoration: BoxDecoration(
//                                     color: greenColor.withOpacity(0.1),
//                                     borderRadius: BorderRadius.circular(30),
//                                   ),
//                                   child: Center(
//                                     child: Text(
//                                       "Top free",
//                                       style: TextStyle(color: greenColor, fontSize: 15, fontWeight: FontWeight.bold),
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   width: 15,
//                                 ),
//                                 Container(
//                                   height: 30,
//                                   width: 130,
//                                   decoration: BoxDecoration(
//                                     border: Border.all(color: Colors.grey.withOpacity(0.7), width: 1),
//                                     borderRadius: BorderRadius.circular(30),
//                                   ),
//                                   child: Center(
//                                     child: Text(
//                                       "Top grossing",
//                                       style: TextStyle(
//                                         color: Colors.black.withOpacity(0.7),
//                                         fontSize: 15,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   width: 15,
//                                 ),
//                                 Container(
//                                   height: 30,
//                                   width: 100,
//                                   decoration: BoxDecoration(
//                                     border: Border.all(
//                                       color: Colors.grey.withOpacity(0.7),
//                                       width: 1,
//                                     ),
//                                     borderRadius: BorderRadius.circular(30),
//                                   ),
//                                   child: Center(
//                                     child: Text(
//                                       "Tranding",
//                                       style: TextStyle(
//                                         color: Colors.black.withOpacity(0.7),
//                                         fontSize: 15,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   width: 15,
//                                 ),
//                                 Container(
//                                   height: 30,
//                                   width: 100,
//                                   decoration: BoxDecoration(
//                                     border: Border.all(color: Colors.grey.withOpacity(0.7), width: 1),
//                                     borderRadius: BorderRadius.circular(30),
//                                   ),
//                                   child: Center(
//                                     child: Text(
//                                       "Top paid",
//                                       style: TextStyle(color: Colors.black.withOpacity(0.7), fontSize: 15, fontWeight: FontWeight.bold),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         Container(
//                           height: 380,
//                           width: 350,
//                           child: ListView.builder(
//                               itemCount: 10,
//                               scrollDirection: Axis.vertical,
//                               itemBuilder: (BuildContext context, index) {
//                                 return InkWell(
//                                   onTap: () {
//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                         builder: (context) => AppDetailsScreen(val: index),
//                                       ),
//                                     );
//                                   },
//                                   child: ListTile(
//                                     title: Text("${gameDetails[index]["name"]}"),
//                                     subtitle: Text("${gameDetails[index]["developer"]}"),
//                                     leading: SizedBox(
//                                       width: 90,
//                                       child: Row(
//                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Text("${index + 1}"),
//                                           Container(
//                                             height: 60,
//                                             width: 60,
//                                             decoration: BoxDecoration(
//                                               color: Colors.greenAccent,
//                                               borderRadius: BorderRadius.circular(10),
//                                               image: DecorationImage(
//                                                 image: AssetImage("${gameDetails[index]["image"]}"),
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 );
//                               }),
//                         )
//                       ],
//                     ),
//                   ),
//                   Center(
//                     child: Text("Page 3"),
//                   ),
//                   Center(
//                     child: Text("Page 4"),
//                   ),
//                 ],
//               ),
//             ),
//             // bottom bar
//             BottomNavigationBar(
//               currentIndex: bottomNavbarIndex,
//               backgroundColor: greenColor,
//               unselectedItemColor: Colors.grey,
//               showUnselectedLabels: true,
//               unselectedLabelStyle: const TextStyle(
//                 color: Colors.grey,
//               ),
//               selectedItemColor: greenColor,
//               selectedFontSize: 16,
//               onTap: (val) {
//                 log(val.toString(), name: "Value : ");
//                 setState(() {
//                   _tabController.animateTo(val);
//                   _pageController.animateToPage(
//                     val,
//                     duration: const Duration(milliseconds: 200),
//                     curve: Curves.linear,
//                   );
//                   bottomNavbarIndex = val;
//                 });
//               },
//               items: const [
//                 BottomNavigationBarItem(
//                   icon: Icon(Icons.games),
//                   label: "Games",
//                 ),
//                 BottomNavigationBarItem(
//                   icon: Icon(Icons.apps),
//                   label: "Apps",
//                 ),
//                 BottomNavigationBarItem(
//                   icon: Icon(Icons.movie),
//                   label: "Movies & TV",
//                 ),
//                 BottomNavigationBarItem(
//                   icon: Icon(Icons.book),
//                   label: "Books",
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }