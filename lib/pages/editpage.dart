import 'package:flutter/material.dart';
import 'package:endme/models.dart'; // make sure the path is correct

class EditPage extends StatefulWidget {
  final User user;

  EditPage({required this.user});

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  late List<Semester> semesters;
  late Semester selectedSemester;
  late List<ClassTaken> allClasses;
  late List<ClassTaken>
      selectedClasses; // for keeping track of selected classes
  late String selectedType; // for keeping track of selected type

  @override
  void initState() {
    super.initState();

    // Initialize semesters with user's semesters
    semesters = widget.user.semesters;
    // Initialize selectedSemester with the first semester
    selectedSemester = semesters[0];

    // Initialize allClasses with user's allClasses
    allClasses = widget.user.allClasses;

    // Initialize selectedClasses with an empty list
    selectedClasses = [];

    // Initialize selectedType with "T1"
    selectedType = "T1";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Semester Edit'),
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () {
              setState(() {
                selectedSemester.classesTaken = selectedClasses;
              });
              // Navigate back to the View Page
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Select a Semester',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            if (semesters != null)
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  child: DropdownButton<Semester>(
                    isExpanded: true,
                    value: selectedSemester,
                    onChanged: (Semester? newValue) {
                      if (newValue != null) {
                        setState(() {
                          selectedSemester = newValue;
                        });
                      }
                    },
                    items: semesters.map((semester) {
                      return DropdownMenuItem(
                        value: semester,
                        child: Text(semester.name),
                      );
                    }).toList(),
                  ),
                ),
              ),
            SizedBox(height: 16),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...["전기", "전선", "전필", "3.4000"]
                          .map(
                            (type) => Container(
                              width: MediaQuery.of(context).size.width / 4,
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    selectedType = type;
                                  });
                                },
                                child: Text(type),
                              ),
                            ),
                          )
                          .toList(),
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: allClasses.length,
                      itemBuilder: (context, index) {
                        var class_ = allClasses[index];
                        if (class_.creditType != selectedType) {
                          return SizedBox.shrink();
                        }
                        var isSelected = selectedClasses.contains(class_);
                        return ListTile(
                          tileColor: isSelected ? Colors.lightBlueAccent : null,
                          title: Text(class_.className),
                          trailing: IconButton(
                            icon: Icon(isSelected ? Icons.check : Icons.add),
                            onPressed: () {
                              setState(() {
                                if (isSelected) {
                                  selectedClasses.remove(class_);
                                } else {
                                  selectedClasses.add(class_);
                                }
                              });
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
