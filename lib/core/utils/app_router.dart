import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_bookly_app/core/utils/service_locator.dart';
import 'package:my_bookly_app/features/home/presentation/managers/similar_books_cubit/similar_books_cubit.dart';


import '../../features/auth/presentation/views/login_screen.dart';
import '../../features/auth/presentation/views/signup_screen.dart';
import '../../features/home/data/models/book_model/book_model.dart';
import '../../features/home/data/repos/home_repo_impl.dart';
import '../../features/home/presentation/views/book_details_view.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/search/data/repos/search_repo_impl.dart';
import '../../features/search/presentation/managers/search_books_cubit/search_books_cubit.dart';
import '../../features/search/presentation/views/search_view.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';
  static const kSearchView = '/searchView';
  static const kLoginScreen='/loginScreen';
  static const kSignUpScreen='/SignUpScreen';
  static final router = GoRouter(
    // GoRouter configuration
    routes: [
      GoRoute(
        path: '/', // the main screen
        builder: (context, state) =>  const SignUpScreen(),//const SplachView(),
      ),
      // GoRoute(
      //   path: '/', // the main screen
      //   builder: (context, state) => const SplachView(),
      // ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kBookDetailsView,
        builder: (context, state) => BlocProvider(
          create: (context) => SimilarBooksCubit(
            getIt.get<HomeRepoImpl>(),
          ),
          child: BookDetailsView(
            bookModel: state.extra as BookModel,
          ),
        ),
      ),
      GoRoute(
        path: kSearchView, // the main screen
        builder: (context, state) => BlocProvider(
          create: (context) {
            return SearchBooksCubit(
              getIt.get<SearchRepoImpl>(),
            )..fetchSearchBooks(bookType: state.extra as String);
          },
          child:  SearchView(
            bookName: state.extra as String,
          ),
        ),
      ),
      GoRoute(path: kLoginScreen, builder: (context, state) =>  LoginScreen(),),

      GoRoute(path: kSignUpScreen, builder: (context, state) =>  SignUpScreen(),),
    ],
  );
}
