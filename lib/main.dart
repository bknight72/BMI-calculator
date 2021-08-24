import 'package:flutter/material.dart';
import 'screens/input_page.dart';

void main() => runApp(BenBMI());

class BenBMI extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF031357),
        accentColor: Color(0xFFa42862),
        scaffoldBackgroundColor: Color(0xFF000A3D),
      ),
      home: InputPage(),
    );
  }
}
