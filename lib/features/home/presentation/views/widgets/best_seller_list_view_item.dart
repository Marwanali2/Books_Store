import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';
import 'book_rating.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 155,
          child: AspectRatio(
            aspectRatio: 2.5 / 4,
            child: Container(
              // width: 150,
              // height: 224,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white30,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.circular(18),
                image: const DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    "assets/images/q1.jpg",
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
                child:  Text(
                  "Harry Potter and the Goblet of Fire",
                  style: TextStyles.textStyle20.copyWith(fontFamily:kQuicksand),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 3,),
              Text("J.K. Rowling",style: TextStyles.textStyle14.copyWith(color: ColorStyles.kGreyColor,),),
              const SizedBox(height: 3,),
              Row(
                children: [
                  Text("19.99 €",style:TextStyles.textStyle20.copyWith(fontWeight: FontWeight.bold),),
                  const SizedBox(width:36.3),
                  const BookRating(),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}


