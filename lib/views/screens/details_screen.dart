import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:vatrin_movie_app/models/movie.dart';

import '../../data/constant.dart';
import '../../providers/movie_provider.dart';
import '../widgets/genres_widget.dart';


class DetailsScreen extends StatelessWidget {
  final Movie movie;

  const DetailsScreen({super.key, required this.movie});


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,elevation: 0,),
          body: Stack(
            children: [
              SizedBox(
                width: double.infinity,
                child: Image.network(
                  movie.posterurl,
                ),
              ),
              scroll(),
            ],
          ),
        ));
  }


  scroll() {
    return Consumer<MovieProvider>(builder: (context, provider, x)
    {
      return DraggableScrollableSheet(
          initialChildSize: 0.7,
          maxChildSize: 1.0,
          minChildSize: 0.6,
          builder: (context, scrollController) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(20),
                    topRight: const Radius.circular(20)),
              ),
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 5,
                            width: 35,
                            color: Colors.black12,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Text(movie.name, style: detailsTitleStyle,)),
                        const SizedBox(
                          width: 80,
                        ),
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
                    //2 rows here

                    Row(children: [
                      Expanded(child: Text('Length', style: subSubTitleStyle),),
                      Expanded(child: Text('Language', style: subSubTitleStyle)),
                      Expanded(child: Text('Rating', style: subSubTitleStyle)),
                    ],),
                    SizedBox(height: 5,),
                    Row(children: [
                      Expanded(child: Text("2h 1min", style: timeTitleStyle),),
                        Expanded(child: Text('English', style: timeTitleStyle)),
                        Expanded(child: Text(
                          'PG-${movie.vote}', style: timeTitleStyle)),

                    ],),
                    SizedBox(height: 5,),
                    Row(
                      children: [Text('Description', style: titleStyle,),],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Expanded(child: Text(
                          movie.description, style: subSubTitleStyle,)),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      children: [Text('Actors', style: titleStyle,),],
                    ),

                  ],
                ),
              ),
            );
          });
    });
  }



}