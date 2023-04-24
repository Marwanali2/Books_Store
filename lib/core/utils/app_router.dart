import 'package:go_router/go_router.dart';

import '../../features/home/presentation/views/book_details_view.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/splach/presentation/views/splach_view.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';
  static final router = GoRouter(
    // GoRouter configuration
    routes: [
      GoRoute(
        path: '/', // the main screen
        builder: (context, state) => const HomeView(),
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
        builder: (context, state) => const BookDetailsView(),
      ),
    ],
  );
}
