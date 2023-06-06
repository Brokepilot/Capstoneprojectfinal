import 'package:flutter/material.dart';
import 'package:endme/pages/mainpage.dart';
import 'package:endme/pages/viewpage.dart';
import 'package:endme/pages/editpage.dart';
import 'package:endme/pages/friendspage.dart';

void main() {
  runApp(EndMeApp());
}

class EndMeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EndMe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MainPage(totalCreditsTaken: 0, creditsRemaining: 0, userid: 2021106149),
        '/view': (context) => ViewPage(),
        '/edit': (context) => EditPage(),
        '/friends': (context) => FriendsPage(),
      },
    );
  }
}