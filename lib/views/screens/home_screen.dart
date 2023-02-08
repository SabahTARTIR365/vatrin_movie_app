import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vatrin_movie_app/views/widgets/movie_navigation_bar.dart';

import '../../data/constant.dart';

class HomeScreen extends StatelessWidget
{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(

      body:
        Container(
          margin: EdgeInsets.fromLTRB(15, 40, 10, 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const MovieNavigationBar(text: 'Vatrin Film', leadingIcon: 'assets/icons/Menu.svg', endIcon: 'assets/icons/Notif.svg',),
              SizedBox(height: 30),
              Row(mainAxisAlignment: MainAxisAlignment.start,
                children: [Text('Now Showing', style: titleStyle,),],
              ),
                  InkWell(
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
                  ),
              Container(

              )
            ],


          ),
        ),

    );
  }


}