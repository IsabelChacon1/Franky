import "package:flutter/material.dart";
import "package:franky/pages/navigation.dart";

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FRANKY',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      home: const NavigationBarApp(),
      //SingleChildScrollViewExample(),
    );
  }
}
