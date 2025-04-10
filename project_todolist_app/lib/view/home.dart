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
  late DateTime focusedDay;  // 달력에 (오늘)날짜 focus

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
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, '/info'),  // 누르면 계정정보로
            icon: Icon(Icons.account_circle),
          ),
        ],
      ),

      body: Column(
        children: [

          // 날짜(기본값은 오늘, 이후는 선택한 날짜 'selectedDay')
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              DateFormat('yyyy-MM-dd').format(selectedDay),  // 선택한 날짜가 나오게 함
              style: TextStyle(
                fontWeight: FontWeight.bold, 
                fontSize: 30,
                color: const Color.fromARGB(255, 1, 45, 81)
              ),
            ),
          ),

          // 달력(Table_Calendar 패키지 사용)
          if (isCalendarVisible)  // 초기값 false
            TableCalendar(
              locale: 'ko_KR',   // 한국어
              firstDay: DateTime.utc(2020, 1, 1),    // 날짜 범위
              lastDay: DateTime.utc(2100, 12, 31),   // 날짜 범위
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
                      // isSameDay: todo.date() == selectedDay일때 true값. 즉, 선택한 날짜에 해당하는 일정만 뜨게 함
                      // todo: 매개변수
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
                  isCalendarVisible = !isCalendarVisible;  // isCalendarVisible이 null이 아님을 보증
                  setState(() {});
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.blue,
                  minimumSize: Size(15, 5),
                ),
                icon: Icon(
                  isCalendarVisible ? Icons.expand_less : Icons.expand_more,  
                  // 기본값은 False이므로          숨김(기본)              엶
                ),
                label: Text(isCalendarVisible ? "캘린더 숨기기" : "캘린더 열기"),  // 캘린더 숨길지 열지 여부 판단
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
                    Message.selectedTodo = filteredList[index];  // 수정할 경우 수정된 값만 선택해서 가져옴
                    updateFunction(context);  // 리스트뷰 누르면 각 일정에 해당하는 수정 창으로 이동
                  },
                  onLongPress: () {  // 길게 누르면 삭제 알림창 뜸(아이폰 앱 삭제할 때랑 동일)
                    showDialog(
                      context: context,
                      builder:
                          (context) => AlertDialog(  // 알림창
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
                                    todoList.removeAt(index);  // todoList index에서 값 삭제
                                  });
                                  Navigator.pop(context); // 삭제 후 닫기
                                },
                                child: Text("삭제"),
                              ),
                            ],
                          ),
                    );
                  },
                  
                  // 리스트뷰에 뜰 내용
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
                              filteredList[index].workList,  // worklist(일정 내용 표시)
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
                                // date(날짜 표시 및 구분용. DateFormat으로 표시 형식 고정)
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
      floatingActionButton: FloatingActionButton(  // 플로팅액션버튼(일정 추가)
        onPressed: () => addFunction(context),  // 추가 창으로 이동
        child: Icon(Icons.add),
      ),
    );
  } // build

  void addFunction(BuildContext context) async {  // 비동기 함수이므로
    final result = await Navigator.pushNamed(  // 기다림(비동기)
      context,
      "/add",
    ).then((value) => rebuildData());  // 추가한 후 돌아오면 rebuildData 함수 구현
    if (result != null) {
      setState(() {}); // 새로운 일정 반영
    }
  }

  void updateFunction(BuildContext context) async {  // 비동기 함수이므로
    final result = await Navigator.pushNamed(  // 기다림(비동기)
      context,
      "/update",
    ).then((value) => updateData());  // 추가한 후 돌아오면 rebuildData 함수 구현
    if (result != null) {
      setState(() {}); // 새로운 일정 반영
    }
  } // build

  rebuildData() {  // 일정 추가 함수
    if (Message.action == false) {  // Message.action이 false일때만 실행
      todoList.add(TodoList(workList: Message.workList, date: Message.date));  // 일정 추가
      Message.action = false;
    }
    setState(() {});
  }

  updateData() {  // 일정 수정 함수
    if (Message.action == false) {  // Message.action이 false일때만 실행
      todoList.remove(TodoList(workList: Message.workList, date: Message.date));
      // 수정 일정은 filteredList에 추가(기존 일정 유지한 채 자동적으로 추가됨). 즉 기존 일정을 제거해주면 됨
      Message.action = false;
    }
    setState(() {});
  }
} // Class