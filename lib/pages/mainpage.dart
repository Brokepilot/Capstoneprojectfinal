import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:endme/models.dart'; // make sure the path is correct

class MainPage extends StatelessWidget {
  final User user;

  MainPage({required this.user});

  @override
  Widget build(BuildContext context) {
    int totalCreditsTaken = user.totalCreditsTaken();
    int creditsTaking = user.totalCreditsInSemester('3-1');
    int creditsRemaining = 99 -
        (totalCreditsTaken +
            creditsTaking); // assuming 100 is the total credits needed to graduate

  List<PieChartSectionData> sections = [
  PieChartSectionData(
    value: totalCreditsTaken.toDouble(),
    color: Colors.green,
    title: '',
    titleStyle: TextStyle(fontSize: 16, color: Colors.white),
  ),
  PieChartSectionData(
    value: creditsTaking.toDouble(),
    color: Colors.orange,
    title: '',
    titleStyle: TextStyle(fontSize: 16, color: Colors.white),
  ),
  PieChartSectionData(
    value: creditsRemaining.toDouble(),
    color: Colors.grey,
    title: '',
    titleStyle: TextStyle(fontSize: 16, color: Colors.white),
  ),
];



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
                aspectRatio:
                    1.2, // Adjust this value to change the size of the pie chart
                child: PieChart(
                  PieChartData(
                    sections: sections,
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
              children: _buildLegendItems(sections),
            ),
            SizedBox(height: 40),
            Container(
              height: 100,
              color: Colors.grey[200],
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("AIE", style: TextStyle(fontSize: 20)),
                    _buildMajorColumn('전기'),
                    _buildMajorColumn('전선'),
                    _buildMajorColumn('전필'),
                    _buildMajorColumn('3.4000'),
                  ],
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
                // Navigate to the Edit Page
                Navigator.pushNamed(context, '/view');
              },
              icon: Icon(Icons.edit),
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

  List<Widget> _buildLegendItems(List<PieChartSectionData> sections) {
  List<String> labels = ['Taken', 'Taking', 'Remaining'];
  return sections.asMap().entries.map((entry) {
    int idx = entry.key;
    PieChartSectionData section = entry.value;
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          color: section.color,
        ),
        SizedBox(width: 5),
        Text('${labels[idx]}: ${section.value.toInt()}', style: TextStyle(fontSize: 16)),
      ],
    );
  }).toList();
}



  Widget _buildMajorColumn(String type) {
  int earnedCredits = user.creditsEarnedOfType(type);
  int requiredCredits = user.requiredCreditsOfType(type);
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        type, // Display the type
        style: TextStyle(fontSize: 20),
      ),
      Text(
        '$earnedCredits/$requiredCredits', // Display the credit count
        style: TextStyle(fontSize: 16),
      ),
    ],
  );
}

}
