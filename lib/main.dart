import 'package:flutter/material.dart';
import 'package:endme/pages/mainpage.dart';
import 'package:endme/pages/viewpage.dart';
import 'package:endme/pages/editpage.dart';
import 'package:endme/pages/friendspage.dart';
import 'package:endme/models.dart';

void main() {
  // Create some CreditTypes
  var creditType1 = CreditType(type: '전기', requiredCredits: 18);
  var creditType2 = CreditType(type: '전선', requiredCredits: 24);
  var creditType3 = CreditType(type: '전필', requiredCredits: 12);
  var creditType4 = CreditType(type: '3.4000', requiredCredits: 45);

  // Create some Classes
  var class1 = ClassTaken(className: '정보컴퓨팅기술개론', creditType: '전기', credits: 3);
  var class2 = ClassTaken(className: '정보프로그래밍기초', creditType: '전기', credits: 3);
  var class3 = ClassTaken(className: '응용자료구조', creditType: '전기', credits: 3);
  var class4 = ClassTaken(className: '이산구조론', creditType: '전기', credits: 3);
  var class5 = ClassTaken(className: '정보프로그래밍심화', creditType: '전기', credits: 3);
  var class6 = ClassTaken(className: '비즈니스IT', creditType: '전기', credits: 3);
  var class7 = ClassTaken(className: '인공지능기초수학', creditType: '3.4000', credits: 3);
  var class8 = ClassTaken(className: '데이터베이스개론', creditType: '전필', credits: 3);
  var class9 = ClassTaken(className: '인공지능개론', creditType: '전필', credits: 3);
  var class10 = ClassTaken(className: '정보SW공학', creditType: '전필', credits: 3);
  var class11 = ClassTaken(className: '응용정보캡스톤디자인', creditType: '전필', credits: 3);
  var class12 = ClassTaken(className: '데이터분석개론', creditType: '전선', credits: 3);
  var class13 = ClassTaken(className: '웹프로그래밍', creditType: '전선', credits: 3);
  var class14 = ClassTaken(className: '게임설계와구현', creditType: '전선', credits: 3);
  var class15 = ClassTaken(className: '알고리즘응용', creditType: '전선', credits: 3);
  var class16 = ClassTaken(className: '자연어정보분석', creditType: '전선', credits: 3);
  var class17 = ClassTaken(className: '고급데이터분석', creditType: '전선', credits: 3);
  var class18 = ClassTaken(className: '응용모바일프로그래밍', creditType: '전선', credits: 3);
  var class19 = ClassTaken(className: '린스타트업프로젝트', creditType: '전선', credits: 3);
  var class20 = ClassTaken(className: '기술경영의이해', creditType: '전선', credits: 3);

  // Create some Semesters
  var semester1 = Semester(name: '1-1', classesTaken: [class1, class2]);
  var semester2 = Semester(name: '1-2', classesTaken: [class3, class6]);
  var semester3 = Semester(name: '2-1', classesTaken: [class4, class7]);
  var semester4 = Semester(name: '2-2', classesTaken: [class8, class5]);
  var semester5 = Semester(name: '3-1', classesTaken: []);
  var semester6 = Semester(name: '3-2', classesTaken: []);
  var semester7 = Semester(name: '4-1', classesTaken: []);
  var semester8 = Semester(name: '4-2', classesTaken: []);

  // Create a User
  var user = User(userid: 2021106149, creditTypes: [creditType1, creditType2, creditType3, creditType4], semesters: [semester1, semester2, semester3, semester4, semester5, semester6, semester7, semester8]);

  runApp(EndMeApp(user: user));
}

class EndMeApp extends StatelessWidget {
  final User user;

  EndMeApp({required this.user});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EndMe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MainPage(user: user),
        '/view': (context) => ViewPage(user: user),
        '/edit': (context) => EditPage(user: user),
        '/friends': (context) => FriendsPage(),
      },
    );
  }
}
