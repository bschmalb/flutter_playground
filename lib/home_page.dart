import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_playground/menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  bool showMenu = false;

  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    controller = AnimationController(duration: const Duration(milliseconds: 400), vsync: this);
    animation =
        Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn));
    super.initState();
  }

  static Matrix4 _pmat(num pv) {
    return Matrix4(
      1.0, 0.0, 0.0, 0.0, //
      0.0, 1.0, 0.0, 0.0, //
      0.0, 0.0, 1.0, pv * 0.001, //
      0.0, 0.0, 0.0, 1.0,
    );
  }

  Matrix4 perspective = _pmat(1.0);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const MenuPage(),
        AnimatedBuilder(
          animation: animation,
          builder: (BuildContext context, Widget? child) {
            return Transform(
              alignment: FractionalOffset.centerRight,
              transform: perspective.scaled(1.0, 1.0, 1.0)
                ..rotateX(0)
                ..rotateY((animation.value * 70) * pi / 180)
                ..rotateZ(0.0),
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: const Color(0xFFD0D0D0),
                  borderRadius: BorderRadius.circular(45.0 * (animation.value * 100).clamp(0, 1)),
                ),
                child: const Icon(Icons.home, size: 150),
              ),
            );
          },
        ),
        Positioned(
          top: 30,
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              if (controller.status == AnimationStatus.dismissed) controller.forward();
              if (controller.status == AnimationStatus.completed) controller.reverse();
            },
            child: const Padding(
              padding: EdgeInsets.all(32.0),
              child: Icon(Icons.menu_rounded, size: 25),
            ),
          ),
        ),
      ],
    );
  }
}
