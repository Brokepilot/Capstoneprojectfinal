import 'package:flutter/material.dart';
import 'package:endme/pages/editpage.dart';

class ViewPage extends StatefulWidget {
  @override
  _ViewPageState createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  String selectedSemester = ''; // Variable to store the selected semester

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
                  builder: (context) => EditPage(),
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
              children: [
                _buildSemesterButton('1-1', 150),
                _buildSemesterButton('1-2', 150),
                _buildSemesterButton('2-1', 150),
                _buildSemesterButton('2-2', 150),
                _buildSemesterButton('3-1', 150),
                _buildSemesterButton('3-2', 150),
                _buildSemesterButton('4-1', 150),
                _buildSemesterButton('4-2', 150),
              ],
            ),
          ),
          SizedBox(height: 20),
          if (selectedSemester.isNotEmpty)
            Text(
              'Selected Semester: $selectedSemester',
              style: TextStyle(fontSize: 20),
            ),
          // Add additional information or widgets for each selected semester here
        ],
      ),
      bottomNavigationBar: _buildBottomAppBar(context),
    );
  }

  Widget _buildSemesterButton(String semester, double width) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: width,
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              selectedSemester = semester;
            });
          },
          child: Text(semester),
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
}
