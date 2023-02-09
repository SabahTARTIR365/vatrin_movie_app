import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:vatrin_movie_app/views/widgets/movie_navigation_bar.dart';
import 'package:vatrin_movie_app/views/widgets/now_showing_widget.dart';

import '../../data/constant.dart';
import '../../providers/movie_provider.dart';

class HomeScreen extends StatelessWidget
{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(

      body:
      Consumer<MovieProvider>(builder: (context, provider, x) {
        return Container(
          margin: EdgeInsets.fromLTRB(15, 40, 10, 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const MovieNavigationBar(text: 'Vatrin Film', leadingIcon: 'assets/icons/Menu.svg', endIcon: 'assets/icons/Notif.svg',),
              SizedBox(height: 30),
              Row(mainAxisAlignment: MainAxisAlignment.start,
                children: [Text('Now Showing', style: titleStyle,),],
              ),
              SizedBox(height: 20),
                 /* InkWell(
                    onTap: () {},child: Column(
                      children: [
                        SizedBox(
                          height: 190,
                          width: 150,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                             "",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        SizedBox(height: 5),
                        Text("test")
                      ],
                    ),
                  ),*/

            provider.nowShowingMovies == null
                    ? const Center(
                        child: Text('No Movies Found'),
                           )
                    : Container(
                      height: 270,
                      child: ListView.builder(
                      itemCount: provider.nowShowingMovies!.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return NowShowingWidget(movie:provider.nowShowingMovies![index]);
                      }),
                    ),

            ],
          ),
        );
       })
    );
  }


}