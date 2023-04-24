import 'package:flutter/material.dart';

import 'custom_book_details_app_bar.dart';
class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: const [
           CustomBookDetailsAppBar(),
        ],
      ),
    );
  }
}



