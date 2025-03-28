import 'dart:async';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Property
  late bool switchValue;
  late double lampSize;
  late int rotateAngle;

  @override
  void initState() {
    super.initState();
    switchValue = false;
    lampSize =100;
    rotateAngle = 45;

    // Timer 설정
    Timer.periodic(Duration(seconds: 1), (timer) {
      changeImage();
    },);
  }

  changeImage(){
    if(lampSize == 100){
      rotateAngle += 45;
      if(rotateAngle >= 360){
        rotateAngle = 0;
      }
    }else{
      rotateAngle -= 45;
      if(rotateAngle < 0){
        rotateAngle = 360;
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        title: Text("image 확대 및 축소"),
      ),
      body: Center(
        child: SizedBox(
          width: 400, height: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RotationTransition(
                turns: AlwaysStoppedAnimation(rotateAngle/360),
                child: switchValue == false
                    ? Image.asset("images/lamp_off.png", width: lampSize)
                    : Image.asset("images/lamp_on.png", width: lampSize),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () => sizeChange(),
                      child:
                          lampSize == 100
                              ? Text(
                                "Image 확대",
                                style: TextStyle(color: Colors.red),
                              )
                              : Text(
                                "Image 축소",
                                style: TextStyle(color: Colors.red),
                              ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Switch(
                      value: switchValue,
                      onChanged: (value) {
                        switchValue = value;
                        setState(() {});
                      },
                      activeColor: Colors.red,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  } // build

  sizeChange() {
    lampSize == 100 ? lampSize = 200 : lampSize = 100;
    setState(() {});
  }
} // Class