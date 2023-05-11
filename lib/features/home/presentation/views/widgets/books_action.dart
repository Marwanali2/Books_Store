import 'package:flutter/material.dart';

import '../../../../../core/utils/functions/launch_url.dart';
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
              text: "Free",//"19.99€",
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
              text: getText(bookModel),
              fontSize: 18,
              textColor: Colors.white,
              fontWeight: FontWeight.w400,
              backGroundColor: const Color(0xffEF8262),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(18),
                bottomRight: Radius.circular(18),
              ),
              onPressed: () {
                launchCustomUrl(context,"${bookModel.volumeInfo?.infoLink}","${bookModel.volumeInfo?.title} ");
              },
            ),

          ),
        ],
      ),
    );
  }

 String getText(BookModel bookModel) {
    if(bookModel.volumeInfo?.infoLink==null){
      return "Not Available";
    }else{
      return "Preview";
    }
 }
}
