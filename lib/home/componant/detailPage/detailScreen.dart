import 'dart:io';

import 'package:core_exam/uttils/global%20var/var.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

File? fileImage;

class detail extends StatefulWidget {
  const detail({super.key});

  @override
  State<detail> createState() => _detailState();
}

class _detailState extends State<detail> {
  void _showDialogBox() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: SingleChildScrollView(
          child: Column(
            children: [
              Text('Upate Detail\n'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                      onPressed: () async {
                        XFile? imagePath = await imagePicker.pickImage(
                            source: ImageSource.camera);
                        setState(() {
                          fileImage = File(imagePath!.path);
                        });
                      },
                      child: Text("Add Image")),
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
          TextButton(
              onPressed: () {
                setState(() {
                  student[selected].imgFile = fileImage;
                  student[selected].student_name = txtName.text;
                  student[selected].student_grid = txtGrid.text;
                  student[selected].student_std = txtStd.text;
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
        title: Text(
          'Detail Screen',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey,
            radius: 70,
            backgroundImage: (student[selected].imgFile == null)
                ? null
                : FileImage(student[selected].imgFile!),
          ),
          Text('${student[selected].student_name}'),
          Text('${student[selected].student_std}'),
          Text('${student[selected].student_grid}'),
          Row(
            children: [
              FilledButton(
                  onPressed: () {
                    setState(() {
                      _showDialogBox();
                    });
                  },
                  child: Text('Upadate')),
              FilledButton(
                  onPressed: () {
                    setState(() {
                      student[selected].student_name='';
                      student[selected].student_grid='';
                      student[selected].student_std='';
                      student[selected].imgFile=null;
                      delete=true;
                    });
                  },
                  child: Text('Delete')),
            ],
          ),
        ],
      ),
    );
  }
}
