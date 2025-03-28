import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Property
  late TextEditingController heightController;
  late TextEditingController weightController;
  late String bmiResult;
  late String bmiImage;

  @override
  void initState() {
    super.initState();
    heightController = TextEditingController();
    weightController = TextEditingController();
    bmiResult = "";
    bmiImage = "images/bmi.png";
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          title: Text("BMI 계산기"),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: heightController,
                  decoration: InputDecoration(
                    labelText: "신장을 입력하세요"
                  ),
                  keyboardType: TextInputType.number,              
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: weightController,
                  decoration: InputDecoration(
                    labelText: "몸무게를 입력하세요"
                  ),
                  keyboardType: TextInputType.number,              
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ElevatedButton(
                        onPressed: (){
                          calcCheck();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                        ),
                        child: Text("BMI 계산")
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ElevatedButton(
                        onPressed: (){
                          removeCheck();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                        ),
                        child: Text("초기화")
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Text(
                  bmiResult,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset(bmiImage),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ----- Functions ----- //
  calcCheck(){
    if(heightController.text.trim().isEmpty 
    || weightController.text.trim().isEmpty){
      errorSnackBar();
    }else{
      int height = int.parse(heightController.text);
      int weight = int.parse(weightController.text);
      double heightm = height / 100;
      double bmi = weight / heightm / heightm;
      String obesity = "";

      if(bmi > 30){
        obesity = '고도비만';
        bmiImage = "images/obese.png";
      }else if(bmi > 25){
        obesity = '비만';
        bmiImage = "images/overweight.png";
      }else if(bmi > 23){
        obesity = '과체중';
        bmiImage = "images/risk.png";
      }else if(bmi > 18.5){
        obesity = '정상체중';
        bmiImage = "images/normal.png";
      }else{
        obesity = '저체중';
        bmiImage = "images/underweight.png";
      }
      bmiResult = "귀하의 BMI지수는 ${bmi.toStringAsFixed(1)} 이고 $obesity 입니다.";
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
    heightController.text = ("");
    weightController.text = ("");
    bmiResult = ("");
    bmiImage = ("images/bmi.png");
    setState(() {});
  }
}