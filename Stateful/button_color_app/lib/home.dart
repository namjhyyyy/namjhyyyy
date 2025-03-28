import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Property(Field, Attribute)
  late String buttonState;
  late Color buttonColor;
  late double firstLength;
  late double secondLength;

  @override
  void initState(){
    super.initState();
    buttonState = 'Hello';
    buttonColor = Colors.blue;
    firstLength = 100;
    secondLength = 100;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: buttonColor,
        foregroundColor: Colors.white,
        centerTitle: false,
        title: Text("Change button color & text"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "images/pikachu-1.jpg",
                  width: firstLength,
                  height: firstLength,
                ),
                Image.asset(
                  "images/pikachu-2.jpg",
                  width: secondLength,
                  height: secondLength,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => _firstSizeUp(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black
                  ),
                  child: Text("1st Sizeup")
                ),
                ElevatedButton(
              onPressed: () => _onClick(),
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonColor,
                foregroundColor: Colors.white
              ),
              child: Text(buttonState)
            ),
            ElevatedButton(
              onPressed: () => _secondSizeUp(),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black
              ),
              child: Text("2nd Sizeup")
            ),
              ],
            ),
          ],
        ),
      ),
    );
  } // build

  // ------- Function -------
  _onClick(){
    (buttonState == "Hello") ? (buttonState = "Flutter",
      buttonColor = Colors.amber,
      firstLength = 100, secondLength = 100) 
      : (buttonState = "Hello",
      buttonColor = Colors.blue,
      firstLength = 100, secondLength = 100);
      setState(() {});
  }
  _firstSizeUp(){
    firstLength += 5;
    secondLength -= 5;
    setState(() {});
  }
  _secondSizeUp(){
    secondLength += 5;
    firstLength -= 5;
    setState(() {});
  }
} // Class