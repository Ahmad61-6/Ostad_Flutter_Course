import 'package:flutter/material.dart';

InputDecoration inputDecoration(String hint){
  return InputDecoration(
    contentPadding: EdgeInsets.fromLTRB(20, 10, 10, 20),
    enabledBorder: OutlineInputBorder(),
    focusedBorder: OutlineInputBorder(),
    hintText: hint,
  );
}