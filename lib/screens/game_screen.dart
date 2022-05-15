import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic/provider/game_provider.dart';
import 'package:tic/widgets/dialog.dart';

import '../constants/colors.dart';

class GridScreen extends StatelessWidget {
  const GridScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("------game screen build screen called------");
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Consumer<GameProvider>(builder: (context, provider, child) {
              return Text(
                provider.player1Name,
                style: const TextStyle(
                  fontSize: 68,
                  color: MyColor.whiteColor,
                ),
              );
            }),
          ),
          GridView.builder(
            shrinkWrap: true,
            itemCount: 9,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3),
            itemBuilder: (BuildContext context, int index) {
              return Consumer<GameProvider>(
                  builder: (context, provider, child) {
                return GestureDetector(
                  onTap: () {
                    provider.playVibration();
                    provider.playSound();
                    provider.addToList1(context, index);
                    bool win = provider.checkConditionForWin();
                    if (win) {
                      buildShowDialog(context,
                              "${provider.player1 ? provider.player1Name : provider.player2Name} is won")
                          .then(
                        (isReset) => isReset ? provider.resetGame() : null,
                      );
                    }
                  },
                  child: Card(
                    color: MyColor.cardColor,
                    elevation: 10,
                    child: Center(
                      child: Text(
                        provider.player1List[index].isNotEmpty
                            ? provider.player1List[index]
                            : "",
                        style: TextStyle(
                          fontSize: 68,
                          color: provider.player1List[index] == 'X'
                              ? MyColor.whiteColor
                              : MyColor.blackColor,
                        ),
                      ),
                    ),
                  ),
                );
              });
            },
          ),
          Consumer<GameProvider>(builder: (context, provider, child) {
            return Text(
              provider.player2Name,
              style: const TextStyle(
                fontSize: 68,
                color: MyColor.blackColor,
              ),
            );
          }),
        ],
      ),
    );
  }
}
