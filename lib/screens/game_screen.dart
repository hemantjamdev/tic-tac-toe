import 'package:flutter/material.dart';
import 'package:tic/constants/strings.dart';
import 'package:tic/widgets/dialog.dart';

import '../constants/colors.dart';

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  List<String> player1List = ['', '', '', '', '', '', '', '', ''];
  List tempList = [];
  bool player1 = true;

  void addToList1(int number) async {
    String value = "";
    setState(
      () {
        if (player1) {
          value = Strings.x;
        } else {
          value = Strings.o;
        }

        if (player1List[number].isEmpty) {
          if (tempList.length < 8) {
            player1List[number] = value;
            player1 = !player1;
            tempList.add(value);
          } else {
            player1List[number] = value;
            buildShowDialog(context, Strings.gameOver).then(
              (isReset) => isReset ? resetGame() : null,
            );
          }
        }
      },
    );
  }

  void resetGame() {
    setState(() {
      player1List = ['', '', '', '', '', '', '', '', ''];
      tempList.clear();
      player1 = true;
    });
  }

  bool checkConditionForWin() {
    if (

        /// these conditions for player 1-x
        ((player1List[0] == "X" &&
                    player1List[1] == "X" &&
                    player1List[2] == "X") ||
                (player1List[0] == "X" &&
                    player1List[3] == "X" &&
                    player1List[6] == "X") ||
                (player1List[0] == "X" &&
                        player1List[4] == "X" &&
                        player1List[8] == "X" ||
                    (player1List[3] == "X" &&
                        player1List[4] == "X" &&
                        player1List[5] == "X") ||
                    (player1List[6] == "X" &&
                        player1List[7] == "X" &&
                        player1List[8] == "X")) ||
                (player1List[6] == "X" &&
                    player1List[2] == "X" &&
                    player1List[4] == "X") ||
                (player1List[1] == "X" &&
                    player1List[4] == "X" &&
                    player1List[7] == "X") ||
                (player1List[2] == "X" &&
                    player1List[5] == "X" &&
                    player1List[8] == "X")) ||

            /// these conditions for player 2 - 0
            ((player1List[0] == "0" &&
                    player1List[1] == "0" &&
                    player1List[2] == "0") ||
                (player1List[0] == "0" &&
                    player1List[3] == "0" &&
                    player1List[6] == "0") ||
                (player1List[0] == "0" &&
                        player1List[4] == "0" &&
                        player1List[8] == "0" ||
                    (player1List[3] == "0" &&
                        player1List[4] == "0" &&
                        player1List[5] == "0") ||
                    (player1List[6] == "0" &&
                        player1List[7] == "0" &&
                        player1List[8] == "0")) ||
                (player1List[6] == "0" &&
                    player1List[2] == "0" &&
                    player1List[4] == "0") ||
                (player1List[1] == "0" &&
                    player1List[4] == "0" &&
                    player1List[7] == "0") ||
                (player1List[2] == "0" &&
                    player1List[5] == "0" &&
                    player1List[8] == "0"))) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.all(18.0),
          child: Text(
            Strings.player1,
            style: TextStyle(
              fontSize: 68,
              color: MyColor.whiteColor,
            ),
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          itemCount: 9,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                addToList1(index);
                bool win = checkConditionForWin();
                if (win) {
                  buildShowDialog(context,
                          "${player1 ? Strings.player2 : Strings.player1} is won")
                      .then(
                    (isReset) => isReset ? resetGame() : null,
                  );
                }
              },
              child: Card(
                color: MyColor.cardColor,
                elevation: 10,
                child: Center(
                  child: Text(
                    player1List[index].isNotEmpty ? player1List[index] : "",
                    style: TextStyle(
                      fontSize: 68,
                      color: player1List[index] == 'X'
                          ? MyColor.whiteColor
                          : MyColor.blackColor,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        const Text(
          Strings.player2,
          style: TextStyle(fontSize: 68, color: MyColor.blackColor),
        ),
      ],
    );
  }
}
