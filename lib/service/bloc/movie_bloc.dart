import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app_bloc/service/bloc/movie_state.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app_bloc/service/model/movie.dart';

part 'movie_event.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(MovieInitial()) {
    on<FetchMovies>(_onFetchMovies);
    on<FetchMovieDetail>(_onFetchMovieDetail);
  }
  var client = http.Client();

  static Map<String, String> _header() {
    return {
      'Content-Type': 'application/json',
      'Accept': '*/*',
    };
  }

  void _onFetchMovies(FetchMovies event, Emitter<MovieState> emit) async {
    emit(MovieLoading());
    try {
      //   final response = await http.get(Uri.https("https://.swapi.dev/api/films/"));
      final response = await client
          .get(Uri.parse("https://swapi.dev/api/films/"), headers: _header());
      if (response.statusCode == 200) {
        final List movies = json.decode(response.body)['results'];
        emit(MoviesLoaded(movies.map((m) => Movie.fromJson(m)).toList()));
      } else {
        emit(MovieError("Failed to fetch movies"));
      }
    } catch (e) {
      emit(MovieError("Failed to fetch movies: $e"));
    }
  }

  void _onFetchMovieDetail(
      FetchMovieDetail event, Emitter<MovieState> emit) async {
    emit(MovieLoading());
    try {
      final response = await http
          .get(Uri.parse('https://swapi.dev/api/films/${event.movieId}/'));
      if (response.statusCode == 200) {
        final movie = Movie.fromJson(json.decode(response.body));
        emit(MovieDetailLoaded(movie));
      } else {
        emit(MovieError("Failed to fetch movie details"));
      }
    } catch (e) {
      emit(MovieError("Failed to fetch movie details: $e"));
    }
  }
}
