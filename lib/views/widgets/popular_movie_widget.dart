import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:vatrin_movie_app/data/constant.dart';

import '../../models/movie.dart';
import '../../providers/movie_provider.dart';
import 'genres_widget.dart';

class MoviesWidget extends StatelessWidget {

  final List<Movie> ?movies;

  MoviesWidget({required this.movies});

  @override
  Widget build(BuildContext context) {
    return Consumer<MovieProvider>(builder: (context, provider, x) {
    return ListView.builder(
        itemCount: movies!.length,
        itemBuilder: (context, index) {
          final movie = movies![index];
          return ListTile(
              title: Row(crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                SizedBox(
                    width: 80,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(movie.posterurl),
                    )

                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(left:9),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text( movie.name ?? 'Loading',style: subTitleStyle,),
                            ),
                            SizedBox(width: 80,)
                          ],
                        ),
                        const SizedBox(height: 5,),
                        Row(
                          children: <Widget>[
                            const Icon(
                              Icons.star,
                              color: Colors.orangeAccent,
                              size: 14,
                            ),
                            Text(
                                "${movie.vote}/10",
                                style: subSubTitleStyle
                            ),
                          ],
                        ),
                       SizedBox(height: 5,),
                        GenresWidget(genreIds: movie.genre_ids,),
                        Row(
                          children: <Widget>[
                            SvgPicture.asset('assets/icons/clock.svg'),
                            SizedBox(width: 5,),
                            provider.getTime(movie.id)== null
                                ? const Center(
                              child: SizedBox(width:6, height:6,child: CircularProgressIndicator()),
                            )
                                :
                            Text(
                               provider.formatTime(movie.lenght) ,
                                style: timeTitleStyle,
                            )

                          ],
                        ),


                      ],),
                  ),
                ),

              ],)
          );
        }
    );
    });
  }

}