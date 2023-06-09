import 'package:flutter/material.dart';
import 'package:endme/pages/editpage.dart';
import 'package:endme/models.dart'; // make sure the path is correct

class ViewPage extends StatefulWidget {
  final User user;

  ViewPage({required this.user});

  @override
  _ViewPageState createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  late Semester selectedSemester;

  @override
  void initState() {
    var class1 =
        ClassTaken(className: '정보컴퓨팅기술개론', creditType: '전기', credits: 3);
    var class2 =
        ClassTaken(className: '정보프로그래밍기초', creditType: '전기', credits: 3);
    selectedSemester = Semester(name: '1-1', classesTaken: [class1, class2]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Semester Credits'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      EditPage(user: widget.user), // pass user to EditPage
                ),
              );
            },
            icon: Icon(Icons.edit),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Select a Semester',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 80,
            width: double.infinity,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: widget.user.semesters.map((semester) {
                return _buildSemesterButton(semester);
              }).toList(),
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildColumn('전기', selectedSemester),
              _buildColumn('전선', selectedSemester),
              _buildColumn('전필', selectedSemester),
              _buildColumn('3.4000', selectedSemester),
            ],
          ),
          SizedBox(height: 20),
          _buildClassList('전기', selectedSemester),
          _buildClassList('전선', selectedSemester),
          _buildClassList('전필', selectedSemester),
          _buildClassList('3.4000', selectedSemester),
        ],
      ),
      bottomNavigationBar: _buildBottomAppBar(context),
    );
  }

  Widget _buildSemesterButton(Semester semester) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 150,
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              selectedSemester = semester;
            });
          },
          child: Text(semester.name),
        ),
      ),
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

  Widget _buildColumn(String title, Semester semester) {
    int totalCredits = 0;
    for (var classTaken in semester.classesTaken) {
      if (classTaken.creditType == title) {
        totalCredits += classTaken.credits;
      }
    }

    return Column(
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Text(
          totalCredits.toString(),
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }

    Widget _buildClassList(String title, Semester semester) {
    List<ClassTaken> classes = semester.classesTaken
        .where((classTaken) => classTaken.creditType == title)
        .toList();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center( // Add Center widget here
            child: Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        ...classes.map((classTaken) => Center(child: Text(classTaken.className))).toList(), // And here
      ],
    );
  }

}
