import 'package:flutter/material.dart';

import 'custom_book_image.dart';
class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.15,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: SizedBox(
              // طوله ثابت و يحتوي علي الليست بتعرض صورة نسبتها هي الاسبكت راتيو عشان تكون ريسبونسف
              height: MediaQuery.of(context).size.height * 0.30,
              child: const CustomBookImage(),
            ),
          );
        },
        scrollDirection: Axis.horizontal,
        itemCount: 7,
      ),
    );
  }
}