import 'package:flutter/material.dart';

import 'best_seller_list_view_item.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // shrinkWrap: true,
      // When shrinkWrap is set to true, the ListView will automatically size itself to its contents, rather than taking up the full available height of its parent widget. By default, a ListView will take up as much height as possible, even if it contains only a few items. This can be inefficient and cause performance issues in some cases. Setting shrinkWrap to true can help reduce the amount of unnecessary space that the ListView takes up.
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      // لان الليست فيو بيتعملها padding تلقائي
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          child: BestSellerListViewItem(),
        );
      },
      itemCount: 10,
    );
  }
}
