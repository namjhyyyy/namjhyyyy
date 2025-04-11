import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:navigator_lamp_switch_app/view/controller.dart';

///import 'controller.dart';
import '../Model/message.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Property
  late String lampImage;

  @override
  void initState() {
    super.initState();
    lampImage = "images/lamp_on.png";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main 화면"),
        actions: [
          IconButton(
            onPressed: (){
              Message.lampStatusOnOff = true;
              Get.to(
                Controller()
              )!.then((value) => getData());              
            },
            icon: Icon(Icons.edit)
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              lampImage,
              width: 150
              )
          ],
        ),
      ),
    );
  } // build

  // ----- functions ----- //
  getData(){
    // if(Message.lampStatusOnOff == true && Message.lampStatusYR == true){
    //   lampImage = "images/lamp_on.png";
    // }else if(Message.lampStatusOnOff == true && Message.lampStatusYR == false){
    //   lampImage = "images/lamp_red.png";
    // }else{
    //   lampImage = "images/lamp_off.png";
    // }
    if(Message.lampStatusOnOff == true){
      if(Message.lampStatusYR){
        lampImage = "images/lamp_on.png";
      }else{
        lampImage = "images/lamp_red.png";
      }
    }else{
      lampImage = "images/lamp_off.png";
    }
    setState(() {});
  }

} // Class