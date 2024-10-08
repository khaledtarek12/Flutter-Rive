import 'package:flutter/material.dart';
import 'package:rive_ui/home.dart';

void main() {
  runApp(const RiveScreens());
}

class RiveScreens extends StatelessWidget {
  const RiveScreens({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Flutter Way',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RiveAppHome(),
    );
  }
}
