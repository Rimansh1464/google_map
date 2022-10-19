import 'dart:math';

import 'package:flutter/material.dart';

class animation extends StatefulWidget {
  const animation({Key? key}) : super(key: key);

  @override
  State<animation> createState() => _animationState();
}

class _animationState extends State<animation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TweenAnimationBuilder(
                    curve: Curves.bounceOut,
                    tween: Tween<Offset>(begin: Offset(0, -300), end: Offset(0, 300)),
                    child: SizedBox(

                      child: Image.asset("asset/image/football_PNG52797.png",scale: 5,),
                    ),
                    duration: const Duration(seconds: 2),
                    builder: (context, dynamic vale, round) {
                      return Transform.translate(
                        offset: vale,
                        child: TweenAnimationBuilder(
                          tween: Tween<double>(
                            begin: 0,
                            end: pi * 2,
                          ),
                          child: SizedBox(

                            child: Image.asset("asset/image/football_PNG52797.png",scale: 5,),
                          ),
                          duration: const Duration(seconds: 2),
                          builder: (context, dynamic roted, round) {
                            return Transform.rotate(
                              angle: roted,
                              child: TweenAnimationBuilder(
                                tween: ColorTween(
                                  begin: Colors.yellow,
                                  end: Colors.white,
                                ),
                                child: SizedBox(

                                  child: Image.asset("asset/image/football_PNG52797.png",scale:3.5,),
                                ),
                                duration: const Duration(seconds: 2),
                                builder: (context, dynamic Color, round) {
                                  return ColorFiltered(
                                      colorFilter: ColorFilter.mode(Color,BlendMode.modulate),
                                      child: round
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TweenAnimationBuilder(
                    curve: Curves.bounceOut,
                    tween: Tween<Offset>(begin: Offset(0, -300), end: Offset(0, 300)),
                    child: SizedBox(

                      child: Image.asset("asset/image/football_PNG52797.png",scale: 5,),
                    ),
                    duration: const Duration(seconds: 10),
                    builder: (context, dynamic vale, round) {
                      return Transform.translate(
                        offset: vale,
                        child: TweenAnimationBuilder(
                          tween: Tween<double>(
                            begin: 0,
                            end: pi * 2,
                          ),
                          child: SizedBox(

                            child: Image.asset("asset/image/football_PNG52797.png",scale: 5,),
                          ),
                          duration: const Duration(seconds: 10),
                          builder: (context, dynamic roted, round) {
                            return Transform.rotate(
                              angle: roted,
                              child: TweenAnimationBuilder(
                                tween: ColorTween(
                                  begin: Colors.yellow,
                                  end: Colors.white,
                                ),
                                child: SizedBox(

                                  child: Image.asset("asset/image/football_PNG52797.png",scale:8,),
                                ),
                                duration: const Duration(seconds: 10),
                                builder: (context, dynamic Color, round) {
                                  return ColorFiltered(
                                      colorFilter: ColorFilter.mode(Color,BlendMode.modulate),
                                      child: round
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TweenAnimationBuilder(
                    curve: Curves.bounceOut,
                    tween: Tween<Offset>(begin: Offset(0, -300), end: Offset(0, 300)),
                    child: SizedBox(

                      child: Image.asset("asset/image/football_PNG52797.png",scale: 5,),
                    ),
                    duration: const Duration(seconds: 5),
                    builder: (context, dynamic vale, round) {
                      return Transform.translate(
                        offset: vale,
                        child: TweenAnimationBuilder(
                          tween: Tween<double>(
                            begin: 0,
                            end: pi * 2,
                          ),
                          child: SizedBox(

                            child: Image.asset("asset/image/football_PNG52797.png",scale: 5,),
                          ),
                          duration: const Duration(seconds: 5),
                          builder: (context, dynamic roted, round) {
                            return Transform.rotate(
                              angle: roted,
                              child: TweenAnimationBuilder(
                                tween: ColorTween(
                                  begin: Colors.yellow,
                                  end: Colors.white,
                                ),
                                child: SizedBox(

                                  child: Image.asset("asset/image/football_PNG52797.png",scale:3.5,),
                                ),
                                duration: const Duration(seconds: 5),
                                builder: (context, dynamic Color, round) {
                                  return ColorFiltered(
                                      colorFilter: ColorFilter.mode(Color,BlendMode.modulate),
                                      child: round
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

