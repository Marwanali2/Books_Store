import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/widgets/custom_error_widget.dart';
import '../../managers/featured_books_cubit/featured_books_cubit.dart';
import 'custom_book_image.dart';
import 'shimmer/featured_list_shimmer.dart';

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
              physics: const BouncingScrollPhysics(),
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: SizedBox(
                    // طوله ثابت و يحتوي علي الليست بتعرض صورة نسبتها هي الاسبكت راتيو عشان تكون ريسبونسف
                    height: MediaQuery.of(context).size.height * 0.30,
                    child: GestureDetector(
                      onTap: () {
                        GoRouter.of(context).push(
                          AppRouter.kBookDetailsView,
                          extra: state.books[index],
                        );
                      },
                      child: CustomBookImage(
                        imageUrl:
                            "${state.books[index].volumeInfo?.imageLinks?.thumbnail}",
                        aspectRatio: 2.7 / 4,
                      ),
                    ),
                  ),
                );
              },
              scrollDirection: Axis.horizontal,
            ),
          );
        }
        else if (state is FeaturedBooksFailure) {
          return const CustomErrorWidget();
        } else {
          return const FeaturedListShimmer();
        }
      },
    );
  }
}
