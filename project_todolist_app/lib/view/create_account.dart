import 'package:flutter/material.dart';
import '../model/account.dart';

import 'package:intl/intl.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  late TextEditingController inputEmail;  // 이메일
  late TextEditingController inputBirth;  // 생일
  late TextEditingController inputId;  // 아이디
  late TextEditingController inputPw;  // 비번
  late TextEditingController inputPwConfirm;  // 비번확인

  @override
  void initState() {
    super.initState();
    inputEmail = TextEditingController();
    inputBirth = TextEditingController();
    inputId = TextEditingController();
    inputPw = TextEditingController();
    inputPwConfirm = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 142, 218, 241),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: Text("Create Account"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          
              // 이메일
              Padding(
                padding: const EdgeInsets.fromLTRB(15,0,15,15),
                child: TextField(
                  controller: inputEmail,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    labelText: "이메일",
                    filled: true,
                    fillColor: Colors.white
                  ),
                  keyboardType: TextInputType.emailAddress,              
                ),
              ),
          
              // 생일
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  readOnly: true,
                  controller: inputBirth,
                  decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                        onTap: () {
                          showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime.now(),
                          ).then((selectedDate) {
                            if (selectedDate != null) {
                              setState(() {
                                inputBirth.text = DateFormat(
                                  'yyyy-MM-dd',
                                ).format(selectedDate);
                              });
                            }
                          });
                        },
                        child: Icon(Icons.date_range_outlined, color: Colors.blue),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      labelText: "생일",
                      filled: true,
                      fillColor: Colors.white,
                  ),
                ),
              ),
          
              // 아이디
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: inputId,
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
          
              // 비번
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  obscureText: true,
                  controller: inputPw,
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
          
              // 비번확인
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  obscureText: true,
                  controller: inputPwConfirm,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    labelText: "패스워드 확인",
                    filled: true,
                    fillColor: Colors.white
                  ),
                  keyboardType: TextInputType.text,              
                ),
              ),
          
              // 회원가입 버튼
              Padding(
                padding: const EdgeInsets.fromLTRB(8,25,8,3),
                child: ElevatedButton(
                  onPressed: () {
                    if(inputBirth.text == '' || inputEmail.text == ''
                    || inputId.text == '' || inputPw.text == ''
                    || inputPwConfirm.text == ''){
                      errorSnackBar2("정보를 입력해주세요");  // 텍스트필드 공백 시          
                    }else if(inputId.text == Account.id || inputPw.text == Account.password
                    || inputEmail.text == Account.email){
                      errorSnackBar2("이미 존재하는 계정입니다");  // id, pw, email이 기존 계정과 일치할 시
                    }else if(inputPw.text != inputPwConfirm.text){
                      errorSnackBar2("비밀번호가 일치하지 않습니다");  // 비번과 비번확인이 서로 다를 시
                    }else{
                      Account.email = inputEmail.text;
                      Account.birth = inputBirth.text;
                      Account.id = inputId.text;
                      Account.password = inputPw.text;
                      Navigator.pop(context);     // Account 모델에 전달
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(200, 40),
                    backgroundColor: Colors.blue
                  ),
                  child: Text(
                  "회원가입",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  } // build

  // ----- Functions ----- //
  errorSnackBar2(content){  // 에러 호출(content에 내용 전달)
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(content),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      )
    );
    removeController();
  }
  removeController(){
    inputEmail.text = "";
    inputBirth.text = "";
    inputId.text = "";
    inputPw.text = "";
    inputPwConfirm.text = "";  // 텍스트필드 초기화(errorSnackBar2에 포함)
  }
} // Class