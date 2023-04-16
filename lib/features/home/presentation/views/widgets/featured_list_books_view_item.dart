import 'package:flutter/material.dart';
class FeaturedListViewItem extends StatelessWidget {
  const FeaturedListViewItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio( // نسبة العرض الي الطول اللي هتكون ثابتة بداخل ال sizedbox
      aspectRatio: 2.7/4,
      child: Container(
        // width: 150,
        // height: 224,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white30,style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(18),
            image: const DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                "assets/images/q1.jpg",
              ),
            )),
      ),
    );
  }
}