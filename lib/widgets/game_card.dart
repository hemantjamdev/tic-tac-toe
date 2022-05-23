import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';
import 'package:tic/provider/game_provider.dart';
import 'package:tic/widgets/dialog.dart';

import '../constants/colors.dart';

Widget neumorphicCard(int index) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Consumer<GameProvider>(
      builder: (context, provider, child) {
        return GestureDetector(
          onTap: () {
            provider.playVibration();
            provider.playSound();
            provider.addToList1(context, index);
            bool win = provider.checkConditionForWin();
            if (win) {
              buildShowDialog(context,
                      "${!provider.player1 ? provider.player1Name : provider.player2Name} is won")
                  .then(
                (isReset) => isReset ? provider.resetGame() : null,
              );
            }
          },
          child: Neumorphic(
            style: NeumorphicStyle(
              color: Colors.lightBlueAccent[100],
              shape: provider.player1List[index].isNotEmpty
                  ? NeumorphicShape.concave
                  : NeumorphicShape.convex,
              depth: 8,
              oppositeShadowLightSource: false,
              intensity: 8,
            ),
            child: Center(
              child: NeumorphicText(
                provider.player1List[index].isNotEmpty
                    ? provider.player1List[index]
                    : "",
                textStyle: NeumorphicTextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 68,
                ),
                style: NeumorphicStyle(
                  shape: NeumorphicShape.convex,
                  color: provider.player1List[index] == 'X'
                      ? MyColor.whiteColor
                      : MyColor.blackColor,
                  depth: 5,
                  oppositeShadowLightSource: false,
                  intensity: 1,
                  shadowDarkColor: Colors.lightBlueAccent[100],
                  shadowLightColor: Colors.blue,
                ),
              ),
            ),
          ),
        );
      },
    ),
  );
}
