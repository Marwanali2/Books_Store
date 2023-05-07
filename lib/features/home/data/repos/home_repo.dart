import '../../../../core/errors/failure.dart';
import '../models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  // بحط الميثودس اللي هتتنفذ في صفحة الهوم , تنفيذ الميثودش موجود في صفحة HomeRepoImpl
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks(); // either is from package "dartz" use to handle error
  // يعني هنا لما بستدعي البيانات فيه احتمالين الاول انها توصلي بالسلامة , الاحنمال التاني ان يحصل ايرور و متوصلش سواء ايرور بسبب السيرفر او مشكلة نت و هكذا
  // فمفروض اهندل الاحتمالين دول عن طريق Either الموجودة في باكدج dart z
  // انواع الايرور دول متجمعين في abstract class اسمه Failures

  Future<Either<Failure, List<BookModel>>> fetchNewestBooks();

  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks({required String category});
}
