import 'package:flutter/material.dart';
import 'package:my_bookly_app/features/home/presentation/views/widgets/home_view_body.dart';
class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: const Scaffold(
        body: HomeViewBody(),
      ),
    );
  }
}
