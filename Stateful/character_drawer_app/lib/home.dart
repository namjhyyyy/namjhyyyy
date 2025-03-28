import 'dart:async';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController adText;
  late List str;
  late int currentText;
  late String text;

  @override
  void initState() {
    super.initState();
    adText = TextEditingController();
    String data = adText.toString();
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
        backgroundColor: Colors.blue,
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

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("images/pikachu-1.jpg"),
              ),
              otherAccountsPictures: [
                CircleAvatar(
                  backgroundImage: AssetImage("images/pikachu-2.jpg"),
                ),
                CircleAvatar(
                  backgroundImage: AssetImage("images/pikachu-3.jpg"),
                ),
              ],
              accountName: Text("Pikachu"),
              accountEmail: Text("pikach@naver.com"),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 201, 98, 91),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
            ),
            TextField(
              controller: adText,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "광고 문구를 입력하세요"
              ),
              keyboardType: TextInputType.text,              
            ),
            ElevatedButton(
              onPressed: () => text = text,
              child: Text("광고 문구 생성")
              )
          ],
        ),
      ),
    );
  }

}