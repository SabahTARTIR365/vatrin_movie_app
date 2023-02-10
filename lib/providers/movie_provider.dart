import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:vatrin_movie_app/data/constant.dart';

import '../models/movie.dart';

class MovieProvider extends ChangeNotifier
{
  TMDB ?tmdbWithCustomLogs;
  List <Movie>?popularMovies ;
  List<Movie>?nowShowingMovies;
 String? time;

  MovieProvider()
  {
    //initialization files
    initializeApiDatabase();
    getNowShowingMovies();
    getPopularMovies();
  }

  initializeApiDatabase()
  {
    tmdbWithCustomLogs = TMDB(
      ApiKeys(apiKey, readAccessToken),
      logConfig: const ConfigLogger(
        showLogs: true,
        showErrorLogs: true,
      ),
    );
  }

  getNowShowingMovies() async
  {
    Map nowShowingResult= await tmdbWithCustomLogs!.v3.movies.getNowPlaying();
    //nowShowingMovies=nowShowingResult['results'];
  List movies=nowShowingResult['results'];
   //nowShowingResult['results'].forEach((e) => nowShowingMovies!.add(Movie.fromMap(e)));
    nowShowingMovies= movies.map( (entry) => Movie.fromMap(entry)).toList();



    notifyListeners();
  }
  getPopularMovies() async {
    Map popularMoviesResult = await tmdbWithCustomLogs!.v3.movies.getPouplar();
   List movies=popularMoviesResult['results'];
    popularMovies=movies.map( (entry) => Movie.fromMap(entry)).toList();
    notifyListeners();
    for (var movie in popularMovies!) {
      Map movieDetailsResult =  await tmdbWithCustomLogs!.v3.movies.getDetails(movie.id);
     movie.lenght =movieDetailsResult['runtime'];
    }

    notifyListeners();
  }
  getGenres() async {
    Map genresResult = await tmdbWithCustomLogs!.v3.genres.getMovieList();
    List genres=genresResult['results'];
    //popularMovies=
    notifyListeners();
  }
   getMovieLength(int movieId) async {
    Map movieDetailsResult =  await tmdbWithCustomLogs!.v3.movies.getDetails(movieId);
    time =movieDetailsResult['runtime'].toString();

  }

  getTime(int movieId)
  {
    getMovieLength(movieId);
    return time;
  }

  String formatTime(int? time)
  {
    num hour= (time!/60) ;
    int minute= time!%60;
    String totalTime= hour.toStringAsFixed(0)+'h '+minute.toString()+'m';
    return totalTime;
  }
}