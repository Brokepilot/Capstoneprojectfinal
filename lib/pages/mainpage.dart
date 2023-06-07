import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:endme/models.dart'; // make sure the path is correct

class MainPage extends StatelessWidget {
  final User user;

  MainPage({required this.user});

  @override
  Widget build(BuildContext context) {
    int totalCreditsTaken = user.creditTypes.fold(0, (sum, item) => sum + item.earnedCredits);
    int creditsRemaining = 99 - totalCreditsTaken; // assuming 100 is the total credits needed to graduate

    return Scaffold(
      appBar: AppBar(
        title: Text('GLCCAL'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome ${user.userid}', // use user id from User model
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Expanded(
              child: AspectRatio(
                aspectRatio: 1.2, // Adjust this value to change the size of the pie chart
                child: PieChart(
                  PieChartData(
                    sections: user.creditTypes.map((creditType) { // map over credit types for the user
                      return PieChartSectionData(
                        value: creditType.earnedCredits.toDouble(), // use earnedCredits from CreditType model
                        color: Colors.blue, // you can change this to different colors for different credit types
                        title: creditType.type, // use name from CreditType model
                        titleStyle: TextStyle(fontSize: 16),
                      );
                    }).toList(),
                    sectionsSpace: 0,
                    centerSpaceRadius: 40,
                    startDegreeOffset: -90,
                    borderData: FlBorderData(show: false),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: user.creditTypes.map((creditType) { // map over credit types for the user
                return _buildLegendItem(creditType.type, Colors.blue); // use name from CreditType model, you can change the color for different credit types
              }).toList(),
            ),
            SizedBox(height: 40),
            Container(
              height: 100,
              color: Colors.grey[200],
              child: Center(
                child: Text(
                  '',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 100,
              color: Colors.grey[200],
              child: Center(
                child: Text(
                  '',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
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
      ),
    );
  }

  Widget _buildLegendItem(String label, Color color) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
        color: color,
      ),
      SizedBox(width: 8),
      Text(label),
    ],
  );
}
}