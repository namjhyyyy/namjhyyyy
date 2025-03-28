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
  late bool sumSwitchValue;
  late bool subSwitchValue;
  late bool mulSwitchValue;
  late bool divSwitchValue;

  @override
  void initState() {
    super.initState();
    num1Controller = TextEditingController();
    num2Controller = TextEditingController();
    sumController = TextEditingController();
    subController = TextEditingController();
    mulController = TextEditingController();
    divController = TextEditingController();
    sumSwitchValue = true;
    subSwitchValue = true;
    mulSwitchValue = true;
    divSwitchValue = true;
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("덧셈"),
                  Switch(
                    value: sumSwitchValue,
                    onChanged: (value) {
                    sumSwitchValue = value;
                    switchCheck(sumSwitchValue, sumController);
                    setState(() {});
                    },
                  ),
                  Text("뺄셈"),
                  Switch(
                    value: subSwitchValue,
                    onChanged: (value) {
                      subSwitchValue = value;
                      switchCheck(subSwitchValue, subController);
                      setState(() {});
                    },
                  ),
                  Text("곱셈"),
                  Switch(
                    value: mulSwitchValue,
                    onChanged: (value) {
                    mulSwitchValue = value;
                    switchCheck(mulSwitchValue, mulController);
                    setState(() {});
                    },
                  ),
                  Text("나눗셈"),
                  Switch(
                    value: divSwitchValue,
                    onChanged: (value) {
                    divSwitchValue = value;
                    switchCheck(divSwitchValue, divController);
                    setState(() {});
                    },
                  ),
                ],
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
  /*sumCheck(){
    if(sumSwitchValue == true){
      sumSwitchValue = false;
      sumController.text = ("");
    }else{
      sumSwitchValue = true;
      sumController.text = (
        int.parse(num1Controller.text) + int.parse(num2Controller.text)
      ).toString();
    }
  }
  subCheck(){
    if(subSwitchValue == true){
      subSwitchValue = false;
      subController.text = ("");
    }else{
      subSwitchValue = true;
      subController.text = (
        int.parse(num1Controller.text) - int.parse(num2Controller.text)
      ).toString();
    }
  }
  mulCheck(){
    if(mulSwitchValue == true){
      mulSwitchValue = false;
      mulController.text = ("");
    }else{
      mulSwitchValue = true;
      mulController.text = (
        int.parse(num1Controller.text) * int.parse(num2Controller.text)
      ).toString();
    }
  }
  divCheck(){
    if(divSwitchValue == true){
      divSwitchValue = false;
      divController.text = ("");
    }else{
      divSwitchValue = true;
      divController.text = (
        double.parse(num1Controller.text) / double.parse(num2Controller.text)
      ).toString();
    }
  }*/

  // ----- Other Functions ----- //
  switchCheck(switchType, calcCont){
    if(switchType == false){
      calcCont.text = ("");
    }else{
      calcCont.text  = calcCont.text ;
    }
    setState(() {});
  }
} // Class