import 'package:flutter/cupertino.dart';

TextStyle titleStyle =TextStyle(fontFamily: 'Merriweather',fontWeight: FontWeight.w900,fontSize: 16);
TextStyle subTitleStyle=TextStyle(fontFamily: 'Mulish',fontWeight: FontWeight.w700,fontSize: 14);
TextStyle subSubTitleStyle=TextStyle(fontFamily: 'Mulish',fontWeight: FontWeight.w400,fontSize: 12, color: appGray);
TextStyle genreTitleStyle=TextStyle(fontFamily: 'Mulish',fontSize: 8, fontWeight: FontWeight.bold, color: Color(0xff88A4E8));
TextStyle timeTitleStyle=TextStyle(fontFamily: 'Mulish',fontWeight: FontWeight.w400,fontSize: 12);
final String apiKey = '44003be4f7cea769f0a024d29a57dcc9';
final String readAccessToken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0'
    'NDAwM2JlNGY3Y2VhNzY5ZjBhMDI0ZDI5YTU3ZGNjOSIsInN1YiI6IjYzZTM2'
    'ZjNhZmFjNTAyMDA4NDlmMWFlMSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2Z'
    'XJzaW9uIjoxfQ.TpZy_6SBnO_IR_lQZ4JYKzvwvjmqbqb0iLha36ljD4I';


List popularMovies = [];
List nowShowingMovies=[];
Color appGray= Color(0xff9C9C9C);

Map<String, int> genres={
  'Action': 28,
  'Adventure':       12,
  'Animation'   :    16,
  'Comedy'       :   35,
  'Crime'         :  80,
  'Documentary'    : 99,
  'Drama'           :18,
  'Family'        :  10751,
  'Fantasy'        : 14,
  'History'         :36,
  'Horror'          :27,
  'Music'           :10402,
  'Mystery'         :9648,
  'Romance'        :10749,
  'Science Fiction' :878,
  'TV Movie'        :10770,
  'Thriller'       :53,
  'War'             :10752,
  'Western'         :37,
};
