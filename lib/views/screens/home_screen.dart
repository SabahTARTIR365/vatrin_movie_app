import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:vatrin_movie_app/views/widgets/movie_navigation_bar.dart';
import 'package:vatrin_movie_app/views/widgets/now_showing_widget.dart';

import '../../data/constant.dart';
import '../../providers/movie_provider.dart';
import '../widgets/popular_movie_widget.dart';

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
              Row(
                children: [Text('Now Showing', style: titleStyle,),],
              ),
              SizedBox(height: 20),
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
                SizedBox(height: 20),
                Row(
                  children: [Text('Popular', style: titleStyle,),],
                  ),
             // SizedBox(height: 10),
              provider.nowShowingMovies == null
                  ? const Center(
                    child: Text('No popular Movies Found'),
              )
                  : Expanded(child: Container(
                  width:MediaQuery.of(context).size.width,
                  child: MoviesWidget(movies: provider.popularMovies ))),


            ],
          ),
        );
       })
    );
  }


}