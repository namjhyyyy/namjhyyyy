import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Property
  late List<String> imageName;
  late int currentImage; // [currentImage]

  @override
  void initState() {
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
              padding: const EdgeInsets.all(8),
              child: Text(
                imageName[currentImage],
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 3),
                  ),
                  child: Image.asset(
                    "images/${imageName[currentImage]}",
                    fit: BoxFit.fill,
                    width: 400,
                    height: 600,
                  ),
                ),
                Positioned(
                  left: 3,
                  top: 240,
                  child: ElevatedButton(
                    onPressed: () => previous(),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(0)
                        )
                      ),
                      backgroundColor: Colors.purple,
                      foregroundColor: Colors.white,
                    ),
                    child: Text("<<")
                  ),
                ),
                Positioned(
                  right: 3,
                  top: 240,
                  child: ElevatedButton(
                    onPressed: () => next(),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(0)
                        )
                      ),
                      backgroundColor: Colors.purple,
                      foregroundColor: Colors.white,
                    ),
                    child: Text('>>'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  } // build

  // ----- Functions ----- //
  previous() {
    currentImage--;
    if (currentImage < 0) {
      currentImage = imageName.length - 1;
    }
    setState(() {});
  }

  next() {
    currentImage++;
    if (currentImage >= imageName.length) {
      currentImage = 0;
    }
    setState(() {});
  }
} // Class