import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vatrin_movie_app/providers/movie_provider.dart';
import 'package:vatrin_movie_app/views/screens/details_screen.dart';
import 'package:vatrin_movie_app/views/screens/home_screen.dart';

void main() {
  runApp( InitApp());
}




class InitApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ChangeNotifierProvider<MovieProvider >(
        create: (context) {
          return MovieProvider();
        },
        child: const MyApp());
  }
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        home:HomeScreen(),
    );
  }
}








