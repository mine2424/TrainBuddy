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
                            osakaMetroRoute[index]["route"].toString(),
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
            if (osakaMetroRoute["route"] == "御堂筋線") {
              sortRouteStations = model.osakaMetroMidousuji;
            }
            if (osakaMetroRoute["route"] == "谷町線") {
              sortRouteStations = model.osakaMetroTanimachi;
            }
            if (osakaMetroRoute["route"] == "四つ橋線") {
              sortRouteStations = model.osakaMetroYotsubashi;
            }
            if (osakaMetroRoute["route"] == "中央線") {
              sortRouteStations = model.osakaMetroChuou;
            }
            if (osakaMetroRoute["route"] == "千日前線") {
              sortRouteStations = model.osakaMetroSennnichimae;
            }
            if (osakaMetroRoute["route"] == "堺筋線") {
              sortRouteStations = model.osakaMetroSakaisuji;
            }
            if (osakaMetroRoute["route"] == "長堀鶴見緑地線") {
              sortRouteStations = model.osakaMetroNagahoriturumiryokuchi;
            }
            if (osakaMetroRoute["route"] == "今里筋線") {
              sortRouteStations = model.osakaMetroImazatosuji;
            }
            if (osakaMetroRoute["route"] == "ニュートラム") {
              sortRouteStations = model.osakaMetroNewtrum;
            }
            return Scaffold(
              backgroundColor: Colors.black,
              appBar: AppBar(
                backgroundColor: Color(osakaMetroRoute["colorCode"]),
                title: Text(
                  osakaMetroRoute["route"],
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
                                              sortRouteStations[index],
                                          osakaMetroRoute: osakaMetroRoute));
                                } else {
                                  return Container(
                                    color: Colors.black,
                                    child: ListViewStations(
                                        sortRouteStations:
                                            sortRouteStations[index],
                                        osakaMetroRoute: osakaMetroRoute),
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
  var sortRouteStations, osakaMetroRoute;
  ListViewStations(
      {Key key,
      @required this.sortRouteStations,
      @required this.osakaMetroRoute})
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
                        osakaMetroRoute: osakaMetroRoute,
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
