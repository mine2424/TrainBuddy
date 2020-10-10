import 'package:flutter/material.dart';

class PersonalStation extends StatelessWidget {
  var stationLists;
  var osakaMetroRoute;
  PersonalStation(
      {Key key, @required this.osakaMetroRoute, @required this.stationLists})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20),
              child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                  onPressed: () => Navigator.of(context).pop()),
            ),
            Center(
              child: Text(
                stationLists[0],
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
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
              children: [
                Stack(
                  children: [
                    Container(
                      child: Image.network(
                        stationLists[2],
                      ),
                    ),
                  ],
                ),
              ],
            )),
            SizedBox(height: 20),
            Center(
              child: Text(
                stationLists[0] + "駅の乗り換え案内",
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
            Center(
                child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      child: Image.network(
                        stationLists[3],
                      ),
                    ),
                  ],
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
// Expanded(
//   flex: 1,
//   child: PhotoView(
//     imageProvider: CachedNetworkImageProvider("http://via.placeholder.com/350x150"),
//     ),
// ),
