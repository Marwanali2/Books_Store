import 'package:flutter/material.dart';

class AssetsData{
  static const logo="assets/images/BOOKLY.png";
  List appImages=[

  ];
}

class BooklyImage extends StatelessWidget {
  Color color;
 final double imageHeight;
 final double imageWidth;
   BooklyImage({
    super.key,
    this.color=Colors.white,
    required this.imageHeight,
     required this.imageWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AssetsData.logo,
      color: color,
      height: imageHeight,
      width: imageWidth,
    );
  }
}
//https://www.freepik.com/free-icon/book_15611380.htm#query=book&position=43&from_view=search&track=sph