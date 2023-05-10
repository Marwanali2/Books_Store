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

  Future<void> fetchSearchBooks() async {
    emit(SearchBooksLoading());
    var result = await _searchRepo.fetchSearchBooks();
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
}
