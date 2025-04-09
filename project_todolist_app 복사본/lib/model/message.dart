import 'todo_list.dart';

class Message {
  // Property
  static String workList = "";
  static DateTime date = DateTime.now();
  static TodoList? selectedTodo;  // 리스트 객체 자체 저장
  static bool action = false;
}