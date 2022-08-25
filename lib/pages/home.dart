import 'package:flutter/material.dart';
import 'dart:convert' as convert;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map params = {};

  void goToLocation() async {
    if (!mounted) return;
    dynamic args = await Navigator.pushNamed(context, "/location") ?? {};

    if (args.isNotEmpty) {
      setState(() {
        params = args;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Extract the arguments from the current ModalRoute
    Object? args = ModalRoute.of(context)!.settings.arguments;
    dynamic data = params.isNotEmpty
        ? params
        : convert.jsonDecode(convert.jsonEncode(args));

    print(data);
    String bgImage = data['isDaytime'] ? 'day.png' : 'night.png';
    Color bgColor = data['isDaytime'] ? Colors.blue : Colors.indigoAccent;

    return Scaffold(
      backgroundColor: bgColor,
      // appBar: AppBar(
      //   title: const Text("App Bar"),
      //   centerTitle: true,
      //   backgroundColor: Colors.greenAccent,
      // ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
              children: <Widget>[
                TextButton.icon(
                  onPressed: goToLocation,
                  icon: const Icon(
                    Icons.edit_location,
                    color: Colors.red,
                  ),
                  label: const Text("Edit Location"),
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  color: Colors.transparent,
                  child: Image(
                    image: AssetImage(data['flag']),
                    // width: 80,
                    height: 80,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: const TextStyle(
                        fontSize: 28,
                        letterSpacing: 2,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  data['time'],
                  style: const TextStyle(
                    fontSize: 66,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
