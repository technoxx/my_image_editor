import 'package:flutter/material.dart';
import 'package:my_image_editor/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Image Editor',
      theme: ThemeData.dark(),
      home: const HomeScreen(),
    );
  }
}

//plugins used
//image_picker
