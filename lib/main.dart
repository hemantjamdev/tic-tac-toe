import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tic/constants/strings.dart';
import 'package:tic/provider/game_provider.dart';

import 'screens/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
        (value) => runApp(const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GameProvider>(
      create: (context) => GameProvider(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: Strings.gameTitle,
        themeMode: ThemeMode.system,
        home: MyHomePage(),
      ),
    );
  }
}
