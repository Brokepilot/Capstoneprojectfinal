import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class MainPage extends StatelessWidget {
  final int totalCreditsTaken; // Variable to store total credits taken
  final int creditsRemaining; // Variable to store credits remaining
  final int userid;

  MainPage({required this.totalCreditsTaken, required this.creditsRemaining, required this.userid});

  @override
  Widget build(BuildContext context) {
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
              'Welcome $userid',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Expanded(
              child: AspectRatio(
                aspectRatio: 1.2, // Adjust this value to change the size of the pie chart
                child: PieChart(
                  PieChartData(
                    sections: [
                      PieChartSectionData(
                        value: 30,
                        color: Colors.blue,
                        title: '',
                        titleStyle: TextStyle(fontSize: 16),
                      ),
                      PieChartSectionData(
                        value: 50,
                        color: Colors.green,
                        title: '',
                        titleStyle: TextStyle(fontSize: 16),
                      ),
                      PieChartSectionData(
                        value: 20,
                        color: Colors.orange,
                        title: '',
                        titleStyle: TextStyle(fontSize: 16),
                      ),
                    ],
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
              children: [
                _buildLegendItem('Field 1', Colors.blue),
                _buildLegendItem('Field 2', Colors.green),
                _buildLegendItem('Field 3', Colors.orange),
              ],
            ),
            SizedBox(height: 40),
            Container(
              height: 100,
              color: Colors.grey[200],
              child: Center(
                child: Text(
                  'Container 1',
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
                  'Container 2',
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
