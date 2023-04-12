import 'package:flutter/material.dart';
import 'package:my_bookly_app/features/splach/presentation/views/widgets/sliding_image.dart';
import 'package:my_bookly_app/features/splach/presentation/views/widgets/sliding_text.dart';

import '../../../../../core/utils/assets.dart';

class SplachViewBody extends StatefulWidget {
  const SplachViewBody({Key? key}) : super(key: key);

  @override
  State<SplachViewBody> createState() => _SplachViewBodyState();
}

class _SplachViewBodyState extends State<SplachViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  late Animation<Offset> imageSlidingAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 3,
      ),
    );
    slidingAnimation=Tween<Offset>(begin: const Offset(-1,0),end:Offset.zero).animate(animationController);
    imageSlidingAnimation=Tween<Offset>(begin: const Offset(1,0),end:Offset.zero).animate(animationController);
   animationController.forward();
  }

  @override
  void dispose() { // بنعملها في نهاية كل كنترولر علشان متهدرش الميموري و توقف تنفيذ الكنترولر اللي بنستخدمه مرة واحده
    animationController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SlidingImage(imageSlidingAnimation: imageSlidingAnimation),
          const SizedBox(
            height: 10,
          ),
          SlidingText(slidingAnimation: slidingAnimation),
        ],
      ),
    );
  }
}




