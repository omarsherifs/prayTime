import 'package:dio/dio.dart';

class PrayTime {
  String fajr;
  String sunrise;
  String dhuhr;
  String asr;
  String maghrib;
  String isha;
  Dio dio = new Dio();
  Response res;

  PrayTime({this.fajr, this.sunrise, this.dhuhr, this.asr, this.maghrib, this.isha});

  getPrayTimes(
      String longitude, String latitude, String date) async {
   //try { 
     res = await dio.get(
        "https://api.pray.zone/v2/times/day.json?longitude=$longitude&latitude=$latitude&date=$date");

      this.fajr = res.data["results"]["datetime"][0]["times"]["Fajr"];
      this.sunrise =  res.data["results"]["datetime"][0]["times"]["Sunrise"];
      this.dhuhr = res.data["results"]["datetime"][0]["times"]["Dhuhr"];
      this.asr = res.data["results"]["datetime"][0]["times"]["Asr"];
      this.maghrib = res.data["results"]["datetime"][0]["times"]["Maghrib"];
      this.isha = res.data["results"]["datetime"][0]["times"]["Isha"];
  
    // }
    // catch(e){
    //   this.fajr = "--:--";
    //   this.dhuhr =  "--:--";
    //   this.asr =  "--:--";
    //   this.maghrib =  "--:--";
    //   this.isha =  "--:--";
    // }


  }
  
}
