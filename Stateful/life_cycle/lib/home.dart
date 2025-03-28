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
  late Color buttonTextColor;

  @override
  void initState(){
    super.initState();
    buttonState = 'OFF';
    buttonColor = Colors.blue;
    buttonTextColor = Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Life cycle"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _onClick(),
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonColor,
                foregroundColor: buttonTextColor,
              ),
              child: Text("버튼을 누르세요")
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("버튼 상태: "),
                Text(buttonState)
              ],
            )
          ],
        ),
      ),
    );
  } // build

  // ------ Functions ------
  _onClick(){
    
    /*buttonState = "ON";
    print(buttonState);
    setState(() {});*/   // Property를 바꿈(혹은 초기 상태를 바꿈)
    
    /*if(buttonState == "OFF"){
      buttonState = "ON";
      buttonColor = Colors.red;
      buttonTextColor = Colors.black;
      setState(() {});
    }else{
      buttonState = "OFF";
      buttonColor = Colors.blue;
      buttonTextColor = Colors.white;
      setState(() {});
    }*/

    (buttonState == "OFF") ? (buttonState = "ON",
      buttonColor = Colors.red,
      buttonTextColor = Colors.black) 
      : (buttonState = "OFF",
      buttonColor = Colors.blue,
      buttonTextColor = Colors.white);
      setState(() {});
  }

} // Class