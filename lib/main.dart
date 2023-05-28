// ******** list of bugs ************
// login page
// handle shop icon which contain loved books and unloved books for each user in details page
// ✅ refresh page  لو شغلت الابب اول مرة من غير نت هيعرض انك اوفلاين و يجبلك اللوتي لكن مش بيعمل ريفريش بحيث انك لما تفتح نت يجبلك المحتوي
// ✅ add shimmer package
// ✅ add flutter offline package
// ✅ enable search 1.repo 2.repo implementation 3.cubit 4.use cubit

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'package:my_bookly_app/core/utils/service_locator.dart';
import 'package:my_bookly_app/features/auth/presentation/managers/auth_cubit/auth_cubit.dart';
import 'package:my_bookly_app/features/home/data/repos/home_repo_impl.dart';
import 'package:my_bookly_app/features/search/presentation/managers/search_books_cubit/search_books_cubit.dart';
import 'package:my_bookly_app/simple_bloc_observer.dart';

import 'core/utils/app_router.dart';
import 'package:my_bookly_app/core/utils/styles.dart';

import 'features/home/presentation/managers/featured_books_cubit/featured_books_cubit.dart';
import 'features/home/presentation/managers/newest_books_cubit/newest_books_cubit.dart';
import 'features/search/data/repos/search_repo_impl.dart';

void main() async{
  setupServiceLocator();
  // Set the status bar color and icon color
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: ColorStyles
          .kPrimaryColor, // Set the status bar color to kPrimaryColor
      statusBarIconBrightness:
          Brightness.light, // Set the status bar icon color to light
    ),
  );
  Bloc.observer = SimpleBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBooksCubit(
            getIt.get<HomeRepoImpl>(), // اقرا الشرح في الكومنتات تحت
            /*HomeRepoImpl( //تحت و كده اي تعديل في الاسكوب هيظهر معايا في كل الاماكن اللي استخدتها فيه.كمل تحت bloc provider هنا الاسكوب ده بيتكرر معايا كذا مرة هنا و في ال
              ApiServices( //المشهور و هو انشاء مودل واحد من الاسكوب المتكرر dependency injection(principle in design pattern)  و بالتالي هلجأ لاستخدام مبدأ
                Dio(), //   Setup service locator  مشروحه في فيديو رقم80 ف كورس المتوسط من ثروت service locator و هي عبارة عن  "get_it"package لكي نحقق هذا المبدا نسخدم
              ),
            ),*/
          )..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) => NewestBooksCubit(
            getIt.get<HomeRepoImpl>(),
            /* HomeRepoImpl(
              ApiServices(
                Dio(),
              ),
            ),*/
          )..fetchNewestBooks(),
        ),
        BlocProvider(
          create: (context) => SearchBooksCubit(
            getIt.get<SearchRepoImpl>(),
          ),
        ),
        BlocProvider(create: (context) => AuthCubit()),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: ColorStyles.kPrimaryColor,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}
