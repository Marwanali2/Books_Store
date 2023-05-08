import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/widgets/custom_button.dart';
import '../../../data/models/book_model/book_model.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({Key? key, required this.bookModel}) : super(key: key);
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children:  [
          Expanded(
            child: CustomButton(
              text: "19.99€",
              textColor: Colors.black,
              backGroundColor: Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(18),
                bottomLeft: Radius.circular(18),
              ),
              onPressed: () {},
            ),
          ),
           Expanded(
            child: CustomButton(
              text: "Free Preview",
              fontSize: 18,
              textColor: Colors.white,
              fontWeight: FontWeight.w400,
              backGroundColor: const Color(0xffEF8262),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(18),
                bottomRight: Radius.circular(18),
              ),
              onPressed: () async{
                 Uri url = Uri.parse("${bookModel.volumeInfo?.previewLink}");//Uri.parse('https://flutter.dev');
                if (await canLaunchUrl(url)) {
                 await launchUrl(url);
                }
              },
            ),

          ),
        ],
      ),
    );
  }
}
