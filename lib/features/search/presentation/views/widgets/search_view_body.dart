import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../home/presentation/views/widgets/best_seller_list_view_item.dart';
import 'custom_search_text_field.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomSearchTextField(),
              const SizedBox(
                height: 60,
              ),
              const Text(
                "Search Results",
                style: TextStyles.textStyle18,
              ),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  // لان الليست فيو بيتعملها padding تلقائي
                  itemBuilder: (context, index) {
                    return const Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: BestSellerListViewItem(),
                    );
                  },
                  itemCount: 10,
                ),
              )
            ],
          ),
        )),
      ],
    );
  }
}
