import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MainModel extends ChangeNotifier {
//
  final osakaMetroAllStations = List();
  final osakaMetroMidousuji = List();
  final osakaMetroTanimachi = List();
  final osakaMetroYotsubashi = List();
  final osakaMetroChuou = List();
  final osakaMetroSennnichimae = List();
  final osakaMetroSakaisuji = List();
  final osakaMetroNagahoriturumiryokuchi = List();
  final osakaMetroImazatosuji = List();
  final osakaMetroNewtrum = List();
//
  fetchOsakaMetroStation() async {
    StorageReference ref =
        FirebaseStorage.instance.ref().child("osakaMetro/stationDetails.json");
    String url = (await ref.getDownloadURL()).toString();

    final response = await http.get(url);
    var listData = jsonDecode(utf8.decode(response.body.runes.toList()));
    final stationDetails = listData["stationDetails"];

    for (var i = 0; i < stationDetails.length; i++) {
      var subStationData = [];
      subStationData.add(stationDetails[i]["station"]);
      subStationData.add(stationDetails[i]["stationHref"]);
      subStationData.add(stationDetails[i]["stationImage"]);
      subStationData.add(stationDetails[i]["getInPosition"]);
      subStationData.add(stationDetails[i]["route"]);
      if (stationDetails[i]["route"] == "御堂筋線") {
        osakaMetroMidousuji.add(subStationData);
      }
      if (stationDetails[i]["route"] == "谷町線") {
        osakaMetroTanimachi.add(subStationData);
      }
      if (stationDetails[i]["route"] == "四つ橋線") {
        osakaMetroYotsubashi.add(subStationData);
      }
      if (stationDetails[i]["route"] == "中央線") {
        osakaMetroChuou.add(subStationData);
      }
      if (stationDetails[i]["route"] == "千日前線") {
        osakaMetroSennnichimae.add(subStationData);
      }
      if (stationDetails[i]["route"] == "堺筋線") {
        osakaMetroSakaisuji.add(subStationData);
      }
      if (stationDetails[i]["route"] == "長堀鶴見緑地線") {
        osakaMetroNagahoriturumiryokuchi.add(subStationData);
      }
      if (stationDetails[i]["route"] == "今里筋線") {
        osakaMetroImazatosuji.add(subStationData);
      }
      if (stationDetails[i]["route"] == "ニュートラム") {
        osakaMetroNewtrum.add(subStationData);
      }
      osakaMetroAllStations.add(subStationData);
    }
    notifyListeners();
  }
}
