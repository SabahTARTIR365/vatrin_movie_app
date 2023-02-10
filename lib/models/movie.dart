class Movie {

   String name;
   int    id;
   String description;
   String bannerurl;
   String posterurl;
   String vote;
   String launch_on;
   List  genre_ids=[];
   int ?lenght;

  Movie({required this.name, required this.description,
    required this.bannerurl, required this.posterurl, required this.vote, required this.launch_on, required this.genre_ids,required this.id,this.lenght,});



  Map<String, dynamic> toMap() {
    return {
      'title':  name,
      'backdrop_path':bannerurl,
      'poster_path':  posterurl,
      'overview':  description,
      'vote_average':  vote,
      'release_date':  launch_on,
      'genre_ids':genre_ids,
      'id':id,

    };
  }
        // may need to replace the url below
  // https://image.tmdb.org/t/p/w440_and_h660_face/.


  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      name: map['title'] ?? '',
      bannerurl: 'https://image.tmdb.org/t/p/w500' + map['backdrop_path'] ?? '',
      description: map['overview'] ?? '',
      posterurl:'https://image.tmdb.org/t/p/w500' + map['poster_path'] ?? '',
      vote: map['vote_average'].toString() ?? '',
      launch_on: map['release_date'] ?? '',
      genre_ids: map['genre_ids'],
      id: map['id'],



    );
  }


}