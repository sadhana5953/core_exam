import 'dart:io';

import 'package:core_exam/uttils/global%20var/var.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

File? fileImage;

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  void _showDialog(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: SingleChildScrollView(
          child: Column(
            children: [
              Text('${(index < 0) ? 'Add Data Screen' : 'Update Dialog'}\n'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                      onPressed: () async {
                        XFile? imagePath = await imagePicker.pickImage(
                            source: ImageSource.gallery);
                        setState(() {
                          fileImage = File(imagePath!.path);
                        });
                      },
                      child:Text("Add Image")),
                  IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: txtName,
                  decoration: InputDecoration(
                    hintText: 'Enter Student Name',
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.indigo, width: 3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.indigo, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: txtGrid,
                  decoration: InputDecoration(
                    hintText: 'Enter Student Grid',
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.indigo, width: 3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.indigo, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: txtStd,
                  decoration: InputDecoration(
                    hintText: 'Enter Student Standard',
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.indigo, width: 3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.indigo, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          (index < 0)
              ? TextButton(
                  onPressed: () {
                    setState(() {
                      student.add(studentModel(
                          imgFile: fileImage,
                          student_name: txtName.text,
                          student_grid: txtGrid.text,
                          student_std: txtStd.text));
                      txtName.clear();
                      txtStd.clear();
                      txtGrid.clear();
                      fileImage = null;
                      Navigator.of(context).pop();
                    });
                  },
                  child: Text("ADD"))
              : TextButton(
                  onPressed: () {
                    setState(() {
                      student[index].imgFile = fileImage;
                      student[index].student_name = txtName.text;
                      student[index].student_grid = txtGrid.text;
                      student[index].student_std = txtStd.text;
                      fileImage = null;
                      txtName.clear();
                      txtStd.clear();
                      txtGrid.clear();
                      Navigator.of(context).pop();
                    });
                  },
                  child: Text(
                    'Update',
                  )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        actions: [
          IconButton(onPressed: (){
            setState(() {
              if(delete==true)
                {
                  student.removeAt(selected);
                }
            });
          }, icon: Icon(Icons.refresh,color: Colors.white,))
        ],
        title: Text(
          "App bar",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: student.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(10),
          child: GestureDetector(
            onTap: () {
              selected = index;
              Navigator.of(context).pushNamed('/detail');
            },
            child: ListTile(
              tileColor: Colors.indigo,
              title: Text(
                "${student[index].student_name}",
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                "${student[index].student_grid}",
                style: TextStyle(color: Colors.white),
              ),
              leading: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey,
                backgroundImage: (student[index].imgFile == null)
                    ? null
                    : FileImage(student[index].imgFile!),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                      onPressed: () {
                        _showDialog(index);
                      },
                      icon: Icon(
                        Icons.edit,
                        color: Colors.white,
                      )),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          print(index);
                          student.removeAt(index);
                        });
                      },
                      icon: Icon(
                        Icons.delete,
                        color: Colors.white,
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _showDialog(-1);
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
