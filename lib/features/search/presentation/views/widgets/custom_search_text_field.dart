import 'package:flutter/material.dart';

import '../../../../home/data/models/book_model/book_model.dart';

class CustomSearchTextField extends StatelessWidget {
   const CustomSearchTextField({Key? key, required this.onChanged}) : super(key: key);
final void Function(String inputBookTitle)onChanged;
  @override
  Widget build(BuildContext context) {

    return TextField(
      style: const TextStyle(),
      onChanged: onChanged,
      decoration: InputDecoration(
        focusedBorder: buildOutlineInputBorder(),
        enabledBorder: buildOutlineInputBorder(),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            18,
          ),
        ),
        hintText: "Search...",
        suffixIcon: IconButton(
          onPressed: () {},
          icon: const Opacity(
            opacity: 0.7,
            child: Icon(Icons.search, size: 30, color: Colors.grey),
          ),
        ),
      ),
    );
  }
  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(18),
      borderSide: const BorderSide(
        color: Color(
          0xff0238ff,
        ),
      ),
    );
  }



}
