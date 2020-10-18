import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'form.dart';

class SettingPage extends StatefulWidget {
  @override
  SettingPageState createState() => SettingPageState();
}

class SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 80,
              ),
              RaisedButton(
                onPressed: () {
                  _launchURL('https://train-buddy-4f8fc.web.app');
                },
                child: Text(
                  '利用規約',
                  style: TextStyle(
                    fontSize: 21,
                  ),
                ),
              ),
              SizedBox(height: 40),
              RaisedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FormPage()));
                },
                child: Text(
                  'お問い合わせ',
                  style: TextStyle(
                    fontSize: 21,
                  ),
                ),
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  //外部URLへページ遷移(webviewではない)
  Future<void> _launchURL(String link) async {
    if (await canLaunch(link)) {
      await launch(
        link,
        universalLinksOnly: true,
        forceSafariVC: true,
        forceWebView: false,
      );
    } else {
      throw 'サイトを開くことが出来ません。。。 $link';
    }
  }
}
