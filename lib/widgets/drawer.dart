import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/game_provider.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Consumer<GameProvider>(builder: (context, provider, child) {
        return Column(
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: Image.asset(
                'assets/images/tic.png',
                fit: BoxFit.fill,
                height: double.infinity,
                width: double.infinity,
              ),
            ),
            SwitchListTile(
              title: const Text("Sound"),
              value: provider.sound,
              onChanged: (value) {
                provider.changeSound(value);
              },
            ),
            SwitchListTile(
              title: const Text("Vibration"),
              value: provider.vibrate,
              onChanged: (value) {
                provider.changeVibration(value);
              },
            ),

            ListTile(
              leading: const Icon(Icons.person),
              title: TextFormField(
                autofocus: true,
                focusNode: provider.player1Focus,
                enabled: provider.player1NameEnable,
                decoration: const InputDecoration(border: InputBorder.none),
                controller: provider.player1Controller,
                onFieldSubmitted: (value){
                  provider
                      .changePlayer1Name(provider.player1Controller.text);
                  provider.enablePlayer1Field(false);
                },
              ),
              trailing: provider.player1NameEnable
                  ? IconButton(
                      onPressed: () {
                        provider
                            .changePlayer1Name(provider.player1Controller.text);
                        provider.enablePlayer1Field(false);
                      },
                      icon: const Icon(Icons.done))
                  : IconButton(
                      onPressed: () => provider.enablePlayer1Field(true),
                      icon: const Icon(Icons.edit),
                    ),
            ),

            /// player 2
            ListTile(
              leading: const Icon(Icons.person),
              title: TextFormField(
                autofocus: true,
                focusNode: provider.player2Focus,
                enabled: provider.player2NameEnable,
                decoration: const InputDecoration(border: InputBorder.none),
                controller: provider.player2Controller,
                onFieldSubmitted: (value){
                  provider
                      .changePlayer2Name(provider.player2Controller.text);
                  provider.enablePlayer2Field(false);
                },
              ),
              trailing: provider.player2NameEnable
                  ? IconButton(
                      onPressed: () {
                        provider
                            .changePlayer2Name(provider.player2Controller.text);
                        provider.enablePlayer2Field(false);
                      },
                      icon: const Icon(Icons.done))
                  : IconButton(
                      onPressed: () => provider.enablePlayer2Field(true),
                      icon: const Icon(Icons.edit),
                    ),
            )
          ],
        );
      }),
    );
  }
}
