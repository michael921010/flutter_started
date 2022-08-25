import 'package:flutter/material.dart';
import 'package:demo/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  int count = 0;

  static String dir = "assets/flags/";
  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: '${dir}uk.png'),
    WorldTime(
        url: 'Europe/Athens', location: 'Athens', flag: '${dir}greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: '${dir}egypt.png'),
    WorldTime(
        url: 'Africa/Nairobi', location: 'Nairobi', flag: '${dir}kenya.png'),
    WorldTime(
        url: 'America/Chicago', location: 'Chicago', flag: '${dir}usa.png'),
    WorldTime(
        url: 'America/New_York', location: 'New York', flag: '${dir}usa.png'),
    WorldTime(
        url: 'Asia/Seoul', location: 'Seoul', flag: '${dir}south_korea.png'),
    WorldTime(
        url: 'Asia/Jakarta', location: 'Jakarta', flag: '${dir}indonesia.png'),
  ];

  void addCount([int offset = 1 /* default value of offset is 1 */]) {
    if (!mounted) return;

    setState(() {
      count += offset;
    });
  }

  void getData() {
    // simulate network request with third API
    Future.delayed(const Duration(seconds: 4), () {
      debugPrint("Hi, after 4 seconds.");
      addCount();
    });
  }

  void getDataWithAsync() async {
    // simulate network request with third API
    int offset = await Future.delayed(const Duration(seconds: 2), () {
      debugPrint("Hello, after 2 seconds.");
      return 2;
    });

    addCount(offset);
  }

  void switchToLocation(WorldTime instance) async {
    print(instance.location);
    await instance.getTime();

    if (!mounted) return;
    Navigator.pop(context, {
      "location": instance.location,
      "flag": instance.flag,
      "time": instance.time,
      "url": instance.url,
      "isDaytime": instance.isDaytime,
    });
  }

  @override
  void initState() {
    super.initState();

    getData();
    getDataWithAsync();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text("Choose a Location"),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
            child: Card(
              child: ListTile(
                onTap: () {
                  switchToLocation(locations[index]);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage(locations[index].flag),
                ),
              ),
            ),
          );
        },
      ),
      // body: ElevatedButton(
      //   onPressed: addCount,
      //   child: Text("counter is $count"),
      // ),
    );
  }
}
