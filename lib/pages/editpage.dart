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
  late ClassTaken selectedClass;

  @override
  void initState() {
    // Initialize semesters with user's semesters
    semesters = widget.user.semesters;
    // Initialize selectedSemester with the first semester
    selectedSemester = semesters[0];

    // Initialize allClasses with user's allClasses
    allClasses = widget.user.allClasses;
    // Initialize selectedClass with the first class
    selectedClass = allClasses[0];

    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Semester Edit'),
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              // Navigate back to the View Page
              Navigator.pop(context);
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
              'Select a Semester',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            if (semesters != null) 
            DropdownButton<Semester>(
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
            Text(
              'Select a Class',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            if (allClasses != null) 
            DropdownButton<ClassTaken>(
              value: selectedClass,
              onChanged: (ClassTaken? newValue) {
                if (newValue != null) {
                  setState(() {
                    selectedClass = newValue;
                  });
                }
              },
              items: allClasses.map((class_) {
                return DropdownMenuItem(
                  value: class_,
                  child: Text(class_.className),
                );
              }).toList(),
            ),
            if (selectedSemester != null)
              Column(
                children: [
                  ...selectedSemester.classesTaken.map((class_) {
                    return ListTile(
                      title: Text('Class: ${class_.className}, Credits: ${class_.credits}'),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            selectedSemester.classesTaken.remove(class_);
                          });
                        },
                      ),
                    );
                  }).toList(),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedSemester.classesTaken.add(selectedClass);
                      });
                    },
                    child: Text('Add Class'),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class StudyClass {
}
