import 'package:flutter/material.dart';

import 'widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: SearchViewBody(),
      ),
    );
  }
}
