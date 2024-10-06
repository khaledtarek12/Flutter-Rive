import 'package:flutter/material.dart';
import 'package:rive_ui/screens/onboding_Screen/onboding_screen.dart';
import 'package:rive_ui/screens/signIn_Screen/singin_screen.dart';

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
        // scaffoldBackgroundColor: const Color(0xFFEEF1F8),
        primarySwatch: Colors.blue,
        // fontFamily: "Inter",
        // inputDecorationTheme: const InputDecorationTheme(
        //   filled: true,
        //   fillColor: Colors.white,
        //   errorStyle: TextStyle(height: 0),
        //   border: defaultInputBorder,
        //   enabledBorder: defaultInputBorder,
        //   focusedBorder: defaultInputBorder,
        //   errorBorder: defaultInputBorder,
        // ),
      ),
      home: const SinginScreen(),
    );
  }
}

const defaultInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(16)),
  borderSide: BorderSide(
    color: Color(0xFFDEE3F2),
    width: 1,
  ),
);
