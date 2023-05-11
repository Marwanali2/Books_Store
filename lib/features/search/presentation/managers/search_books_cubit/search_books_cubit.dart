import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../home/data/models/book_model/book_model.dart';
import '../../../data/repos/search_repo.dart';

part 'search_books_state.dart';

class SearchBooksCubit extends Cubit<SearchBooksState> {
  SearchBooksCubit(
    this._searchRepo,
  ) : super(
          SearchBooksInitial(),
        );
  final SearchRepo _searchRepo;
  // List<BookModel>books=[];
  // List<BookModel>filteredBooks=[];


  Future<void> fetchSearchBooks({required String bookType}) async {
    emit(SearchBooksLoading());
    var result = await _searchRepo.fetchSearchBooks(bookType: bookType);

    result.fold((failure) {
      emit(
        SearchBooksFailure(
          failure.errorMessage,
        ),
      );
    }, (books) {
      emit(
        SearchBooksSuccess(
          books,
        ),
      );
    });
  }
  // void filterProducts({required String inputBookTitle}){
  //   filteredBooks=books.where((element) => element.volumeInfo!.title!.toLowerCase().startsWith(inputBookTitle.toLowerCase())).toList();
  //   emit(SearchBooksSuccess(books));
  // }
}
