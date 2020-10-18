import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class PersonalStation extends StatelessWidget {
  var stationLists, osakaMetroRoute;
  PersonalStation(
      {Key key, @required this.stationLists, @required this.osakaMetroRoute})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color(osakaMetroRoute["colorCode"]),
        title: Text(
          stationLists[0],
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
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            SizedBox(height: 40),
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
                        imageProvider: NetworkImage(stationLists[2]),
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
                    ),
                  ],
                ),
              ],
            )),
            SizedBox(height: 50),
            Center(
              child: Text(
                stationLists[0] + "駅の乗り換え案内",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            SizedBox(height: 30),
            Center(
                child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 350,
                      child: PhotoView(
                        imageProvider: NetworkImage(stationLists[3]),
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
                    ),
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
