import 'package:flutter/material.dart';

class CustomScroollView extends StatefulWidget {
  const CustomScroollView({Key? key}) : super(key: key);

  @override
  State<CustomScroollView> createState() => _CustomScroollViewState();
}

class _CustomScroollViewState extends State<CustomScroollView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                pinned: true,
                scrolledUnderElevation: 10,
                expandedHeight: 250,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text("Sliver"),
                  background: Image.asset(
                    "asset/image/pexels-photo-604684.webp",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ];
          },
          body:  SingleChildScrollView(
            child: Column(
                  children: [
                    Container(
                      height: 150,
                      color: Colors.yellow,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 150,
                      color: Colors.red,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 150,
                      color: Colors.black,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 150,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 150,
                      color: Colors.brown,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
          ),
      ),
    );
  }
}
