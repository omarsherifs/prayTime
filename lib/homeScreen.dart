
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
  List y;
  PrayTime times;

  initState(){


  }

  getTimes() async {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);
    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    await times.getPrayTimes((position.longitude).toString(), (position.latitude).toString(),formattedDate);
    y.add(times.fajr);
    y.add(times.dhuhr);
    y.add(times.asr);
    y.add(times.maghrib);
    y.add(times.isha);

  }

  

  Widget build(BuildContext context) {
    Widget item(int i) {
      return Container(
        padding: EdgeInsets.all(12),
        width: MediaQuery.of(context).size.width,
        height: 50,
        color: Colors.blue.withOpacity(0.2),
        child: Row(
          children: <Widget>[
            SizedBox(height: 10),
            Text(y[i], style: TextStyle(fontSize: 18, color: Colors.white)),
            Expanded(
              child: Container(),
            ),
            Text(x[i], style: TextStyle(fontSize: 18, color: Colors.white)),
          ],
        ),
      );
    }

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
          Column(
            children: <Widget>[
              Container(
                //height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                //color: Colors.amber,
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 10),
                child: Text(
                  'تواقيت الصلاة',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
              Divider(
                  color: Colors.white,
                  thickness: 1.5,
                  endIndent: 70,
                  indent: 70),
              SizedBox(height: MediaQuery.of(context).size.height / 5),
              item(0),
              SizedBox(height: 10),
              item(1),
              SizedBox(height: 10),
              item(2),
              SizedBox(height: 10),
              item(3),
              SizedBox(height: 10),
              item(4),
              SizedBox(height: 10),
              item(5),
              SizedBox(height: 20),
              Container(
                height: 70,
                color: Colors.grey.withOpacity(0.3),
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(
                  top: 12,
                  left: 12,
                  right: 12,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '10:24:04',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Text(
                      'السبت 15/12/2019',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}