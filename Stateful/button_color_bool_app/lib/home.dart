import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Property
  late String buttonText;
  late bool buttonCheck;   // Hello: true, Flutter: false
  late Color buttonBackColor;
  late Color bodyBackColor;
  late int clickCount;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    buttonText = "Hello";
    buttonCheck = true;
    buttonBackColor = Colors.blue;
    bodyBackColor = Colors.white;
    clickCount = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bodyBackColor,
      appBar: AppBar(
        title: Text("Change button color & Text"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            onClick();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonBackColor,
            foregroundColor: Colors.white,
          ),
          child: Text(buttonText)
          ),
      ),
    );
  } // build

  // ----- Functions(내 풀이) ----- //
  onClick(){
    clickCount ++;
    if(clickCount >= 10){
      if(bodyBackColor == Colors.white){
        bodyBackColor = Colors.amber;
      }else{
        bodyBackColor = Colors.white;
      }
      clickCount = 0;
    }        
    print("현재 상태: $buttonText, $buttonCheck");
    if(buttonCheck == true){
    buttonText = "Flutter";
    buttonCheck = false;
    buttonBackColor = Colors.amber;
    }else{
      buttonText = "Hello";
      buttonCheck = true;
    buttonBackColor = Colors.blue;
    }
    print("바뀔 상태: $buttonText, $buttonCheck");
    print("----------------------------------");
    setState(() {});
  }
} // Class

    // ----- Functions(나머지 이용) ----- //
  /*onClick(){
    clickCount ++;
    int clickCount2 = clickCount % 10;
    int clickCount3 = clickCount2 % 2;
    if(clickCount >= 10){
      if(clickCount3 == 1){
        bodyBackColor = Colors.amber;
      }else{
        bodyBackColor = Colors.white;
      }
    }        
    print("현재 상태: $buttonText, $buttonCheck");
    if(buttonCheck == true){
    buttonText = "Flutter";
    buttonCheck = false;
    buttonBackColor = Colors.amber;
    }else{
      buttonText = "Hello";
      buttonCheck = true;
    buttonBackColor = Colors.blue;
    }
    print("바뀔 상태: $buttonText, $buttonCheck");
    print("----------------------------------");
    setState(() {});
  }*/