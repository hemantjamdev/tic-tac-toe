import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';
import 'package:tic/provider/game_provider.dart';

import '../widgets/game_card.dart';
import '../widgets/player_name.dart';

class GridScreen extends StatelessWidget {
  const GridScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("------game screen build screen called------");
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Consumer<GameProvider>(
              builder: (context, provider, child) {
                return neumorphicPlayerName(provider.player1Name);
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (BuildContext context, int index) {
                  return neumorphicCard(index);
                },
              ),
            ),
            Consumer<GameProvider>(
              builder: (context, provider, child) {
                return neumorphicPlayerName(
                  provider.player2Name,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
