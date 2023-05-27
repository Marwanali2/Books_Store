import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
class BestSellerItemShimmer extends StatelessWidget {
  const BestSellerItemShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 155,
          child: Shimmer.fromColors(
            baseColor: Colors.white30.withOpacity(0.2),
            highlightColor: Colors.grey,
            child: AspectRatio(
              aspectRatio: 2.5 / 4,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    18,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 30,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
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
              const SizedBox(
                height: 3,
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
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
              const SizedBox(
                height: 3,
              ),
              Row(
                children: [
                  SizedBox(
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
                  const SizedBox(
                    width: 36.3,
                  ),
                  SizedBox(
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
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}