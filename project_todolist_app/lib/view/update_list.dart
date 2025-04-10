import 'package:flutter/material.dart';
import '../model/message.dart';

import 'package:intl/intl.dart';

class UpdateList extends StatefulWidget {
  const UpdateList({super.key});

  @override
  State<UpdateList> createState() => _DetailListState();
}

class _DetailListState extends State<UpdateList> {
  late TextEditingController fixNameController;  // 일정 내용 수정
  late TextEditingController fixDateController;  // 날짜 수정
  late DateTime _fixedDate;

  @override
  void initState() {
    super.initState();
    fixNameController = TextEditingController(text: Message.selectedTodo?.workList ?? "");
    fixDateController = TextEditingController(text: Message.selectedTodo?.date.toString() ?? "");
    // 객체 자체 저장
    _fixedDate = DateTime.now();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 142, 218, 241),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: Text("Update View"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20,60,20,0),
                child: Text(
                  "일정 수정",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: const Color.fromARGB(255, 1, 45, 81),
                    fontWeight: FontWeight.bold,
                    fontSize: 30
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15,8,15,15),
                child: Divider(
                  height: 2,
                  color: const Color.fromARGB(255, 1, 45, 81)
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(35,30,35,10),
                child: TextField(
                  controller: fixNameController,
                  decoration: InputDecoration(
                      suffixIcon: Icon(Icons.note_alt_outlined, color: Colors.blue),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      labelText: "",
                      filled: true,
                      fillColor: Colors.white,
                    ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(35,20,35,80),
                child: TextField(
                  readOnly: true,
                  controller: fixDateController,
                  decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      onTap: () {
                          showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2100),
                          ).then((selectedDate) {
                            if (selectedDate != null) {
                              setState(() {
                                _fixedDate = selectedDate;
                                fixDateController.text = DateFormat(
                                  'yyyy-MM-dd',
                                ).format(_fixedDate);
                              });
                            }
                          });
                        },
                      child: Icon(
                        Icons.date_range_outlined,
                        color: Colors.blue,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    labelText: "",
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
          
                    // 돌아가기 버튼
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Message.action = true;  // update함수가 돌아가면 안됨
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(100, 30),
                          backgroundColor: Colors.white
                        ),
                        child: Text(
                          "돌아가기",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue
                          ),
                        ),
                      ),
                    ),
          
                    // 수정 버튼
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (fixNameController.text.isNotEmpty) {
                            updateList();  // 수정 함수 실현
                            Navigator.pop(context);
                            Message.action = false;  // update함수가 돌아가야 함
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("일정 내용을 입력해주세요!")),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(100, 30),
                          backgroundColor: const Color.fromARGB(255, 6, 76, 132)
                        ),
                        child: Text(
                          "수정",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  } // build

  // ----- Functions ----- //
  updateList() {  // 일정 수정 함수
    if (Message.selectedTodo != null) {
    Message.selectedTodo!.workList = fixNameController.text;  // selectedTodo에 넣음으로써 객체 자체 저장
    Message.selectedTodo!.date = _fixedDate;  // selectedTodo에 넣음으로써 객체 자체 저장
    }
  }
}