import 'package:flutter/material.dart';
import 'package:timer/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});
  @override
  LoadingState createState() => LoadingState();
}

class LoadingState extends State<Loading> {
  String time = 'Loading';
  void setupWorldTime() async {
    WorldTime instance = WorldTime(
        location: 'berlin', flag: 'germany.png', url: 'Europe/Berlin');
    await instance.getTime();
    if (mounted) {
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        'location': instance.location,
        'flag': instance.flag,
        'time': instance.time,
        'isDayTime': instance.isDayTime
      });
    }
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Colors.blueAccent,
        body: Center(
          child: SpinKitFadingCube(
            color: Colors.white,
            size: 100.0,
          ),
        ));
  }
}
