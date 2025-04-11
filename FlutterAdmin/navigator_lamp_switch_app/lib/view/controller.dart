import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Model/message.dart';

class Controller extends StatefulWidget {
  const Controller({super.key});

  @override
  State<Controller> createState() => _ControllerState();
}

class _ControllerState extends State<Controller> {
  // Property
  late String switchLabelOnOff;
  late bool switchValueOnOff;
  late String switchLabelYR;
  late bool switchValueYR;

  @override
  void initState() {
    super.initState();
    if(Message.lampStatusOnOff == true){
      switchLabelOnOff = "On";
      switchValueOnOff = true;
    }else{
      switchLabelOnOff = "Off";
      switchValueOnOff = false;
    }
    if(Message.lampStatusYR == true){
      switchValueYR = true;
      switchLabelYR = "Yellow";
    }else{
      switchValueYR = false;
      switchLabelYR = "Red";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("수정화면"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(switchLabelOnOff),
                Switch(
                  value: switchValueOnOff, 
                  onChanged: (value){
                    switchValueOnOff = value;
                    if(switchValueOnOff == true){
                      switchLabelOnOff = "On";
                    }else{
                      switchLabelOnOff = "Off";
                    }
                    setState(() {});
                    returnValue();  // ElevatedButton 없이 바로 구현
                  }
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(switchLabelYR),
                Switch(
                  value: switchValueYR, 
                  onChanged: (value){
                    switchValueYR = value;
                    if(switchValueYR == true){
                      switchLabelYR = "Yellow";
                    }else{
                      switchLabelYR = "Red";
                    }
                    setState(() {});
                    returnValue();  // ElevatedButton 없이 바로 구현
                  }
                )
              ],
            ),
            ElevatedButton(
              onPressed: (){
                Message.lampStatusOnOff = switchValueOnOff;
                Message.lampStatusYR = switchValueYR;
                Get.back();
              },
              child: Text("OK")
            )
          ],
        ),
      ),
    );
  } // build

  // ----- Functions ----- // 
  returnValue(){
    Message.lampStatusOnOff = switchValueOnOff;
    Message.lampStatusYR = switchValueYR;
    Get.back();
  }
} // Class