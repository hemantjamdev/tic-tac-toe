import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../constants/colors.dart';

Widget neumorphicPlayerName(String text) {
  return Neumorphic(
    style: const NeumorphicStyle(
        shape: NeumorphicShape.convex,
        depth: 8,
        oppositeShadowLightSource: false,
        intensity: 8),
    child: SizedBox(
      width: double.infinity,
      child: NeumorphicText(
        text,
        textStyle: NeumorphicTextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 68,
        ),
        style: const NeumorphicStyle(
          shape: NeumorphicShape.flat,
          color: MyColor.whiteColor,
          depth: 10,
          oppositeShadowLightSource: false,
          intensity: 1,
        ),
      ),
    ),
  );
}
