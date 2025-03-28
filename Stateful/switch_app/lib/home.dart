import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Property
  late bool switchValue;
  late String appBarTitle;
  late String pokemon;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    switchValue = false;
    appBarTitle = "Pikachu";
    pokemon = "images/pikachu-1.jpg";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(appBarTitle)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(pokemon, width: 200, height: 200),
            Switch(
              value: switchValue,
              onChanged: (value) {
                // 사용자가 바꿨을 때 value
                checkScreen();
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  } // build

  // ----- Functions ----- //
  checkScreen() {
    if (switchValue == false) {
      switchValue = true;
      appBarTitle = "Raichu";
      pokemon = "images/raichu.jpeg";
    } else {
      switchValue = false;
      appBarTitle = "Pikachu";
      pokemon = "images/pikachu-1.jpg";
    }
  }
} // Class