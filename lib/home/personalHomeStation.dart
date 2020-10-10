import 'package:flutter/material.dart';

class PersonalHomeStation extends StatelessWidget {
  var searchedStation;
  PersonalHomeStation({Key key, @required this.searchedStation})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
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
              searchedStation.title,
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
                    height: 230,
                    child:
                        Image.network(searchedStation.map, fit: BoxFit.cover),
                  ),
                ],
              ),
            ],
          )),
          SizedBox(height: 20),
          Center(
            child: Text(
              searchedStation.title + "駅の乗り換え案内",
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
                    height: 230,
                    child: Image.network(searchedStation.position,
                        fit: BoxFit.cover),
                  ),
                ],
              ),
            ],
          )),
        ],
      ),
    );
  }
}
