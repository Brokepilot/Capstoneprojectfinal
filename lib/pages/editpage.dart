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

  @override
  void initState() {
    // TODO: implement initState
    var class1 = ClassTaken(className: '정보컴퓨팅기술개론', creditType: '전기', credits: 3);
    var class2 = ClassTaken(className: '정보프로그래밍기초', creditType: '전기', credits: 3);
    semesters =  [
      Semester(name: '1-1', classesTaken: [class1, class2])
    ]; 
        selectedSemester =  Semester(name: '1-1', classesTaken: [class1, class2]); 

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
              onChanged: (newValue) {
                // if (newValue != null) {
                //   setState(() {
                //     selectedSemester = newValue;
                //   });
                // }
              },
              items: [],
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
                      // This just adds a dummy class for now.
                      // You'll need to replace this with a dialog or another page where the user can input class details.
                      setState(() {
                        selectedSemester.classesTaken.add(ClassTaken(className: 'New Class', creditType: 'Placeholder', credits: 3));
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
