// lib/bloc/movie_state.dart
import 'package:equatable/equatable.dart';
import 'package:movie_app_bloc/service/model/movie.dart';

abstract class MovieState extends Equatable {
  const MovieState();

  @override
  List<Object?> get props => [];
}

class MovieInitial extends MovieState {}

class MovieLoading extends MovieState {}

class MoviesLoaded extends MovieState {
  final List<Movie> movies;

  MoviesLoaded(this.movies);

  @override
  List<Object?> get props => [movies];
}

class MovieDetailLoaded extends MovieState {
  final Movie movie;

  MovieDetailLoaded(this.movie);

  @override
  List<Object?> get props => [movie];
}

class MovieError extends MovieState {
  final String message;

  MovieError(this.message);

  @override
  List<Object?> get props => [message];
}
