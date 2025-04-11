import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Property
  late List<String> animalList;
  late List<Color> animalColor;
  late String selectedName;

  @override
  void initState() {
    super.initState();
    animalList = [
      'bee',
      'cat',
      'cow',
      'dog',
      'fox',
      'monkey',
      'pig',
      'wolf',
    ];
    animalColor = [
      Colors.yellow,
      Colors.yellow,
      Colors.yellow,
      Colors.yellow,
      Colors.yellow,
      Colors.yellow,
      Colors.yellow,
      Colors.yellow,
    ];
    selectedName = "bee";
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scroll & Builder Test"),
      ),
      body: Column(
        children: [
          Text('원하는 동물을 선택하세요'),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: animalList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => rebuildBorder(index),
                  child: Container(
                    height: 100,
                    width: 100,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: animalColor[index],
                        width: 2
                      )
                    ),
                    child: Image.asset(
                      'images/${animalList[index]}.png'
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(selectedName),
          )
        ],
      ),
    );
  } // build

  // ----- Functions ---- //
  rebuildBorder(int index){
    animalColor[index] = Colors.red;
    selectedName = animalList[index];
    setState(() {});
  }
} // Class