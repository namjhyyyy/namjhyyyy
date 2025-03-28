import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Property
  late TextEditingController num1Controller;  // 숫자 1 (키보드는 숫자)
  late TextEditingController num2Controller;  // 숫자 2 (키보드는 숫자)
  late TextEditingController sumController;   // 덧셈 계산 (읽기 가능)
  late TextEditingController subController;   // 뺄셈 계산 (읽기 가능)
  late TextEditingController mulController;   // 곱셈 계산 (읽기 가능)
  late TextEditingController divController;   // 나눗셈 계산 (읽기 가능)

  @override
  void initState() {
    super.initState();
    num1Controller = TextEditingController();
    num2Controller = TextEditingController();
    sumController = TextEditingController();
    subController = TextEditingController();
    mulController = TextEditingController();
    divController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          title: Text("간단한 계산기"),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              TextField(
                controller: num1Controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "첫번째 숫자를 입력하세요"
                ),
                keyboardType: TextInputType.number,              
              ),
              TextField(
                controller: num2Controller,
                decoration: InputDecoration(
                  labelText: "두번째 숫자를 입력하세요"
                ),
                keyboardType: TextInputType.number,              
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: (){
                          calcCheck();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white
                        ),
                        child: Text("계산하기"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: (){
                          removeCheck();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white
                        ),
                        child: Text("지우기"),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0,20,0,20),
                child: TextField(
                  readOnly: true,
                  controller: sumController,
                  decoration: InputDecoration(
                    labelText: "덧셈 계산"
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0,20,0,20),
                child: TextField(
                  readOnly: true,
                  controller: subController,
                  decoration: InputDecoration(
                    labelText: "뺄셈 계산"
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0,20,0,20),
                child: TextField(
                  readOnly: true,
                  controller: mulController,
                  decoration: InputDecoration(
                    labelText: "곱셈 계산"
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0,20,0,20),
                child: TextField(
                  readOnly: true,
                  controller: divController,
                  decoration: InputDecoration(
                    labelText: "나눗셈 계산"
                  ),
                ),
              ),
            ]
          ),
        ),
      ),
    );
  } // build

  // ----- Functions ----- //
  calcCheck(){
    if(num1Controller.text.trim().isEmpty 
    || num2Controller.text.trim().isEmpty){
      errorSnackBar();
    }else{
      sumController.text = (
        int.parse(num1Controller.text) + int.parse(num2Controller.text)
      ).toString();
      subController.text = (
        int.parse(num1Controller.text) - int.parse(num2Controller.text)
      ).toString();
      mulController.text = (
        int.parse(num1Controller.text) * int.parse(num2Controller.text)
      ).toString();
      divController.text = (
        double.parse(num1Controller.text) / double.parse(num2Controller.text)
      ).toString();
      setState(() {});
    }
  }
  errorSnackBar(){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("숫자를 입력하세요!"),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      )
    );
  }
  removeCheck(){
    num1Controller.text = ("");
    num2Controller.text = ("");
    sumController.text = ("");
    subController.text = ("");
    mulController.text = ("");
    divController.text = ("");
  }
} // Class