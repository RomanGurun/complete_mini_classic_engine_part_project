import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //Required
  await Firebase.initializeApp();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.blue,
        hintColor: Colors.cyan,
      ),
      home: Myapp(),
    ),
  );
}

class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  late String studentName, studentID, studyProgramID;
  late double studentGPA;

  getStudentName(name) {
    this.studentName = name;
  }

  getStudentId(id) {
    this.studentID = id;
  }

  getStudyProgramID(programID) {
    this.studyProgramID = programID;
  }

  getStudentGPA(gpa) {
    this.studentGPA = double.parse(gpa);
  }

  createData() {
    print("Creaated Dataa");
    //   Get a refernce to a firestore
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Create a reference to a document using StudentName as DocumentID);

    DocumentReference documentReference = firestore
        .collection("MyStudents")
        .doc(studentName);
    // create a mapof the data
    Map<String, dynamic> students = {
      "studentName": studentName,
      "studentID": studentID,
      "studyProgramID": studyProgramID,
      "studentGPA": studentGPA,
    };

    // set data into a FireStore
    documentReference
        .set(students)
        .whenComplete(() {
          print("$studentName created successfully");
        })
        .catchError((error) {
          print("Error creating data : $error");
        });
  }

  readData() async {
    print("Read Dataa");
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    DocumentReference documentReference = firestore
        .collection("MyStudents")
        .doc(studentName);
    DocumentSnapshot snapshot = await documentReference.get();
    if (snapshot.exists) {
      print("Student Data :${snapshot.data()}");
      var data = snapshot.data() as Map<String, dynamic>;
      print("Name : ${data['studentName']}");
      print("ID : ${data['studentID']}");
      print("Program : ${data['studyProgramID']}");
      print("GPA : ${data['studentGPA']}");
    } else {
      print("No student found with Name $studentName");
    }
  }

  updateData() {
    print("Updated Dataa");
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    DocumentReference documentReference = firestore
        .collection("MyStudents")
        .doc(studentName);
    Map<String, dynamic> updateData = {
      "studentName": studentName,
      "studentID":studentID,
      "studyProgramID": studyProgramID,
      "studentGPA": studentGPA,
    };

    documentReference
        .update(updateData)
        .whenComplete(() {
          print("$studentName updated successfully !");
        })
        .catchError((onError) {
          print("Error updating data : $onError");
        });
  }

  deleteData() {
    print("Deleted Dataa");

    FirebaseFirestore firestore = FirebaseFirestore.instance;
    DocumentReference documentReference = firestore
        .collection("MyStudents")
        .doc(studentName);
    documentReference
        .delete()
        .whenComplete(() {
          print("$studentName deleted successfully");
        })
        .catchError((onError) {
          print("Error deleting data $onError");
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Flutter College")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Name",
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  ),
                ),
                onChanged: (String name) {
                  getStudentName(name);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Student ID",
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  ),
                ),
                onChanged: (String id) {
                  getStudentId(id);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Study Program ID",
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  ),
                ),
                onChanged: (String programID) {
                  getStudyProgramID(programID);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "GPA",
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  ),
                ),
                onChanged: (String gpa) {
                  getStudentGPA(gpa);
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () {
                    createData();
                    // Your action here
                    print("Button pressed!");
                  },
                  child: Text("Create"),
                ),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () {
                    readData();
                    // Your action here
                    print("Button pressed!");
                  },
                  child: Text("Read"),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () {
                    updateData();
                    // Your action here
                    print("Button pressed!");
                  },
                  child: Text("Update"),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () {
                    deleteData();

                    // Your action here
                    print("Button pressed!");
                  },
                  child: Text("Delete"),
                ),
              ],
            ),
Padding(
  padding: const EdgeInsets.all(8.0),
  child: Row(
    textDirection: TextDirection.ltr,
    children: [
      Expanded(child: Text("Name"),),
      Expanded(child: Text("Student ID")),
      Expanded(child: Text("Program ID")),
      Expanded(child: Text("GPA")),

    ],
  ),
),
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("MyStudents")
                  .snapshots(),
              builder: (context, snapshot) {
                if(snapshot.hasData){
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context,index){
                      DocumentSnapshot documentSnapshot =
                          snapshot.data!.docs[index];
                      return Row(
                        children: [
                        Expanded(child: Text(
                          documentSnapshot["studentName"]
                        ),
                        ),

                        Expanded(
                          child: Text(documentSnapshot["studentID"]),

                        ),
                          Expanded(child: Text(documentSnapshot["studyProgramID"]),
                          ),

                          Expanded(child: Text(documentSnapshot["studentGPA"].toString()),
                          ),


                        ],
                      );
                    },

                  );
                }else{
                  return Align(
                    alignment: FractionalOffset.bottomCenter,
child: CircularProgressIndicator(),                  );

                }

              },
            ),
          ],
        ),
      ),
    );
  }
}
