import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class FeaturedListShimmer extends StatelessWidget {
  const FeaturedListShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Shimmer.fromColors(
        baseColor: Colors.white30.withOpacity(0.2),
        highlightColor: Colors.grey,
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.30,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 15),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.30,
                  child: AspectRatio(
                    aspectRatio: 2.7 / 4,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white, 
                        borderRadius: BorderRadius.circular(18,),
                      ),
                    ),
                  )
                ),
              );
            },
            scrollDirection: Axis.horizontal,
          ),
        ),
      ),
    );
  }
}
