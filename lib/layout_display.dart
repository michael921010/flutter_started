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
        title: const Text("Layout Display"),
        centerTitle: true,
        backgroundColor: Colors.green[300],
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              color: const Color.fromRGBO(245, 23, 112, 0.3),
              child: const Image(image: AssetImage("assets/pokemon-1.png")),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              padding: const EdgeInsets.all(30),
              color: Colors.lime,
              child: const Text(
                "1",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.all(30),
              color: Colors.deepPurple,
              child: const Text(
                "2",
                textAlign: TextAlign.start,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.all(10),
              color: Colors.cyan,
              child: const Text(
                "3",
                textAlign: TextAlign.right,
              ),
            ),
          ),
        ],
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
