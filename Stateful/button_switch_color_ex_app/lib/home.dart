import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Property
  late bool switchValue;
  late Color appColor;

  @override
  void initState(){
    super.initState();
    switchValue = false;
    appColor = Colors.blue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        foregroundColor: Colors.white,
        centerTitle: false,
        title: Text("Changed Button color on Switch")
        ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
              checkColor();
              setState(() {});
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: appColor,
                foregroundColor: Colors.white
              ),
              child: Text("Flutter")
              ),
            Switch(
              value: switchValue,
              onChanged: (value) {
                checkColor();
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  } // build

  // ------- Function -------
  checkColor(){
    if (switchValue == false) {
      switchValue = true;
      appColor = Colors.red;
    } else {
      switchValue = false;
      appColor = Colors.blue;
    }
  }
}