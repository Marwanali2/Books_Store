import 'package:flutter/material.dart';

import '../../../home/data/models/book_model/book_model.dart';
import 'widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key, required this.bookModel}) : super(key: key);
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: SearchViewBody(),
      ),
    );
  }
}
