import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';

import '../constants/strings.dart';
import '../widgets/dialog.dart';

class GameProvider extends ChangeNotifier {
  bool sound = false;
  bool vibrate = false;
  List<String> player1List = ['', '', '', '', '', '', '', '', ''];
  List tempList = [];
  bool player1 = true;
  String player1Name = "Player-1";
  String player2Name = "Player-2";
  bool player1NameEnable = false;
  bool player2NameEnable = false;
  TextEditingController player1Controller =
      TextEditingController(text: "Player-1");
  TextEditingController player2Controller =
      TextEditingController(text: "Player-2");
  FocusNode player1Focus = FocusNode();
  FocusNode player2Focus = FocusNode();

  void enablePlayer1Field(bool value) {
    player1NameEnable = value;
    if (value) {
      Future.delayed(const Duration(milliseconds: 10), () {
        player1Focus.requestFocus();
      });
    }
    notifyListeners();
  }

  void enablePlayer2Field(bool value) {
    player2NameEnable = value;
    if (value) {
      Future.delayed(const Duration(milliseconds: 10), () {
        player2Focus.requestFocus();
      });
    }
    notifyListeners();
  }

  void changePlayer1Name(String name) {
    player1Controller.text = name;
    player1Name = name;
    notifyListeners();
  }

  void changePlayer2Name(String name) {
    player2Controller.text = name;
    player2Name = name;
    notifyListeners();
  }

  void playSound() async {
    AudioCache cache = AudioCache();
    if (sound) {
      await cache.play("audio/player1.wav");
    }
  }

  void playVibration() {
    if (Vibration.hasVibrator() != null) {
      if (vibrate) {
        Vibration.vibrate(duration: 100);
      }
    }
  }

  void addToList1(BuildContext context, int number) async {
    String value = "";

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
    notifyListeners();
  }

  void resetGame() {
    player1List = ['', '', '', '', '', '', '', '', ''];
    tempList.clear();
    player1 = true;
    notifyListeners();
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
      notifyListeners();
      return true;
    } else {
      notifyListeners();
      return false;
    }
  }

  void changeSound(bool isSoundOn) {
    sound = isSoundOn;
    notifyListeners();
  }

  void changeVibration(bool isVibrate) {
    vibrate = isVibrate;
    notifyListeners();
  }
}
