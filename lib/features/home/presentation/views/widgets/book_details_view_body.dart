import 'package:flutter/material.dart';
import 'book_details_section.dart';
import 'custom_book_details_app_bar.dart';
import 'similar_books_section.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
            child: Column(
              children: const [
                CustomBookDetailsAppBar(),
                BookDetailsSection(),

                Expanded(
                  child: SizedBox(
                    height: 50,
                  ),
                ),
                SimilarBooksSection(),
                // const SizedBox(height: 40),
              ],
            ),
          ),
        )
      ],
    );
  }
}




