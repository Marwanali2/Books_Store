import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
class BooksActionShimmer extends StatelessWidget {
  const BooksActionShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
        height: 50,
        child:Shimmer.fromColors(
          baseColor: Colors.white30.withOpacity(0.2),
          highlightColor: Colors.grey,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18,),
            ),
          ),
        )
    );
  }
}