import 'package:core_exam/uttils/routes/route.dart';
import 'package:flutter/material.dart';
void main()
{
  return runApp(practice(),);
}

class practice extends StatelessWidget {
  const practice({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: practiceRoute.routes,
    );
  }
}
