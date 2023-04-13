import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';
class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 60),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          BooklyImage(color: Colors.white),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search,size: 25),
          ),

        ],
      ),
    );
  }
}