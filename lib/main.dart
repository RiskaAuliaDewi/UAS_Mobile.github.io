import 'package:flutter/material.dart';
import 'package:flutter_application_2/page/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: true, // Set to false in production
      home: MainPage(),
    );
  }
}
