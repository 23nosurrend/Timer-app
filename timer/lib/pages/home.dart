import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map<dynamic, dynamic>? data;

  @override
  Widget build(BuildContext context) {
    final data =
        ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>?;
    print('this is data: $data');
    String bgImage = data!['isDayTime'] ? 'day.png' : 'night.png';
    Color bgColor = data['isDayTime'] ? Colors.blue : Colors.indigoAccent;

    return Scaffold(
      backgroundColor: bgColor,
        body: SafeArea(
            child: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/$bgImage'), fit: BoxFit.cover)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 220, 0, 0),
        child: Column(
          children: [
            TextButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/location');
              },
              label: const Text(
                "change location",
                style: TextStyle(
                  color:Colors.white,
                  
                ),
                ),
              icon:  Icon(
                Icons.edit_location,
                color: Colors.grey[300],
                ),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(data['location'].toString(),
                    style: const TextStyle(
                      fontSize: 28.0, 
                      letterSpacing: 2.0,
                      color:Colors.white
                      ))
              ],
            ),
            const SizedBox(height: 20),
            Text(
                data != null && data['time'] != null
                    ? data['time'].toString()
                    : 'Unknown Time',
                style: const TextStyle(
                  fontSize: 66,
                ))
          ],
        ),
      ),
    )));
  }
}
