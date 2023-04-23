import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';
import 'features/home/presentation/views/home_view.dart';
import 'package:flutter/services.dart';

void main() {
  // Set the status bar color and icon color
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor:
          kPrimaryColor, // Set the status bar color to kPrimaryColor
      statusBarIconBrightness:
          Brightness.light, // Set the status bar icon color to light
    ),
  );

  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: kPrimaryColor,
        textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
      ),
      home: const HomeView(),
    );
  }
}
