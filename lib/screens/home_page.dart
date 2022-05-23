import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:tic/constants/colors.dart';
import 'package:tic/screens/game_screen.dart';
import 'package:tic/widgets/drawer.dart';

import '../constants/strings.dart';
import '../widgets/app_bar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    print("------home screen build screen called------");

    return Neumorphic(
      style: NeumorphicStyle(
          color: Colors.lightBlueAccent[100],
          shape:NeumorphicShape.convex,
          depth: 8,
          oppositeShadowLightSource: false,
          intensity: 8),
      child: Scaffold(
        appBar:NeumorphicAppBar(
            title: NeumorphicText(Strings.gameTitle,
                textStyle: NeumorphicTextStyle(fontSize: 26),
                style: const NeumorphicStyle(color: MyColor.blackColor)),
            centerTitle: true),
        drawer: const CustomDrawer(),
        backgroundColor: MyColor.whiteColor,
        body:  SafeArea(
          child: GridScreen(),
        ),
      ),
    );
  }
}
