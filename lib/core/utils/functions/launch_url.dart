import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import '../../widgets/show_snack_bar.dart';

Future<void> launchCustomUrl(context, String ?url,String bookTitle) async {
 if(url!=null){
   Uri uri = Uri.parse(url!); //Uri.parse('https://flutter.dev');
   if (await canLaunchUrl(uri)) {
     await launchUrl(uri);
   } else {
     showSnackBar(
       context: context,
       label: "Cannot Launch  url of $bookTitle book",
       backgroundColor: Colors.red,
     );
   }
 }
}
