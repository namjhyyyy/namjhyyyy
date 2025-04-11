import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String lampState;

  @override
  void initState() {
    super.initState();
    lampState = "lamp_on";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        title: Text("Alert를 이용한 메세지 출력"),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset("images/$lampState.png", width: 300, height: 600),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ElevatedButton(
                    onPressed: () => lightOn(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                    ),
                    child: Text("켜기"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ElevatedButton(
                    onPressed: () => lightOff(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                    ),
                    child: Text("끄기"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  } // build

  // ----- Function ----- //
  lightOn(BuildContext context) {
    if(lampState == "lamp_on"){
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text("경고"),
            content: Text("현재 램프가 켜진 상태입니다."),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("네, 알겠습니다.")
              ),
            ],
          );
        },
      );
    }else{
      showCupertinoModalPopup(
      context: context,
      barrierDismissible: false,
      builder: (context) => CupertinoActionSheet(
        title: Text("램프 켜기"),
        message: Text("램프를 켜시겠습니까?"),
        actions: [
          CupertinoActionSheetAction(
            onPressed: (){
              Get.back();
              lampState = "lamp_on";
              setState(() {});
            },
            child: Text("예")
          ),
          CupertinoActionSheetAction(
            onPressed: (){
              Get.back();
            },
            child: Text("아니오")
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: (){
            Get.back();
          },
          child: Text("Cancel")
        ),
      )
    );
    }
    setState(() {});
  }
  lightOff(BuildContext context){
    if(lampState == "lamp_off"){
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text("경고"),
            content: Text("현재 램프가 꺼진 상태입니다."),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("네, 알겠습니다."),
              ),
            ],
          );
        },
      );
    }else{
      showCupertinoModalPopup(
      context: context,
      barrierDismissible: false,
      builder: (context) => CupertinoActionSheet(
        title: Text("램프 끄기"),
        message: Text("램프를 끄시겠습니까?"),
        actions: [
          CupertinoActionSheetAction(
            onPressed: (){
              Get.back();
              lampState = "lamp_off";
              setState(() {});
            },
            child: Text("예")
          ),
          CupertinoActionSheetAction(
            onPressed: (){
              Get.back();
            },
            child: Text("아니오")
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: (){
            Get.back();
          },
          child: Text("Cancel")
        ),
      )
    );
    }
    setState(() {});
  }
} // Class