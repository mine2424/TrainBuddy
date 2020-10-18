import 'package:flappy_search_bar/search_bar_style.dart';
import 'package:flutter/material.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:provider/provider.dart';
import 'package:trainBuddy/home/personalHomeStation.dart';
import 'package:trainBuddy/models/mainModel.dart';
import 'package:trainBuddy/models/routeModel.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class SearchedStation {
  final String title;
  final String route;
  final String link;
  final String map;
  final String position;

  SearchedStation(this.title, this.route, this.link, this.map, this.position);
}

class _HomePageState extends State<HomePage> {
  var searchedOsakaMetroRoute;
  int count = 0;
  List sortStaitonData = [];
  List osakaMetroAllStations;
  List<String> searchedList = [];
  List<String> stationNameList = [];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MainModel>(
        create: (_) => MainModel()..fetchOsakaMetroStation(),
        child: Consumer<MainModel>(builder: (context, model, child) {
          osakaMetroAllStations = model.osakaMetroAllStations;
          return Scaffold(
              backgroundColor: Colors.black,
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SearchBar<SearchedStation>(
                  shrinkWrap: true,
                  onSearch: search,
                  minimumChars: 1,
                  placeHolder: Text(
                    '駅名を入力してください',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  icon: Icon(
                    Icons.search,
                  ),
                  searchBarStyle: SearchBarStyle(backgroundColor: Colors.white),
                  // iconActiveColor: Colors.white,
                  cancellationWidget: Text(
                    'Cancel',
                    style: TextStyle(color: Colors.white),
                  ),
                  onItemFound: (SearchedStation searchedStation, int index) {
                    return SingleChildScrollView(
                      child: FlatButton(
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PersonalHomeStation(
                                      searchedStation: searchedStation,
                                      ))),
                        child: ListTile(
                          title: Text(
                            searchedStation.title,
                            style: TextStyle(color: Colors.white),
                          ),
                          subtitle: Text(searchedStation.route,
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    );
                  },
                ),
              ));
        }));
  }

//modelで配列を操作するならこれを参考にすべし（classでしっかり型定義されているから）
  Future<List<SearchedStation>> search(String search) async {
    await Future.delayed(Duration(seconds: 1));
    List<SearchedStation> searchStations = [];
    for (int i = 0; i < osakaMetroAllStations.length; i++) {
      if (osakaMetroAllStations[i][0].contains(search)) {
        searchStations.add(SearchedStation(
            osakaMetroAllStations[i][0],
            osakaMetroAllStations[i][4],
            osakaMetroAllStations[i][1],
            osakaMetroAllStations[i][2],
            osakaMetroAllStations[i][3]));
      }
    }
    return searchStations;
  }
}
