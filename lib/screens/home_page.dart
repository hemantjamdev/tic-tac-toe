import 'package:flutter/material.dart';
import 'package:tic/constants/colors.dart';
import 'package:tic/screens/game_screen.dart';
import 'package:tic/widgets/drawer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    print("------home screen build screen called------");

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: MyColor.backGroundColor,
      ),
      drawer: const CustomDrawer(),
      backgroundColor: MyColor.backGroundColor,
      body: const SafeArea(
        child: GridScreen(),
      ),
    );
  }
}
