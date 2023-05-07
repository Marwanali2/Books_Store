import 'package:flutter/material.dart';
import 'package:my_bookly_app/core/utils/styles.dart';

import 'book_rating.dart';
import 'books_action.dart';
import 'custom_book_image.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        const SizedBox(height: 36),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.18),
          child: const CustomBookImage(imageUrl: "https://img-s-msn-com.akamaized.net/tenant/amp/entityid/AA11NbLD.img",aspectRatio: 2.7 / 4),
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
          child: BookRating(rating:4.8,numDownloads: 500),
        ),
        const SizedBox(
          height: 37,
        ),
        const BooksAction(),
      ],
    );
  }
}
