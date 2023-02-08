import 'package:flutter/cupertino.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:vatrin_movie_app/data/constant.dart';

class MovieProvider extends ChangeNotifier
{
  TMDB ?tmdbWithCustomLogs;
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
    nowShowingMovies=nowShowingResult['results'];
    notifyListeners();
  }
  getPopularMovies() async {
    Map popularMoviesResult = await tmdbWithCustomLogs!.v3.movies.getPopular();
    popularMovies=popularMoviesResult['results'];
    notifyListeners();
  }


}