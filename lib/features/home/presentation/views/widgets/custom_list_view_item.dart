import 'package:flutter/material.dart';
class CustomListViewItem extends StatelessWidget {
  const CustomListViewItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox( // طوله ثابت و يحتوي علي صورة نسبتها هي الاسبكت راتيو عشان تكون ريسبونسف
      height: MediaQuery.of(context).size.height*0.30,
      child: AspectRatio( // نسبة العرض الي الطول اللي هتكون ثابتة بداخل ال sizedbox
        aspectRatio: 2.7/4,
        child: Container(
          // width: 150,
          // height: 224,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              image: const DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  "assets/images/q1.jpg",
                ),
              )),
        ),
      ),
    );
  }
}