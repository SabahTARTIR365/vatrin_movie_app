import 'package:flutter/material.dart';
import 'package:vatrin_movie_app/views/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  HomeScreen(),
    );
  }
}

class MyHomePage extends StatelessWidget {
late String title;



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("test app"),
      ),
      body: Center(
        child: Column(),
      ),
  // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
