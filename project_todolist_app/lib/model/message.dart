import 'todo_list.dart';

class Message {
  // Property
  static String workList = "";  // 일정 내용
  static DateTime date = DateTime.now();  // 일정 날짜
  static TodoList? selectedTodo;  // 리스트 객체 자체 저장
  static bool action = false;  // 추가 또는 수정 함수가 작동할지 여부 판단(false일때 작동)
}