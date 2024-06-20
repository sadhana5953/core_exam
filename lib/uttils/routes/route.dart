import 'package:core_exam/home/componant/detailPage/detailScreen.dart';
import 'package:core_exam/home/componant/homepage/homescreen.dart';
import 'package:flutter/cupertino.dart';

class practiceRoute
{
  static Map<String,Widget Function(BuildContext)>routes={
    '/': (Context)=> homescreen(),
    '/detail': (Context)=> detail(),
  };
}