import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todos_app/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'ToDos Application',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        textTheme:  TextTheme(
          subtitle1: TextStyle(color: Colors.white)
        ),

      ),
      home:  HomeScreen(),
    );
  }
}

