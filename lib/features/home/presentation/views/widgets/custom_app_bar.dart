import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_bookly_app/core/utils/app_router.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../search/presentation/views/widgets/search_view_body.dart';
import 'package:anim_search_bar/anim_search_bar.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  TextEditingController textController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, bottom: 40),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            AssetsData.logo,
            width: 75,
            height: 16.1,
          ),
          const Spacer(),
          AnimSearchBar(
            width: MediaQuery.of(context).size.width*0.6,
            prefixIcon: const Icon(Icons.search,color: Colors.black,size:30,),
            color: Colors.grey,
            textController: textController,

            onSuffixTap: (){
              setState(() {
                textController.clear();
              });
            },
            onSubmitted: (bookName){
              GoRouter.of(context).push(
                        AppRouter.kSearchView,
                        extra: bookName,
                      );
                    },
          ),
          // IconButton(
          //   onPressed: () {
          //     GoRouter.of(context).push(
          //       AppRouter.kSearchView,
          //     );
          //   },
          //   icon: const Icon(Icons.search, size: 30),
          // ),
        ],
      ),
    );
  }
}
