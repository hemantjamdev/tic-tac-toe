import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tic/constants/strings.dart';

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
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Strings.gameTitle,
      themeMode: ThemeMode.system,
      home: MyHomePage(),
    );
  }
}
