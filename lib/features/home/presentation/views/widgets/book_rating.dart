import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bookly_app/core/utils/styles.dart';

import '../../managers/newest_books_cubit/newest_books_cubit.dart';

class BookRating extends StatelessWidget {
  const BookRating({Key? key, required this.rating, required this.numDownloads}) : super(key: key);
  final double ?rating;
  final int ?numDownloads;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset("assets/images/Star.png", width: 13.38, height: 12.8),
        const SizedBox(
          width: 6.3,
        ),
         Text(
          "$rating",
          style: TextStyles.textStyle16,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          "($numDownloads)",
          style: TextStyles.textStyle14.copyWith(
            color: ColorStyles.kGreyColor,
          ),
        ),
      ],
    );
  }
}
