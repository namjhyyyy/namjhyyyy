import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Property
  late List<String> imageName;
  late int currentImage;   // [currentImage]

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imageName = [
      "flower_01.png",
      "flower_02.png",
      "flower_03.png",
      "flower_04.png",
      "flower_05.png",
      "flower_06.png",
    ];
    currentImage = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        title: Text("무한 이미지 반복"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                imageName[currentImage],
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
                ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12,12,12,12),
              child: Image.asset(
                "images/${imageName[currentImage]}",
                width: 350,
                ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ElevatedButton(
                    onPressed: () => previous(), 
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                    ),
                    child: Text("이전")
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ElevatedButton(
                    onPressed: () => next(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                    ),
                    child: Text("다음")
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  } // build

  // ----- Functions ----- //
  previous(){
    currentImage --;
    if(currentImage < 0){
      currentImage = imageName.length-1;
    }
    setState(() {});
  }
  next(){
    currentImage ++;
    if(currentImage >= imageName.length){
      currentImage = 0;
    }
    setState(() {});
  }
} // Class