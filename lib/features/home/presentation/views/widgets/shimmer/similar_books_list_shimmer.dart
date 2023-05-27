import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';


class SimilarBooksListShimmer extends StatelessWidget {
  const SimilarBooksListShimmer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 16,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.15,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 10),
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
              );
            },
            scrollDirection: Axis.horizontal,
            itemCount: 10,
          ),
        ),
      ],
    );
  }
}