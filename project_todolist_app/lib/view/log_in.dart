import 'package:flutter/material.dart';

import '../model/account.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // Property
  late TextEditingController idController;
  late TextEditingController pwController;

  @override
  void initState() {
    super.initState();
    idController = TextEditingController();
    pwController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            // 앱 이름 
            Text(
              "To Do List",
              style: TextStyle(
                color: Colors.white,
                fontSize: 50
              ),
            ),

            // 아이콘
            Icon(
              Icons.account_circle,
              size: 130,
              color: Colors.white,
            ),

            // 아이디 입력창
            Padding(
              padding: const EdgeInsets.fromLTRB(50,10,50,10),
              child: TextField(
                controller: idController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  labelText: "아이디",
                  filled: true,
                  fillColor: Colors.white
                ),
                keyboardType: TextInputType.text,
              ),
            ),

            // 비번 입력창
            Padding(
              padding: const EdgeInsets.fromLTRB(50,10,50,10),
              child: TextField(
                obscureText: true,
                controller: pwController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  labelText: "패스워드",
                  filled: true,
                  fillColor: Colors.white
                ),
                keyboardType: TextInputType.text,              
              ),
            ),

            // 로그인
            Padding(
              padding: const EdgeInsets.fromLTRB(8,25,8,3),
              child: ElevatedButton(
                onPressed: () {
                  if(idController.text == '' || pwController.text == ''){
                    errorSnackBar("정보를 입력해주세요");  // 비었으면 정보 입력 요구
                  }else if(idController.text == Account.id
                  && pwController.text == Account.password){
                    Navigator.pushNamed(context, '/home');  // 메인화면으로
                  }else{
                    errorSnackBar("존재하지 않는 계정입니다");
                  }  //  틀렸으면 틀렸다고 공지
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(100, 30),
                  backgroundColor: const Color.fromARGB(255, 6, 76, 132)
                ),
                child: Text(
                "로그인",
                style: TextStyle(
                  fontWeight: FontWeight.bold, 
                  color: Colors.white,
                  ),
                ),
              ),
            ),

            // 회원가입
            Padding(
              padding: const EdgeInsets.fromLTRB(8,6,8,3),
              child: ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/create'),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(100, 30),
                  backgroundColor: Colors.white
                ),
                child: Text(
                "회원가입",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  ),
                ),
              ),
            )
          ],
        )
      ),
    );
  } // build

  // ----- Functions ----- //
  errorSnackBar(content){  // 에러 호출(content에 내용 전달)
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(content),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      )
    );
    idController.text = ("");
    pwController.text = ("");  // 텍스트필드 초기화
  }
}