import 'package:flutter/material.dart';
import '../../../../../core/utils/styles.dart';
import 'best_seller_list_view.dart';
import 'custom_app_bar.dart';
import 'featured_list_books_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          //Creates a sliver that contains a single box widget
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(),
              Padding(
                padding: EdgeInsets.only(left: 30),
                child: FeaturedBooksListView(),
              ),
              SizedBox(
                height: 60,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "Best Seller",
                  style: TextStyles.textStyle18,
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        SliverFillRemaining(
          //Creates a sliver that fills the remaining space
          child: BestSellerListView(),
        ),
      ],
    );
  }
}
