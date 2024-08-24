// lib/screens/movie_detail_screen.dart
import 'package:flutter/material.dart';
import 'package:movie_app_bloc/service/model/movie.dart';

class MovieDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final movie = ModalRoute.of(context)!.settings.arguments as Movie;

    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Director: ${movie.director}", style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text("Producer: ${movie.producer}", style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text("Release Date: ${movie.release_date}",
                style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text("Opening Crawl:", style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text(movie.opening_crawl, style: TextStyle(fontSize: 16)),
            ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/map'),
                child: Text("See location"))
          ],
        ),
      ),
    );
  }
}
