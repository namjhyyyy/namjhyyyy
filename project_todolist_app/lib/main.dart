import 'package:flutter/material.dart';
import 'package:project_todolist_app/view/create_account.dart';
import 'package:project_todolist_app/view/account_info.dart';
import 'package:project_todolist_app/view/update_list.dart';
import 'package:project_todolist_app/view/add_list.dart';
import 'package:project_todolist_app/view/home.dart';
import 'package:project_todolist_app/view/log_in.dart';

import 'package:intl/date_symbol_data_local.dart';


void main() async{
  // import 는 package:intl/date_symbol_data_local.dart 
  await initializeDateFormatting();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
      ),
      // 경로 설정
      initialRoute: "/",
      routes: {
        '/': (context) => Login(),
        '/home': (context) => Home(),
        '/create': (context) => CreateAccount(),
        '/add': (context) => AddList(),
        '/update': (context) => UpdateList(),
        '/info': (context) => AccountInfo(),
      },
    );
  }
}