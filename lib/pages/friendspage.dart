import 'package:flutter/material.dart';

class FriendsPage extends StatelessWidget {
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select an Option',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            DropdownButton<String>(
              value: '1',
              onChanged: (newValue) {
                // Handle dropdown value change
              },
              items: [
                '1',
                '2',
                '3',
                '4',
                '5',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomAppBar(context),
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
