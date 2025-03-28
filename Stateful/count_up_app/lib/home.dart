import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Property(Field, Attribute)
  late int count; // 클릭수

  @override
  void initState() {
    super.initState();
    count = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Count UP")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("현재 클릭수는 $count 입니다."),
            FloatingActionButton(
              onPressed: () {
                addCount();
              },
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              child: Icon(Icons.add),
            ),
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () => addCount(),
        child: Text("add")
        ), 
    );
  } // build

  // ----- Functions ----- //
  addCount() {
    count++;
    setState(() {});
  }
} // Class