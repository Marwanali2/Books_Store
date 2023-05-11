import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:my_bookly_app/core/errors/failure.dart';
import 'package:my_bookly_app/core/utils/api_services.dart';
import 'package:my_bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:my_bookly_app/features/search/data/repos/search_repo.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiServices apiServices;

  SearchRepoImpl(this.apiServices);

  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchBooks({required String bookType}) async {
    try {
      Map<String, dynamic> booksMapData = await apiServices.get(
        endPoint: "volumes?Filtering=free-ebooks&q=subject:$bookType",
      );
      List<BookModel> booksList = [];
      for (var item in booksMapData['items']) {
        booksList.add(
          BookModel.fromJson(item),
        );
      }
      return right(booksList);
    } on Exception catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(
          ServerFailure(
            errorMessage: e.toString(),
          ),
        );
      }
    }
  }
}
