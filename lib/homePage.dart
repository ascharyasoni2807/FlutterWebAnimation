import 'dart:html';

import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'dart:math' as Math;
import 'package:supercharged/supercharged.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  int _counter = 0;

  AnimationController animation;
  Animation<double> _fadeInFadeOut;
  AnimationController controller;
  Animation _fadeInFadeOut2;
  GlobalKey keyselect = GlobalKey();
  animation1() {
    animation = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    _fadeInFadeOut = Tween<double>(begin: 0.0, end: 1).animate(animation);
    animation.forward();
  }

  @override
  void initState() {
    super.initState();
    animation1();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Anomation'),
      // ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Color(0xfffae1dd),

          // color: Colors.blue,
          child: Center(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Container(
                height: MediaQuery.of(context).size.height,
                // width: MediaQuery.of(context).size.width * 0.9,
                // color: Colors.amberAccent,
                margin: EdgeInsets.all(10),
                child: Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      // color: Colors.greenAccent,
                      child: Column(
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: FadeTransition(
                                opacity: _fadeInFadeOut,
                                child: LayoutBuilder(
                                    builder: (context, constraints) {
                                  debugPrint(
                                      'Max height: ${constraints.maxHeight}, max width: ${constraints.maxWidth}');
                                  return Container(
                                    key: keyselect,
                                    height: MediaQuery.of(context).size.height *
                                        0.7,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        // color: Colors.deepPurple,
                                        image: DecorationImage(
                                            image: AssetImage("assets/boy.png"),
                                            fit: BoxFit.fitHeight)),
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.44,
                                          bottom: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.48,
                                          child: Stack(
                                            children: [
                                              Bubble(),
                                              Positioned(
                                                  top: 45,
                                                  left: 60,
                                                  child: Rupees()),
                                            ],
                                          ),
                                        ),
                                        Positioned(
                                            left: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.04,
                                            child: ButterFly())
                                      ],
                                    ),
                                  );
                                }),
                              )),
                          StringText()
                        ],
                      ),
                    ),
                    // ButterFly()
                  ],
                ),
              ),
            ),
          )),
    );
  }
}

class Bubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PlayAnimation<double>(
      tween: Tween<double>(begin: 0.0, end: 130.0),
      duration: Duration(milliseconds: 700),
      delay: Duration(seconds: 3),

      // curve: Curves, // <-- specify widget called "child"
      builder: (context, child, value) {
        // <-- obtain child from builder function parameter
        return Container(
          padding: EdgeInsets.all(8),
          height: value,
          width: value,
          decoration: BoxDecoration(
              // color: Colors.redAccent,

              image: DecorationImage(
                  image: AssetImage("assets/bubble.png"), fit: BoxFit.contain)),
        );
      },
    );
  }
}

class Rupees extends StatelessWidget {
  const Rupees({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlayAnimation<double>(
        tween: Tween<double>(begin: 0.0, end: 1.0),
        duration: Duration(milliseconds: 800),
        delay: Duration(seconds: 4),
        // curve: Curves, // <-- specify widget called "child"
        builder: (context, child, value) {
          return Opacity(
            opacity: value,
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  // color: Colors.cyanAccent,
                  image: DecorationImage(
                      image: AssetImage("assets/rupee.png"),
                      fit: BoxFit.contain)),
            ),
          );
        });
  }
}

enum AniProps { x, y }

class ButterFly extends StatelessWidget {
  final _tween = TimelineTween<AniProps>()
    ..addScene(begin: Duration(seconds: 0), duration: Duration(seconds: 3))
        .animate(AniProps.x, tween: Tween<double>(begin: 700, end: 200))
    ..addScene(begin: Duration(seconds: 0), duration: Duration(seconds: 1))
        .animate(AniProps.y, tween: Tween<double>(begin: 40, end: 100))
    ..addScene(begin: Duration(seconds: 1), duration: Duration(seconds: 1))
        .animate(AniProps.y, tween: Tween<double>(begin: 100, end: 40))
    ..addScene(begin: Duration(seconds: 2), duration: Duration(seconds: 1))
        .animate(AniProps.y, tween: Tween<double>(begin: 40, end: 100))
    ..addScene(begin: Duration(seconds: 3), duration: Duration(seconds: 3))
        .animate(AniProps.x, tween: Tween<double>(begin: 200, end: 700))
    ..addScene(begin: Duration(seconds: 3), duration: Duration(seconds: 1))
        .animate(AniProps.y, tween: Tween<double>(begin: 100, end: 40))
    ..addScene(begin: Duration(seconds: 4), duration: Duration(seconds: 1))
        .animate(AniProps.y, tween: Tween<double>(begin: 40, end: 100))
    ..addScene(begin: Duration(seconds: 5), duration: Duration(seconds: 1))
        .animate(AniProps.y, tween: Tween<double>(begin: 100, end: 40));

  // ..addScene(begin: Duration(seconds: 2), duration: Duration(seconds: 3))
  //     .animate(AniProps.x, tween: Tween<double>(begin: 700, end: 100))

  @override
  Widget build(BuildContext context) {
    return PlayAnimation<double>(
        tween: Tween<double>(begin: 0.0, end: 1.0),
        duration: Duration(milliseconds: 800),
        delay: Duration(seconds: 5),
        // curve: Curves, // <-- specify widget called "child"
        builder: (context, child, value) {
          return Opacity(
            opacity: value,
            child: LoopAnimation<TimelineValue<AniProps>>(
                tween: _tween, // Pass in tween
                duration: _tween.duration, // Obtain duration
                builder: (context, child, value) {
                  return Transform.translate(
                    transformHitTests: false,
                    // Get animated offset
                    offset:
                        Offset(value.get(AniProps.x), value.get(AniProps.y)),
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/butterfly.gif"),
                              fit: BoxFit.contain)),
                    ),
                  );
                }),
          );
        });
  }
}

class StringText extends StatelessWidget {
  var stringText =
      'Adolescence is one of the most cruccial period for teenager and for those around them. It is also an important time as thats the time when you have to start thinking about your future in your personality, your career and more importantly yourself.';

  @override
  Widget build(BuildContext context) {
    return PlayAnimation<double>(
        tween: Tween<double>(begin: 0.0, end: 1.0),
        duration: Duration(milliseconds: 800),
        delay: Duration(seconds: 5),
        // curve: Curves, // <-- specify widget called "child"
        builder: (context, child, value) {
          return Opacity(
              opacity: value,
              child: Container(
                // height: 50,
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width * 0.60,
                child: Text(
                  stringText,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ));
        });
  }
}
