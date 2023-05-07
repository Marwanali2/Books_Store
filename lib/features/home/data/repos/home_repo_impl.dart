import 'package:dartz/dartz.dart';
import 'package:my_bookly_app/core/errors/failure.dart';
import 'package:my_bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:my_bookly_app/features/home/data/repos/home_repo.dart';
import 'package:dio/dio.dart';
import '../../../../core/utils/api_services.dart';

class HomeRepoImpl implements HomeRepo {
  // هنا بنفذ ال methods اللي بتتنفذ في صفحة ال home
  final ApiServices apiServices;

  HomeRepoImpl(this.apiServices);

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      Map<String, dynamic> newestBooksMapData = await apiServices.get(
        endPoint: "volumes?Filtering=free-ebooks&q=subject:flowers",//flowers,sun
      ); //sun
      List<BookModel> newestBooksList = [];
      for (var item in newestBooksMapData['items']) {
        newestBooksList.add(
          BookModel.fromJson(item),
        );
      }
      return right(newestBooksList);
    } on Exception catch (e) {
      if (e is DioError) {
        return Left(
          ServerFailure.fromDioError(e),
        );
      } else {
        return left(
          ServerFailure(
            errorMessage: e.toString(),
          ),
        );
      }
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
    try {
      Map<String, dynamic> newestBooksMapData = await apiServices.get(
          endPoint:
              "volumes?Filtering=free-ebooks&q=subject:programming&Sorting=newest"); //Programming
      List<BookModel> newestBooksList = [];
      for (var item in newestBooksMapData['items']) {
        newestBooksList.add(BookModel.fromJson(item));
      }
      return right(newestBooksList);
    } on Exception catch (e) {
      if (e is DioError) {
        return Left(
          ServerFailure.fromDioError(e),
        );
      } else {
        return left(
          ServerFailure(
            errorMessage: e.toString(),
          ),
        );
      }
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks({required String category}) async{
    try {
      Map<String, dynamic> newestBooksMapData = await apiServices.get(
        endPoint: "volumes?Filtering=free-ebooks&q=subject:programming&Sorting=relevance",//flowers,sun
      ); //sun
      List<BookModel> newestBooksList = [];
      for (var item in newestBooksMapData['items']) {
        newestBooksList.add(
          BookModel.fromJson(item),
        );
      }
      return right(newestBooksList);
    } on Exception catch (e) {
      if (e is DioError) {
        return Left(
          ServerFailure.fromDioError(e),
        );
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
