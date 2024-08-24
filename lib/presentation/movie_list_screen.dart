// lib/screens/movie_list_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_bloc/service/bloc/movie_bloc.dart';
import 'package:movie_app_bloc/service/bloc/movie_state.dart';

class MovieListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
      ),
      body: BlocProvider(
        create: (context) => MovieBloc()..add(FetchMovies()),
        child: MovieList(),
      ),
    );
  }
}

class MovieList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      builder: (context, state) {
        if (state is MovieLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is MoviesLoaded) {
          return ListView.builder(
            itemCount: state.movies.length,
            itemBuilder: (context, index) {
              final movie = state.movies[index];
              return ListTile(
                title: Text(movie.title),
                subtitle: Text("Episode ${movie.episode_id}"),
                onTap: () {
                  Navigator.pushNamed(context, '/detail', arguments: movie);
                },
              );
            },
          );
        } else if (state is MovieError) {
          return Center(child: Text(state.message));
        } else {
          return Container();
        }
      },
    );
  }
}
