import 'dart:async';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Property
  late List str;
  late int currentText;
  late String text;

  @override
  void initState() {
    super.initState();
    String data = "대한민국";
    str = data.split('');
    currentText = 0;
    text = str[currentText];

    // Timer 설정
    Timer.periodic(Duration(seconds: 1), (timer) {
      changeText();
    },);
  }

  changeText(){
    currentText ++;
    if(currentText >= str.length){
      currentText = 0;
      text = str[currentText];
    }else{
      text += str[currentText];
    }
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        title: Text("LED 광고"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 50,
                color: const Color.fromARGB(255, 3, 79, 142)
              ),
            ),
          ],
        ),
      ),
    );
  }
}