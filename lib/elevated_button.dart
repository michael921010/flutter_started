import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(home: Home()),
  );
}

class Home extends StatelessWidget {
  const Home({super.key});

  void greeting() {
    debugPrint("you clicked me.");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ElevatedButton"),
        centerTitle: true,
        backgroundColor: Colors.green[300],
      ),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: greeting,
          style: ElevatedButton.styleFrom(
            primary: Colors.green[300],
            onPrimary: const Color(0xffffffff),
          ),
          icon: const Icon(
            Icons.tram,
          ),
          label: const Text("click me"),
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
