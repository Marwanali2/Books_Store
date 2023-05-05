import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_error_widget.dart';
import '../../../../../core/widgets/custom_loading_indicator.dart';
import '../../managers/featured_books_cubit/featured_books_cubit.dart';
import 'custom_book_image.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.30,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 15),
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
        } else if (state is FeaturedBooksFailure) {
          return const CustomErrorWidget(
            errorMessage: "failure",
          );
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
