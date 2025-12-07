import 'package:flutter/material.dart';
import 'package:user_inter_face_2/splsah_page.dart';

void main() {
  runApp(const Rahhala());
}

class Rahhala extends StatelessWidget {
  const Rahhala({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white
      ),  
      debugShowCheckedModeBanner: false,
      home: SplsahPage()
    );
  }
}
