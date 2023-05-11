import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_error_widget.dart';
import '../../../../home/presentation/views/widgets/best_seller_list_view_item.dart';
import '../../managers/search_books_cubit/search_books_cubit.dart';
class SearchViewBody extends StatelessWidget {
  const SearchViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var cubit=BlocProvider.of<SearchBooksCubit>(context);
    return BlocBuilder<SearchBooksCubit, SearchBooksState>(
      builder: (context, state) {
        if (state is SearchBooksSuccess) {
          return CustomScrollView(
            slivers: [
              SliverFillRemaining(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // // CustomSearchTextField(onChanged: (inputBookTitle) {
                      // //   cubit.filterProducts(inputBookTitle: inputBookTitle);
                      // // },),
                      // const SizedBox(
                      //   height: 60,
                      // ),
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
                            return  Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                               child: BestSellerListViewItem(books: state.books[index]),//cubit.filteredBooks.isEmpty?cubit.filteredBooks[index]:
                            );
                          },
                          itemCount: state.books.length,//cubit.filteredBooks.isEmpty?:cubit.filteredBooks.length
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
        } else if (state is SearchBooksFailure) {
          return const CustomErrorWidget();
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

/*class DataSearch extends SearchDelegate{

  @override
  List<Widget>? buildActions(BuildContext context) {// actions for app bar
    return [
      IconButton(onPressed: (){
        return close(context, null);
      }, icon: const Icon(Icons.clear,),),
    ] ;
  }

  @override
  Widget? buildLeading(BuildContext context) { // icon leading
    IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_back,),);
  }

  @override
  Widget buildResults(BuildContext context) { // results of search
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) { // show when some one search
   return const Text("show when some one search",);
  }

}*/

// example

//*

// class MyApp extends StatefulWidget {
//   final List<String> items = ['apple', 'banana', 'orange', 'pear'];
//
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   String _searchText = '';
//
//   @override
//   Widget build(BuildContext context) {
//     List<String> filteredItems = widget.items.where((item) {
//       return item.toLowerCase().contains(_searchText.toLowerCase());
//     }).toList();
//
//     return MaterialApp(
//       title: 'Flutter Search Demo',
//       home: Scaffold(
//         appBar: AppBar(
//           title: TextField(
//             onChanged: (value) {
//               setState(() {
//                 _searchText = value;
//               });
//             },
//             decoration: InputDecoration(
//               hintText: 'Search...',
//             ),
//           ),
//         ),
//         body: ListView.builder(
//           itemCount: filteredItems.length,
//           itemBuilder: (context, index) {
//             return ListTile(
//               title: Text(filteredItems[index]),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// example
/*class SearchViewBody extends StatefulWidget {
  SearchViewBody({Key? key}) : super(key: key);
  final List<String> items = ['apple', 'banana', 'orange', 'pear'];

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
   String _searchText = '';

  @override
  Widget build(BuildContext context) {
    List<String> searchResults = widget.items.where(
      (item) {
        return item.toLowerCase().contains(
              _searchText.toLowerCase(),
            );
      },
    ).toList();


    return  CustomScrollView(
      slivers: [
        SliverFillRemaining(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   CustomSearchTextField(onChanged: (inputData) {
                     setState(() {
                       _searchText=inputData;
                     });
                   },),
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
                        return  Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          // child: BestSellerListViewItem(),
                          child:  ListTile(
                            title: _searchText.isEmpty?const Text("No Results"):Text(_searchText),//Text(searchResults[index]),
                          ),
                        );
                      },
                      itemCount: searchResults.length,
                    ),
                  )
                ],
              ),
            )),
      ],
    );
  }
}*/
