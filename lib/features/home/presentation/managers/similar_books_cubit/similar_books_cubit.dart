import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_bookly_app/features/home/data/repos/home_repo.dart';

import '../../../data/models/book_model/book_model.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this._homeRepo) : super(SimilarBooksInitial());
  final HomeRepo _homeRepo;

  Future<void> fetchSimilarBooks({required String category}) async {
    emit(SimilarBooksLoading());
    var result = await _homeRepo.fetchSimilarBooks(category: category); //await _homeRepo.fetchSimilarBooks(category: );
    result.fold(
      (failure) => emit(SimilarBooksFailure(failure.errorMessage),),
      (books) => emit(SimilarBooksSuccess(books),),
    );
  }
}
