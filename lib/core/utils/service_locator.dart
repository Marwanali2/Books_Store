import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/home/data/repos/home_repo_impl.dart';
import '../../features/search/data/repos/search_repo_impl.dart';
import 'api_services.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      ApiServices(
        Dio(),
      ),
    ),
  );
  getIt.registerSingleton<SearchRepoImpl>(
    SearchRepoImpl(
      ApiServices(
        Dio(),
      ),
    ),
  );
}
