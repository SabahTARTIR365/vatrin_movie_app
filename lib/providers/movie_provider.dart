import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:vatrin_movie_app/data/constant.dart';

import '../models/movie.dart';

class MovieProvider extends ChangeNotifier
{
  TMDB ?tmdbWithCustomLogs;
  List ?popularMovies ;
  List<Movie>?nowShowingMovies;

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
    Map popularMoviesResult = await tmdbWithCustomLogs!.v3.movies.getPopular();
    popularMovies=popularMoviesResult['results'];
    notifyListeners();
  }


}