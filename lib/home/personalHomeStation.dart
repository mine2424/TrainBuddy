import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:trainBuddy/models/routeModel.dart';

class PersonalHomeStation extends StatelessWidget {
  var searchedStation, searchedOsakaMetroRoute;
  PersonalHomeStation({Key key, @required this.searchedStation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    for (int index = 0; index < osakaMetroRoute.length; index++) {
      if (osakaMetroRoute[index]['route'] == searchedStation.route) {
        searchedOsakaMetroRoute = osakaMetroRoute[index];
        print(searchedOsakaMetroRoute);
      }
    }
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color(searchedOsakaMetroRoute['colorCode']),
        title: Text(
          searchedStation.title,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            SizedBox(height: 30),
            Center(
              child: Text(
                "駅構内",
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
            Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Container(
                      height: 300,
                      child: PhotoView(
                        enableRotation: true,
                        maxScale: PhotoViewComputedScale.covered * 3.5,
                        imageProvider: NetworkImage(searchedStation.map),
                        loadingBuilder: (context, event) => Center(
                          child: Container(
                            width: 20.0,
                            height: 20.0,
                            child: CircularProgressIndicator(
                              value: event == null
                                  ? 0
                                  : event.cumulativeBytesLoaded /
                                      event.expectedTotalBytes,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            )),
            SizedBox(height: 50),
            Center(
              child: Text(
                searchedStation.title + "駅の乗り換え案内",
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 30),
            Center(
                child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 300,
                      child: PhotoView(
                        enableRotation: true,
                        maxScale: PhotoViewComputedScale.covered * 3.5,
                        imageProvider: NetworkImage(searchedStation.position),
                        loadingBuilder: (context, event) => Center(
                          child: Container(
                            width: 20.0,
                            height: 20.0,
                            child: CircularProgressIndicator(
                              value: event == null
                                  ? 0
                                  : event.cumulativeBytesLoaded /
                                      event.expectedTotalBytes,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            )),
            SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}
