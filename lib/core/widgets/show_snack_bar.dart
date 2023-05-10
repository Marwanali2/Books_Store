import 'package:flutter/material.dart';
void showSnackBar({required BuildContext context, required String label,required Color backgroundColor}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(label),
      backgroundColor:backgroundColor ,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),side: BorderSide(width: 2,color: Colors.white),),
      behavior:SnackBarBehavior.floating,

    ),
  );
}