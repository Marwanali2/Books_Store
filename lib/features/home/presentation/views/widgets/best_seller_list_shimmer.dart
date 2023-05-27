import 'package:flutter/material.dart';

import 'best_seller_list_item_shimmer.dart';

class BestSellerListShimmer extends StatelessWidget {
  const BestSellerListShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 30,
          ),
          child: BestSellerItemShimmer(),
        );
      },
      itemCount: 10,
    );
  }
}


