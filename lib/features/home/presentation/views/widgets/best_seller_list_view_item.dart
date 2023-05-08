import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_bookly_app/features/home/data/models/book_model/book_model.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/styles.dart';
import 'book_rating.dart';
import 'custom_book_image.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({Key? key, required this.books})
      : super(key: key);
  final BookModel books;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GoRouter.of(context).push(
        AppRouter.kBookDetailsView,
        extra: books,
      ),
      child: Row(
        children: [
          SizedBox(
            height: 155,
            child: CustomBookImage(
              imageUrl: "${books.volumeInfo?.imageLinks?.thumbnail}",
              aspectRatio: 2.5 / 4,
            ),
          ),
          const SizedBox(
            width: 30,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Text(
                    "${books.volumeInfo?.title}",
                    style:
                        TextStyles.textStyle20.copyWith(fontFamily: kQuicksand),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  "${books.volumeInfo?.authors?.first}",
                  style: TextStyles.textStyle14.copyWith(
                    color: ColorStyles.kGreyColor,
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Row(
                  children: [
                    Text(
                      "Free",
                      style: TextStyles.textStyle20.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 36.3,
                    ),
                    BookRating(
                      rating: books.volumeInfo?.averageRating ?? 4.5,
                      numDownloads: books.volumeInfo?.pageCount ?? 350,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
