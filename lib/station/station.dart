import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trainBuddy/models/mainModel.dart';
import 'package:trainBuddy/models/routeModel.dart';
import 'package:trainBuddy/station/personalStation.dart';

class StationRoutePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(height: 50),
          ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: osakaMetroRoute.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: FlatButton(
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
                            osakaMetroRoute[index]["station"].toString(),
                            style:
                                TextStyle(fontSize: 23.5, color: Colors.white),
                          ),
                        ],
                      ),
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
  List sortRouteStations = [];
  EachStationPage({Key key, @required this.osakaMetroRoute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MainModel>(
        lazy: false,
        create: (_) => MainModel()..fetchOsakaMetroStation(),
        child: Container(
          child: Consumer<MainModel>(builder: (context, model, child) {
            
            if (osakaMetroRoute["station"] == "御堂筋線") {
              sortRouteStations = model.osakaMetroMidousuji;
            }
            if (osakaMetroRoute["station"] == "谷町線") {
              sortRouteStations = model.osakaMetroTanimachi;
            }
            if (osakaMetroRoute["station"] == "四つ橋線") {
              sortRouteStations = model.osakaMetroYotsubashi;
            }
            if (osakaMetroRoute["station"] == "中央線") {
              sortRouteStations = model.osakaMetroChuou;
            }
            if (osakaMetroRoute["station"] == "千日前線") {
              sortRouteStations = model.osakaMetroSennnichimae;
            }
            if (osakaMetroRoute["station"] == "堺筋線") {
              sortRouteStations = model.osakaMetroSakaisuji;
            }
            if (osakaMetroRoute["station"] == "長堀鶴見緑地線") {
              sortRouteStations = model.osakaMetroNagahoriturumiryokuchi;
            }
            if (osakaMetroRoute["station"] == "今里筋線") {
              sortRouteStations = model.osakaMetroImazatosuji;
            }
            if (osakaMetroRoute["station"] == "ニュートラム") {
              sortRouteStations = model.osakaMetroNewtrum;
            }
            return Scaffold(
              backgroundColor: Colors.black,
              appBar: AppBar(
                backgroundColor: Color(osakaMetroRoute["colorCode"]),
                title: Text(
                  osakaMetroRoute["station"],
                  style: TextStyle(color: Colors.white),
                ),
                leading: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                    onPressed: () => Navigator.of(context).pop()),
              ),
              body: SingleChildScrollView(
                //ListView.Builderでloadingがうまくいかなかったら
                //ListView.Builderより一個前のwidgetで三項演算子によって書くべし
                  child: (sortRouteStations.length == 0)
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
                              ),
                              CircularProgressIndicator(
                                  valueColor: new AlwaysStoppedAnimation<Color>(
                                      Colors.white))
                            ],
                          ),
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(height: 40),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: sortRouteStations.length,
                              itemBuilder: (BuildContext context, int index) {
                                if (index.isEven) {
                                  return Container(
                                      color: Colors.white24,
                                      child: ListViewStations(
                                          sortRouteStations:
                                              sortRouteStations[index]));
                                } else {
                                  return Container(
                                    color: Colors.black,
                                    child: ListViewStations(
                                        sortRouteStations:
                                            sortRouteStations[index]),
                                  );
                                }
                              },
                            ),
                          ],
                        )),
            );
          }),
        ));
  }
}

class ListViewStations extends StatelessWidget {
  var sortRouteStations;
  ListViewStations({Key key, @required this.sortRouteStations})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FlatButton(
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PersonalStation(
                        stationLists: sortRouteStations,
                      ))),
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    sortRouteStations[0].toString(),
                    style: TextStyle(fontSize: 23.5, color: Colors.white),
                  ),
                ),
                SizedBox(height: 3)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
