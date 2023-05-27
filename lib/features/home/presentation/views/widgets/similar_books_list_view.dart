import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bookly_app/features/home/presentation/views/widgets/shimmer/similar_books_list_shimmer.dart';
import '../../../../../core/widgets/custom_error_widget.dart';
import '../../managers/similar_books_cubit/similar_books_cubit.dart';
import 'custom_book_image.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: SizedBox(
                    // طوله ثابت و يحتوي علي الليست بتعرض صورة نسبتها هي الاسبكت راتيو عشان تكون ريسبونسف
                    height: MediaQuery.of(context).size.height * 0.30,
                    child: CustomBookImage(
                      imageUrl:
                          state.books[index].volumeInfo?.imageLinks?.thumbnail?? " ",
                      aspectRatio: 2.7 / 4,
                    ),
                  ),
                );
              },
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length,
            ),
          );
        } else if (state is SimilarBooksFailure) {
          return const CustomErrorWidget();
        } else {
          return const Center(
            child: SimilarBooksListShimmer(),
          );
        }
      },
    );
  }
}
