import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirebaseStudentApp extends StatelessWidget {
  const FirebaseStudentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: StudentList(),
    );
  }
}

class StudentList extends StatefulWidget {
  const StudentList({super.key});

  @override
  State<StudentList> createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  late CollectionReference studentCollectionRef =
      firebaseFirestore.collection("Students");
  List<Student> studentList = [];
  bool readDataInProgress = false;

  TextEditingController nameTEController = TextEditingController();
  TextEditingController courseTEController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // fetchStudentList();
    readData();
  }

  Future<void> readData() async {
    studentList.clear();
    readDataInProgress = true;
    setState(() {});
    final QuerySnapshot result = await studentCollectionRef.get();

    for (QueryDocumentSnapshot element in result.docs) {
      Student student =
          Student(element.get("name"), element.get('course'), element.id);
      studentList.add(student);
    }
    readDataInProgress = false;
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student List"),
        backgroundColor: Colors.greenAccent,
        elevation: 10.0,
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: readData,
        child: StreamBuilder(
            stream: studentCollectionRef.snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasData) {
                studentList.clear();
                for (QueryDocumentSnapshot element in snapshot.data!.docs) {
                  Student student = Student(
                      element.get("name"), element.get('course'), element.id);
                  studentList.add(student);
                }
                return ListView.builder(
                    itemCount: studentList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: const CircleAvatar(
                          backgroundColor: Colors.yellow,
                          child: Icon(
                            Icons.person,
                            color: Colors.black,
                          ),
                        ),
                        trailing: Wrap(
                          children: [
                            IconButton(
                                onPressed: () {
                                  studentCollectionRef
                                      .doc(studentList[index].id)
                                      .update({
                                    'name': 'Need to update',
                                    'course': 'Need to update'
                                  });
                                },
                                icon: const Icon(Icons.edit)),
                            IconButton(
                                onPressed: () {
                                  studentCollectionRef
                                      .doc(studentList[index].id)
                                      .delete();
                                },
                                icon: const Icon(Icons.delete)),
                          ],
                        ),
                        title: Text(studentList[index].name),
                        subtitle: Text(studentList[index].course),
                      );
                    });
              }
              return const SizedBox();
            }),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showAddStudentBottomSheet();
        },
      ),
    );
  }

  void showAddStudentBottomSheet() async {
    studentList.clear();
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                TextFormField(
                  controller: nameTEController,
                ),
                const SizedBox(
                  height: 3,
                ),
                TextFormField(
                  controller: courseTEController,
                ),
                const SizedBox(
                  height: 5,
                ),
                ElevatedButton(
                    onPressed: () async {
                      await studentCollectionRef.add({
                        'name': nameTEController.text.trim(),
                        'course': courseTEController.text.trim()
                      });
                      nameTEController.clear();
                      courseTEController.clear();
                      Navigator.pop(context);
                    },
                    child: const Text("Add"))
              ],
            ),
          );
        });
  }
}

class Student {
  String name;
  String course;
  String id;

  Student(this.name, this.course, this.id);
}
