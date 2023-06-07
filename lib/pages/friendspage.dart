import 'package:flutter/material.dart';
import 'package:endme/models.dart';

final User friend1 = User(
  userid: 1,
  creditTypes: [],
  semesters: [
    Semester(name: '1-1', classesTaken: [
      ClassTaken(className: '정보컴퓨팅기술개론', creditType: '전기', credits: 3),
      ClassTaken(className: '정보프로그래밍기초', creditType: '전기', credits: 3),
      ClassTaken(className: '응용자료구조', creditType: '전기', credits: 3),
      ClassTaken(className: '데이터베이스개론', creditType: '전필', credits: 3),
      ClassTaken(className: '인공지능개론', creditType: '전필', credits: 3),
      ClassTaken(className: '정보기술과HCI', creditType: '전선', credits: 3),
      ClassTaken(className: '정보기술과보안', creditType: '전선', credits: 3),
      ClassTaken(className: '소셜네트워크분석', creditType: '전선', credits: 3),
      ClassTaken(className: '오픈소스SW응용', creditType: '3.4000', credits: 3),
      ClassTaken(className: '정보기술과HCI', creditType: '3.4000', credits: 3),
      ClassTaken(className: '정보기술과보안', creditType: '3.4000', credits: 3),
      ClassTaken(className: '소셜네트워크분석', creditType: '3.4000', credits: 3),
      // Add more classes as needed
    ])
  ],
  allClasses: [], // if not used, this can be left as an empty list
);

final User friend2 = User(
  userid: 2,
  creditTypes: [],
  semesters: [
    Semester(name: '1-1', classesTaken: [
      ClassTaken(className: '정보컴퓨팅기술개론', creditType: '전기', credits: 3),
      ClassTaken(className: '정보프로그래밍기초', creditType: '전기', credits: 3),
      ClassTaken(className: '응용자료구조', creditType: '전기', credits: 3),
      // Add more classes as needed
    ])
  ],
  allClasses: [], // if not used, this can be left as an empty list
);


// Add more preset users as needed

final List<User> friends = [friend1, friend2];

class FriendsPage extends StatefulWidget {
  final User user;

  FriendsPage({required this.user});

  @override
  _FriendsPageState createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  User _selectedFriend = friends[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Friends'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              // Perform action when plus icon is pressed
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 16),
            DropdownButton<User>(
              value: _selectedFriend,
              onChanged: (newValue) {
                setState(() {
                  _selectedFriend = newValue!;
                });
              },
              items: friends.map<DropdownMenuItem<User>>((User friend) {
                return DropdownMenuItem<User>(
                  value: friend,
                  child: Text('Friend ${friend.userid}'),
                );
              }).toList(),
            ),
            SizedBox(height: 16),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: _buildClassesTaken('Your Classes', widget.user, _selectedFriend),
                  ),
                  VerticalDivider(width: 16),
                  Expanded(
                    child: _buildClassesTaken('Friend\'s Classes', _selectedFriend, widget.user),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomAppBar(context),
    );
  }

  Widget _buildClassesTaken(String title, User user, User otherUser) {
  // Create a list to hold all the classes the user has taken
  List<ClassTaken> allClassesTaken = [];
  
  // Create a list to hold all the classes the other user has taken
  List<ClassTaken> allOtherClassesTaken = [];

  // Iterate over all the semesters the user has taken
  for (var semester in user.semesters) {
    // For each semester, add the classes taken to the list
    allClassesTaken.addAll(semester.classesTaken);
  }

  // Iterate over all the semesters the other user has taken
  for (var semester in otherUser.semesters) {
    // For each semester, add the classes taken to the list
    allOtherClassesTaken.addAll(semester.classesTaken);
  }

  // Now, you can display all the classes in allClassesTaken just like in ViewPage's _buildClassList
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      Expanded(
        child: ListView.builder(
          itemCount: allClassesTaken.length,
          itemBuilder: (BuildContext context, int index) {
            var classTaken = allClassesTaken[index];
            // Check if this class is also in the other user's classes
            bool isInCommon = allOtherClassesTaken.any((otherClass) => otherClass.className == classTaken.className);
            return ListTile(
              title: Text(classTaken.className),
              tileColor: isInCommon ? Colors.yellow : null, // highlight the tile if the class is in common
            );
          },
        ),
      ),
    ],
  );
}


  Widget _buildBottomAppBar(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () {
              // Navigate to the Main Page
              Navigator.pushNamed(context, '/');
            },
            icon: Icon(Icons.home),
          ),
          IconButton(
            onPressed: () {
              // Navigate to the View Page
              Navigator.pushNamed(context, '/view');
            },
            icon: Icon(Icons.pageview),
          ),
          IconButton(
            onPressed: () {
              // Navigate to the Friends Page
              Navigator.pushNamed(context, '/friends');
            },
            icon: Icon(Icons.people),
          ),
        ],
      ),
    );
  }
}
