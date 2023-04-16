import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';
class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50,right: 30,left: 30,bottom: 40),
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