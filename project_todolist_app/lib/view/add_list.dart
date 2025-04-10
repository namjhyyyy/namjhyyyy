import 'package:flutter/material.dart';
import '../model/message.dart';

import 'package:intl/intl.dart';

class AddList extends StatefulWidget {
  const AddList({super.key});

  @override
  State<AddList> createState() => _AddListState();
}

class _AddListState extends State<AddList> {
  // Property
  late TextEditingController scheduleNameController;
  late TextEditingController dateController;
  late DateTime _selectedDate;
  late String selectedDateText;

  @override
  void initState() {
    super.initState();
    scheduleNameController = TextEditingController();
    dateController = TextEditingController();
    _selectedDate = DateTime.now();
    selectedDateText = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 142, 218, 241),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: Text("Add View")
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(25,60,25,20),
                  child: TextField(
                    controller: scheduleNameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      labelText: "스케줄 내용",
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    keyboardType: TextInputType.text,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25,20,25,120),
                  child: TextField(
                    readOnly: true,
                    controller: dateController,
                    decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        onTap: () {
                          showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),  // 이미 지난 날 일정 추가하는 건 의미 없으므로
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2100),
                          ).then((selectedDate) {
                            if (selectedDate != null) {
                              setState(() {
                                _selectedDate = selectedDate;
                                dateController.text = DateFormat(
                                  'yyyy-MM-dd',
                                ).format(_selectedDate);
                              });
                            }
                          });
                        },
                        child: Icon(Icons.date_range_outlined, color: Colors.blue),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      labelText: "날짜",
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    keyboardType: TextInputType.text,
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
                          Message.action = true;  // rebuild 함수가 실현되면 안되므로
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
            
                    // 추가 버튼
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (scheduleNameController.text.isNotEmpty) {
                            // scheduleNameController이 공란이 아니면
                            addList();  // 일정 추가
                            Navigator.pop(context);  // 추가창 없애고 홈으로
                            Message.action = false;  
                            // Message.action이 true더라도 다시 false로 돌려 rebuild 함수 실현 가능
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.red,
                                content: Text(
                                "일정 내용을 입력해주세요!"
                                )
                              ),
                              // 공란 있으면 에러스낵바
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(100, 30),
                          backgroundColor: const Color.fromARGB(255, 6, 76, 132)
                        ),
                        child: Text(
                          "추가",
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
      ),
    );
  } // build

  // ----- Functions ----- //
  addList() {
    Message.workList = scheduleNameController.text;  // workList에 일정 내용 추가
    Message.date = _selectedDate;  // workList에 날짜 추가
  }
} // Class