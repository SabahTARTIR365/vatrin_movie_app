import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../data/constant.dart';

class MovieNavigationBar extends StatelessWidget
{
  final String text, leadingIcon, endIcon;

  const MovieNavigationBar({super.key, required this.text, required this.leadingIcon, required this.endIcon});
  @override
  Widget build(BuildContext context) {
   return Container(

      child: Row(
       mainAxisAlignment: MainAxisAlignment.center,
       children: [
           SvgPicture.asset(leadingIcon),
           Expanded(child: Center(child: Text(text, style: titleStyle,))),
           SvgPicture.asset(endIcon),
    ],
  ),
);
  }

}