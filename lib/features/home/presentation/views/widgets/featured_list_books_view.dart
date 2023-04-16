import 'package:flutter/material.dart';

import 'featured_list_books_view_item.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
      return  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(// طوله ثابت و يحتوي علي الليست بتعرض صورة نسبتها هي الاسبكت راتيو عشان تكون ريسبونسف
            height: MediaQuery.of(context).size.height*0.30,
            child: const FeaturedListViewItem()),
      );
    },
      scrollDirection: Axis.horizontal,
      itemCount: 7,

    );
  }
}