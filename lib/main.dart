import 'package:coffee_app_ui/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee App UI',
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData(brightness: Brightness.dark, primarySwatch: Colors.orange),
      home: const HomePage(),
    );
  }
}
