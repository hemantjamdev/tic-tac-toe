import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/game_provider.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  FocusNode player1Focus = FocusNode();
  FocusNode player2Focus = FocusNode();
  TextEditingController player1Controller =
      TextEditingController(text: "player-1");
  TextEditingController player2Controller =
      TextEditingController(text: 'player-2');

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Consumer<GameProvider>(
        builder: (context, provider, child) {
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
                  focusNode: player1Focus,
                  enabled: provider.player1NameEnable,
                  decoration: const InputDecoration(border: InputBorder.none),
                  controller: player1Controller,
                  onFieldSubmitted: (value) {
                    provider.changePlayer1Name(
                      name: player1Controller.text,
                      player1Controller: player1Controller,
                    );
                    provider.enablePlayer1Field(
                      value: false,
                      player1Focus: player1Focus,
                    );
                  },
                ),
                trailing: provider.player1NameEnable
                    ? IconButton(
                        onPressed: () {
                          provider.changePlayer1Name(
                            name: player1Controller.text,
                            player1Controller: player1Controller,
                          );
                          provider.enablePlayer1Field(
                            value: false,
                            player1Focus: player1Focus,
                          );
                        },
                        icon: const Icon(Icons.done))
                    : IconButton(
                        onPressed: () => provider.enablePlayer1Field(
                            value: true, player1Focus: player1Focus),
                        icon: const Icon(Icons.edit),
                      ),
              ),

              /// player 2
              ListTile(
                leading: const Icon(Icons.person),
                title: TextFormField(
                  autofocus: true,
                  focusNode: player2Focus,
                  enabled: provider.player2NameEnable,
                  decoration: const InputDecoration(border: InputBorder.none),
                  controller: player2Controller,
                  onFieldSubmitted: (value) {
                    provider.changePlayer2Name(
                        name: player2Controller.text,
                        player2Controller: player2Controller);
                    provider.enablePlayer2Field(
                      value: false,
                      player2Focus: player2Focus,
                    );
                  },
                ),
                trailing: provider.player2NameEnable
                    ? IconButton(
                        onPressed: () {
                          provider.changePlayer2Name(
                              name: player2Controller.text,
                              player2Controller: player2Controller);
                          provider.enablePlayer2Field(
                            value: false,
                            player2Focus: player2Focus,
                          );
                        },
                        icon: const Icon(Icons.done))
                    : IconButton(
                        onPressed: () => provider.enablePlayer2Field(
                            value: true, player2Focus: player2Focus),
                        icon: const Icon(
                          Icons.edit,
                        ),
                      ),
              )
            ],
          );
        },
      ),
    );
  }
}
