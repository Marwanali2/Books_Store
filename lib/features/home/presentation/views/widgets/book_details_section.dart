import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bookly_app/core/utils/styles.dart';

import '../../../../../core/widgets/custom_error_widget.dart';
import '../../../data/models/book_model/book_model.dart';
import '../../managers/similar_books_cubit/similar_books_cubit.dart';
import 'shimmer/book_details_scetion_shimmer.dart';
import 'book_rating.dart';
import 'books_action.dart';
import 'custom_book_image.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({Key? key, required this.bookModel})
      : super(key: key);
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return Column(
            children: [
              const SizedBox(height: 36),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.18),
                child: CustomBookImage(
                  imageUrl: bookModel.volumeInfo?.imageLinks?.thumbnail ?? " ",
                  aspectRatio: 2.7 / 4,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                "${bookModel.volumeInfo?.title}",
                textAlign: TextAlign.center,
                style: TextStyles.textStyle30.copyWith(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                "${bookModel.volumeInfo?.authors?.first}",
                style: TextStyles.textStyle18.copyWith(
                  fontWeight: FontWeight.w500,
                  color: ColorStyles.kGreyColor,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 110),
                child: BookRating(
                    rating: bookModel.volumeInfo?.averageRating ?? 4.5,
                    numDownloads: bookModel.volumeInfo?.pageCount ?? 350),
              ),
              const SizedBox(
                height: 37,
              ),
               BooksAction(bookModel: bookModel,),
            ],
          );
        } else if (state is SimilarBooksFailure) {
          return const CustomErrorWidget();
        } else {
          return const Center(
            child: BookDetailsSectionShimmer(),
          );
        }
      },
    );
  }
}
