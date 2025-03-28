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
  late int nextImage;   // [nextImage]

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
    nextImage = 1;
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenWidth = screenSize.width;
    //final double screenHeight = screenSize.height;
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
              padding: const EdgeInsets.all(8),
              child: Text(
                imageName[currentImage],
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue,
                      width: 10
                    )
                  ),
                  child: Image.asset(
                    "images/${imageName[currentImage]}",
                    fit: BoxFit.fill,
                    width: 400,
                    height: 600,
                  ),
                ),
                Positioned(
                  top: 10,
                  left: screenWidth - 120,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.amber,
                        width: 5,
                      )
                    ),
                    child: Image.asset(
                      "images/${imageName[nextImage]}",
                      fit: BoxFit.fill,
                      width: 100,
                      height: 150,
                    ),
                  ),
                )
              ],
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
    nextImage --;
    if(nextImage < 0){
      nextImage = imageName.length-1;
    }
    setState(() {});
  }
  next(){
    currentImage ++;
    if(currentImage >= imageName.length){
      currentImage = 0;
    }
    nextImage ++;
    if(nextImage >= imageName.length){
      nextImage = 0;
    }
    setState(() {});
  }
} // Class