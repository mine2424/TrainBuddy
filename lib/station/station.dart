import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trainBuddy/models/mainModel.dart';
import 'package:trainBuddy/station/personalStation.dart';

class StationRoutePage extends StatelessWidget {
  List<String> osakaMetroRoute = [
    '御堂筋線',
    '谷町線',
    '四つ橋線',
    '中央線',
    '千日前線',
    '堺筋線',
    '長堀鶴見緑地線',
    '今里筋線',
    'ニュートラム'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(height: 30),
          ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: osakaMetroRoute.length,
              itemBuilder: (BuildContext context, int index) {
                return FlatButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EachStationPage(
                                osakaMetroRoute: osakaMetroRoute[index],
                              ))),
                  child: Container(
                    child: Column(
                      children: [
                        Text(
                          osakaMetroRoute[index].toString(),
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                );
              })
        ],
      )),
    );
  }
}

class EachStationPage extends StatelessWidget {
  var osakaMetroRoute;
  var sortRouteStations;
  EachStationPage({Key key, @required this.osakaMetroRoute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MainModel>(
      create: (_) => MainModel()..fetchOsakaMetroStation(),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Consumer<MainModel>(builder: (context, model, child) {
            if (osakaMetroRoute == "御堂筋線") {
              sortRouteStations = model.osakaMetroMidousuji;
            }
            if (osakaMetroRoute == "谷町線") {
              sortRouteStations = model.osakaMetroTanimachi;
            }
            if (osakaMetroRoute == "四つ橋線") {
              sortRouteStations = model.osakaMetroYotsubashi;
            }
            if (osakaMetroRoute == "中央線") {
              sortRouteStations = model.osakaMetroChuou;
            }
            if (osakaMetroRoute == "千日前線") {
              sortRouteStations = model.osakaMetroSennnichimae;
            }
            if (osakaMetroRoute == "堺筋線") {
              sortRouteStations = model.osakaMetroSakaisuji;
            }
            if (osakaMetroRoute == "長堀鶴見緑地線") {
              sortRouteStations = model.osakaMetroNagahoriturumiryokuchi;
            }
            if (osakaMetroRoute == "今里筋線") {
              sortRouteStations = model.osakaMetroImazatosuji;
            }
            if (osakaMetroRoute == "ニュートラム") {
              sortRouteStations = model.osakaMetroNewtrum;
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20),
                  child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                      onPressed: () => Navigator.of(context).pop()),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: sortRouteStations.length,
                  itemBuilder: (BuildContext context, int index) {
                    return FlatButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PersonalStation(
                                    osakaMetroRoute: osakaMetroRoute,
                                    stationLists: sortRouteStations[index],
                                  ))),
                      child: Container(
                        child: Column(
                          children: [
                            Text(
                              sortRouteStations[index][0].toString(),
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}

