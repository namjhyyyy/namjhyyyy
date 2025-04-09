import 'package:flutter/material.dart';
import '../model/message.dart';
import '../model/todo_list.dart';

import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Property
  late List<TodoList> todoList; // 초기에 값을 받아옴
  late List<TodoList> filteredList; // 날짜별 일정 분류하기 위해 따로 만든 리스트
  late bool isCalendarVisible; // 캘린더 펼치고 접기 위한 변수
  late DateTime selectedDay; // 날짜 선택
  late DateTime focusedDay;

  @override
  void initState() {
    super.initState();
    todoList = [];
    isCalendarVisible = false; // 기본값은 캘린더를 보이지 않음
    selectedDay = DateTime.now();
    focusedDay = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    List<TodoList> filteredList =
        todoList.where((todo) {
          return isSameDay(todo.date, selectedDay);
        }).toList();
    // isSameDay: todo.date() == selectedDay일때 true값. 즉, 선택한 날짜에 해당하는 일정만 뜨게 함
    // todo: 매개변수

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 142, 218, 241),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text("To Do List"),
        centerTitle: true,
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: const Icon(Icons.menu),
            );
          },
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, '/info'),  // 누르면 계정정보로
            icon: Icon(Icons.account_circle),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              DateFormat('yyyy-MM-dd').format(selectedDay),  // 선택한 날짜가 나오게 함
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ),
          if (isCalendarVisible)
            TableCalendar(
              locale: 'ko_KR',
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2100, 12, 31),
              focusedDay: focusedDay,
              selectedDayPredicate: (day) => isSameDay(selectedDay, day), // 선택한 날짜(매개변수 day)를 selectedDay로 옮겨줌
              onDaySelected: (selected, focused) {
                setState(() {
                  selectedDay = selected;
                  focusedDay = focused;
                  filteredList =
                      todoList.where((todo) {
                        return isSameDay(todo.date, selectedDay);
                      }).toList();
                });
              },
              calendarStyle: CalendarStyle(
                selectedDecoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                todayDecoration: BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  isCalendarVisible = !isCalendarVisible;
                  setState(() {});
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.blue,
                  minimumSize: Size(15, 5),
                ),
                icon: Icon(
                  isCalendarVisible ? Icons.expand_less : Icons.expand_more,
                ),
                label: Text(isCalendarVisible ? "캘린더 숨기기" : "캘린더 열기"),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: filteredList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () async {
                    Message.selectedTodo = filteredList[index];
                    fixFunction(context);
                  },
                  onLongPress: () {
                    showDialog(
                      context: context,
                      builder:
                          (context) => AlertDialog(
                            title: Text("일정 삭제"),
                            content: Text("정말 삭제하시겠습니까?"),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context), // 취소
                                child: Text("취소"),
                              ),
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    todoList.removeAt(index);
                                  });
                                  Navigator.pop(context); // 삭제 후 닫기
                                },
                                child: Text("삭제"),
                              ),
                            ],
                          ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: Card(
                      color: Colors.blue,

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                            child: Text(
                              filteredList[index].workList,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                            child: Text(
                              DateFormat(
                                'yyyy-MM-dd',
                              ).format(filteredList[index].date),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(child: Text("메뉴")),
            ListTile(
              leading: const Icon(Icons.add, color: Colors.blue),
              title: const Text("추가"),
              onTap: () => addFunction(context),
            ),
          ],
        ),
      ),
    );
  }

  void addFunction(BuildContext context) async {
    final result = await Navigator.popAndPushNamed(
      context,
      "/add",
    ).then((value) => rebuildData());
    if (result != null) {
      setState(() {}); // 새로운 일정 반영
    }
  }

  void fixFunction(BuildContext context) async {
    final result = await Navigator.pushNamed(
      context,
      "/detail",
    ).then((value) => updateData());
    if (result != null) {
      setState(() {}); // 새로운 일정 반영
    }
  } // build

  rebuildData() {
    if (Message.action == false) {
      todoList.add(TodoList(workList: Message.workList, date: Message.date));
      Message.action = false;
    }
    setState(() {});
  }

  updateData() {
    if (Message.action == false) {
      todoList.remove(TodoList(workList: Message.workList, date: Message.date));
      Message.action = false;
    }
    setState(() {});
  }
} // Class