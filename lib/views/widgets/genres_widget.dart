import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/constant.dart';

class GenresWidget extends StatelessWidget
{
  final List genreIds;

  const GenresWidget({super.key, required this.genreIds});
  //const GenresWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return SizedBox(
        height: 28,
       child: ListView.separated (
         separatorBuilder: (BuildContext context, int index) =>
         const VerticalDivider(color: Colors.transparent, width: 5,), // VerticalDivider
         scrollDirection: Axis.horizontal,
         itemCount: genreIds.length,
         itemBuilder: (context, index) {
          return Column (
            children: [
              Container(
                padding: const EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
                decoration: const BoxDecoration (// Border.all
                    borderRadius: BorderRadius.all(
                      Radius.circular (30),
                    ), // BorderRadius.all
                    color: Color(0xffDBE3FF)
                ), // BoxDecoration
                child: Text(
                  genres.keys.firstWhere((k) => genres[k] == genreIds[index],).toUpperCase(),
                  style: genreTitleStyle
                ),
              ),
            ],
          );
        },
      ),
    );
  }


}