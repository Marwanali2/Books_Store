import 'package:flutter/material.dart';

import 'widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key, required this.bookName}) : super(key: key);
  final String bookName;
  //final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return  const SafeArea(
      child: Scaffold(
        body: SearchViewBody(),
      ),
    );
  }
}
