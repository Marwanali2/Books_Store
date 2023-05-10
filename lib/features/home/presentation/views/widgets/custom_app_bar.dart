import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_bookly_app/core/utils/app_router.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../search/presentation/views/widgets/search_view_body.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, bottom: 40),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            AssetsData.logo,
            width: 75,
            height: 16.1,
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: DataSearch(),); // GoRouter.of(context).push(AppRouter.kSearchView);
            },
            icon: const Icon(Icons.search, size: 30),
          ),
        ],
      ),
    );
  }
}
