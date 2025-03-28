import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Property
  late TextEditingController textEditingController; // Class

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController(); // Constructor
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          title: Text("Single Textfield"),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: textEditingController,
                decoration: InputDecoration(
                  labelText: "내용을 입력하세요",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
                keyboardType: TextInputType.text,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                onPressed: () => checkData(),
                child: Text("출력"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  checkData() {
    if (textEditingController.text.trim().isEmpty) {
      // Error Message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("내용을 입력하세요!"),
          duration: Duration(seconds: 2),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      // Display
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("입력하신 내용은 ${textEditingController.text} 입니다."),
          duration: Duration(seconds: 3),
          backgroundColor: Colors.blue,
        ),
      );
    }
  }

  /*errorSnackBar(){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("내용을 입력하세요!"),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      )
    );
  }
  showSnackBar(){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("입력하신 내용은 ${textEditingController.text} 입니다."),
        duration: Duration(seconds: 3),
        backgroundColor: Colors.blue,
      )
    );
  }*/
}