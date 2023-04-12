import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';
class SlidingImage extends StatelessWidget {
  const SlidingImage({
    super.key,
    required this.imageSlidingAnimation,
  });

  final Animation<Offset> imageSlidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: imageSlidingAnimation,
      builder: (context, child) =>  SlideTransition(
        position:imageSlidingAnimation,
        child: Image.asset(
          AssetsData.logo,
          color: Colors.green,
        ),
      ),
    );
  }
}