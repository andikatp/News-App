import 'package:flutter/material.dart';
import 'package:news_app/constants/constants.dart';

class KTextFieldNice {
  KTextFieldNice._();

  static const kInputField = InputDecoration(
    contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
    hintText: 'Dogecoin to the moon...',
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(16.0)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey, width: 1.0),
      borderRadius: BorderRadius.all(Radius.circular(16.0)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey, width: 2.0),
      borderRadius: BorderRadius.all(Radius.circular(16.0)),
    ),
  );
}
