import 'package:dio/dio.dart';

class PrayTime {
  String fajr;
  String dhuhr;
  String asr;
  String maghrib;
  String isha;
  Dio dio;
  Response res;

  PrayTime({this.fajr, this.dhuhr, this.asr, this.maghrib, this.isha});

  getPrayTimes(
      String longitude, String latitude, String elevation, String date) async {
    res = await dio.get(
        "https://api.pray.zone/v2/times/day.json?longitude=$longitude&latitude=$latitude&elevation=$elevation&date=$date");
    PrayTime time;
    time = new PrayTime(
      fajr: res.data["results"]["datetime"][0]["times"]["Fajr"],
      dhuhr: res.data["results"]["datetime"][0]["times"]["Dhuhr"],
      asr: res.data["results"]["datetime"][0]["times"]["Asr"],
      maghrib: res.data["results"]["datetime"][0]["times"]["Maghrib"],
      isha: res.data["results"]["datetime"][0]["times"]["Isha"]
    );
  }
  
}
