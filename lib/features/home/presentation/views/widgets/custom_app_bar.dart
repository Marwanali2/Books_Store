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
        Image.asset(
        AssetsData.logo,
        width: 75,
        height: 16.1,
      ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search,size: 30),
          ),

        ],
      ),
    );
  }
}