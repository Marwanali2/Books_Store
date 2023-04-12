import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';
class SplachViewBody extends StatelessWidget {
  const SplachViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.network(AssetsData.logo,color: Colors.orange,width: 100,height: 100,),
          const SizedBox(height: 10,),
          const Text('Read Free Books',textAlign: TextAlign.center,),
        ],
      ),
    );
  }
}
