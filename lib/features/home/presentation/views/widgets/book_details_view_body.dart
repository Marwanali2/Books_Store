import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import 'book_rating.dart';
import 'custom_book_details_app_bar.dart';
import 'custom_book_image.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(

        children: [
          const CustomBookDetailsAppBar(),
          const SizedBox(height: 36),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.18),
            child: const CustomBookImage(),
          ),
          const SizedBox(height: 40),
          const Text(
            "The Jungle Book",
            style: TextStyles.textStyle30,
          ),
          const SizedBox(height: 6),
          Text(
            "Rudyard Kipling",
            style: TextStyles.textStyle18.copyWith(
              fontWeight: FontWeight.w500,
              color: ColorStyles.kGreyColor,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 110),
            child: BookRating(),
          ),
          const SizedBox(height: 37),

        ],
      ),
    );
  }
}
