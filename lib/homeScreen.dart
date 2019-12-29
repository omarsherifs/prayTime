import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';

import 'prayTimeController.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List x = ["الفجر", "الشروق", "الظهر", "العصر", "االمغرب", "العشاء"];
  List y = new List();
  PrayTime times = new PrayTime();

  void initState() {
    super.initState();
    getTimes();
  }

  getTimes() async {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    await times.getPrayTimes((position.longitude).toString(),
        (position.latitude).toString(), formattedDate);
    y.add(times.fajr);
    y.add(times.sunrise);
    y.add(times.dhuhr);
    y.add(times.asr);
    y.add(times.maghrib);
    y.add(times.isha);
    setState(() {});
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: new DecorationImage(
                image: AssetImage('image/b.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ),
          ),
          ListView.builder(
            itemCount: y.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height / 8,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    width: MediaQuery.of(context).size.width,
                    color: Colors.blue.withOpacity(0.2),
                    child: Row(
                      children: <Widget>[
                        SizedBox(height: 10),
                        Text(y[index],
                            style:
                                TextStyle(fontSize: 18, color: Colors.white)),
                        Expanded(
                          child: Container(),
                        ),
                        Text(x[index],
                            style:
                                TextStyle(fontSize: 18, color: Colors.white)),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
