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
                          initialDate: DateTime.now(),
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
                    labelText: "",
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  keyboardType: TextInputType.text,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Message.action = true;
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(100, 30),
                        backgroundColor: Colors.orange
                      ),
                      child: Text(
                        "돌아가기",
                        style: TextStyle(
                          color: Colors.white
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ElevatedButton(
                      onPressed: () {
                        if (scheduleNameController.text.isNotEmpty) {
                          addList();
                          Navigator.pop(context);
                          Message.action = false;
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("일정 내용을 입력해주세요!")),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(100, 30),
                        backgroundColor: const Color.fromARGB(255, 1, 45, 81)
                      ),
                      child: Text(
                        "추가",
                        style: TextStyle(
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
  addList() {
    Message.workList = scheduleNameController.text;
    Message.date = _selectedDate;
  }
} // Class