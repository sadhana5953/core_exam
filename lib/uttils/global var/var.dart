import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class studentModel
{
  String? student_name;
  String? student_grid;
  String? student_std;
  File? imgFile;

  studentModel({required this.student_name,required this.student_grid,required this.student_std,required this.imgFile});
}
TextEditingController txtName = TextEditingController();
TextEditingController txtGrid = TextEditingController();
TextEditingController txtStd = TextEditingController();
ImagePicker imagePicker=ImagePicker();
List <studentModel>student=[];
bool delete=false;
int selected=0;