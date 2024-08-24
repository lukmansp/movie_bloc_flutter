// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_bloc/presentation/cinema_location.dart';
import 'package:movie_app_bloc/presentation/detail_screen.dart';
import 'package:movie_app_bloc/presentation/movie_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter movie',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MovieListScreen(),
        '/detail': (context) => MovieDetailScreen(),
        '/map': (context) => CinemaMapScreen(),
      },
    );
  }
}
