import 'package:flutter/material.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter_application/page2.dart';
import 'package:flutter_application/page1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: firstpage(),
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(primarySwatch: Colors.indigo),
    );
  }
}
