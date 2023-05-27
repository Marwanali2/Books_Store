import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_error_widget.dart';
import '../../managers/newest_books_cubit/newest_books_cubit.dart';
import 'shimmer/best_seller_list_shimmer.dart';
import 'best_seller_list_view_item.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return ListView.builder(
            // shrinkWrap: true,
            // When shrinkWrap is set to true, the ListView will automatically size itself to its contents, rather than taking up the full available height of its parent widget. By default, a ListView will take up as much height as possible, even if it contains only a few items. This can be inefficient and cause performance issues in some cases. Setting shrinkWrap to true can help reduce the amount of unnecessary space that the ListView takes up.
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            // لان الليست فيو بيتعملها padding تلقائي
            itemBuilder: (context, index) {
              return  Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 30,
                ),
                child: BestSellerListViewItem(books: state.books[index]),
              );
            },
            itemCount: state.books.length,
          );
        } else if (state is NewestBooksFailure) {
          return const CustomErrorWidget();
        } else {
          return const Center(
            child: BestSellerListShimmer(),
          );
        }
      },
    );
  }
}
