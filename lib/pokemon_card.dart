import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(home: Home()),
  );
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("宝可梦图鉴"),
        centerTitle: true,
        backgroundColor: Colors.green[300],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Image(image: AssetImage("assets/pokemon-1.png")),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: const Text(
                "妙蛙种子",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  fontFamily: "NotoSansSC",
                  letterSpacing: 2,
                  color: Color(0xFF757575), // Colors.grey[600]
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {},
        backgroundColor: Colors.green[300],
        child: const Icon(
          Icons.add_rounded,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}
