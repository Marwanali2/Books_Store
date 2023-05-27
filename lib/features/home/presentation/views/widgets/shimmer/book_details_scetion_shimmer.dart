import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'books_action_shimmer.dart';

class BookDetailsSectionShimmer extends StatelessWidget {
  const BookDetailsSectionShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        const SizedBox(height: 36),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.18),
          child: Shimmer.fromColors(
            baseColor: Colors.white30.withOpacity(0.2),
            highlightColor: Colors.grey,
            child: AspectRatio(
              aspectRatio: 2.7 / 4,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18,),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            height: 30,
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
        ),
        const SizedBox(height: 6),
        SizedBox(
            width: MediaQuery.of(context).size.width * 0.3,
            height: 25,
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
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 110),
          child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.2,
              height: 25,
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
          ),
        ),
        const SizedBox(
          height: 37,
        ),
        const BooksActionShimmer(),
      ],
    );
  }
}


// class SimilarBooksListViewShimmer extends StatelessWidget {
//   const SimilarBooksListViewShimmer({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: MediaQuery.of(context).size.height * 0.15,
//       child: ListView.builder(
//         physics: const BouncingScrollPhysics(),
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: const EdgeInsets.only(right: 10),
//             child: Shimmer.fromColors(
//               baseColor: Colors.white30.withOpacity(0.2),
//               highlightColor: Colors.grey,
//               child: AspectRatio(
//                 aspectRatio: 2.7 / 4,
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(18,),
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//         scrollDirection: Axis.horizontal,
//         itemCount: 10,
//       ),
//     );
//   }
// }




