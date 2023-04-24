import 'package:flutter/material.dart';

import 'custom_book_image.dart';

import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';
class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.30,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 15),
            child: SizedBox(
                // طوله ثابت و يحتوي علي الليست بتعرض صورة نسبتها هي الاسبكت راتيو عشان تكون ريسبونسف
                height: MediaQuery.of(context).size.height * 0.30,
                child: GestureDetector(
                    onTap: () =>
                        GoRouter.of(context).push(AppRouter.kBookDetailsView),
                    child: const CustomBookImage())),
          );
        },
        scrollDirection: Axis.horizontal,
        itemCount: 7,
      ),
    );
  }
}
