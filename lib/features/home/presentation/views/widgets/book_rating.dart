import 'package:flutter/material.dart';
import 'package:my_bookly_app/core/utils/styles.dart';

import '../../../../../constants.dart';
class BookRating extends StatelessWidget {
  const BookRating({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset("assets/images/Star.png",width: 13.38,height: 12.8),
        const SizedBox(width: 6.3,),
        const Text("4.8",style: TextStyles.textStyle16,),
        const SizedBox(width: 5,),
        Text("(2390)",style: TextStyles.textStyle14.copyWith(color: ColorStyles.kGreyColor,),),
      ],
    );
  }
}