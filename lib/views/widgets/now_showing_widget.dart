import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/constant.dart';
import '../../models/movie.dart';

class NowShowingWidget extends StatelessWidget
{
  Movie movie;
  //final List nowShowingMovie;

   NowShowingWidget({super.key, required this.movie});
  @override
  Widget build(BuildContext context) {

          return InkWell(
            onTap: () {

            },
            child: Container(
              width: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      movie.posterurl,
                      height: 200,
                      //width: 100.0,
                    ),
                  ),

                  SizedBox(height: 5),
                  Container(
                    padding: EdgeInsets.only(left: 9),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text( movie.name != null
                                  ? movie.name+"/10"
                                  : 'Loading',style: subTitleStyle,),
                        ),
                      ],
                    ),
                  ),
              SizedBox(height: 4,),
                  Container(
                    padding: EdgeInsets.only(left: 9),
                    child: Row(
                      children: <Widget>[
                        const Icon(
                          Icons.star,
                          color: Colors.orangeAccent,
                          size: 14,
                        ),
                        Text(
                          movie.vote,
                          style: subSubTitleStyle
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
       // }));
  }

}