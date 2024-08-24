part of 'movie_bloc.dart';

// lib/bloc/movie_event.dart

abstract class MovieEvent extends Equatable {
  const MovieEvent();

  @override
  List<Object?> get props => [];
}

class FetchMovies extends MovieEvent {}

class FetchMovieDetail extends MovieEvent {
  final int movieId;

  FetchMovieDetail(this.movieId);

  @override
  List<Object?> get props => [movieId];
}
