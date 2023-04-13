import 'package:flutter/material.dart';

class AssetsData{
  static const logo="assets/images/BOOKLY-logo.png";
}

class BooklyImage extends StatelessWidget {
  Color color;
  int height;
   BooklyImage({
    super.key,
    this.color=Colors.green,
     this.height=16
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AssetsData.logo,
      color: color,
    );
  }
}
//https://www.freepik.com/free-icon/book_15611380.htm#query=book&position=43&from_view=search&track=sph