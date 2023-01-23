import 'package:flutter/material.dart';

abstract class Themes {
  static const InputDecoration inputDecoration = InputDecoration(
    hintText: "Enter MMK Value",
    isDense: true,
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 3,
        color: Colors.indigo,
      ),
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(
        width: 3,
        color: Colors.indigo,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 3,
        color: Colors.indigo,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 3,
        color: Colors.indigo,
      ),
    ),
  );
  static const Decoration dropdownDecoration = ShapeDecoration(
    color: Colors.white,
    shape: RoundedRectangleBorder(
      side: BorderSide(
        width: 2,
        style: BorderStyle.solid,
        color: Colors.indigo,
      ),
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    ),
  );
  static const TextStyle textStyle =
      TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold);
  static const TextStyle dropDownItemtextStyle = TextStyle(
      fontSize: 19, color: Colors.indigo, fontWeight: FontWeight.bold);
}
