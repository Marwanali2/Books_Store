import 'package:flutter/material.dart';
import '../../../../../core/utils/styles.dart';
import 'book_rating.dart';
import 'books_action.dart';
import 'custom_book_details_app_bar.dart';
import 'custom_book_image.dart';
import 'similar_books_list_view.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return CustomScrollView(
      slivers: [

        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
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
                const SizedBox(
                  height: 37,
                ),
                const BooksAction(),
                const Expanded(
                  child: SizedBox(
                    height: 50,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "You can also like",
                    style: TextStyles.textStyle15.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const SimilarBooksListView(),
                // const SizedBox(height: 40),
              ],
            ),
          ),
        )
      ],
    );

  }
}
