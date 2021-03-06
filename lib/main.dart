import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:trainBuddy/bottomNavgationbar/bottomNavgationbar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      locale: Locale("ja", "JP"),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'NotoSerifJP'
      ),
      home: BottomNavgationBarPage(),
    );
  }
}
