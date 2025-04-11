import 'package:flutter/material.dart';

import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState () => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Property
  ThemeMode _themeMode = ThemeMode.system;

  _changeThemeMode(ThemeMode themeMode){
    _themeMode = themeMode;
    setState(() {});
  }

    static const seedColor = Colors.deepPurple;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: _themeMode,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorSchemeSeed: seedColor
      ),
      theme: ThemeData(
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(seedColor: seedColor),
      ),
      home: Home(onChangeTheme: _changeThemeMode),
    );
  }
}