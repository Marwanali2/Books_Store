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
  Future<Either<Failure, List<BookModel>>> fetchSearchBooks() async {
    try {
      Map<String, dynamic> newestBooksMapData = await apiServices.get(
        endPoint: "volumes?Filtering=free-ebooks&q=subject:",
      );
      List<BookModel> newestBooksList = [];
      for (var item in newestBooksMapData['items']) {
        newestBooksList.add(
          BookModel.fromJson(item),
        );
      }
      return right(newestBooksList);
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
