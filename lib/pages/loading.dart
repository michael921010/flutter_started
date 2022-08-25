import 'package:flutter/material.dart';
import "package:demo/services/world_time.dart";
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  WorldTime instance = WorldTime(
      location: "Berlin",
      flag: "assets/flags/germany.png",
      url: "Europe/Berlin");

  void setupWorldTime() async {
    print("setupWorldTime");
    await instance.getTime();

    if (!mounted) return;
    Navigator.pushReplacementNamed(context, "/home", arguments: {
      "location": instance.location,
      "flag": instance.flag,
      "time": instance.time,
      "url": instance.url,
      "isDaytime": instance.isDaytime,
    });
    print("setupWorldTime after");
  }

  @override
  void initState() {
    super.initState();

    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: const Center(
        child: SpinKitRotatingCircle(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
