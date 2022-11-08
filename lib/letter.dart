import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hangmangame/colors.dart';

Widget letter(String character, bool hidden) {
  return Container(
    height: 65,
    width: 50,
    padding: EdgeInsets.all(12.0),
    decoration: BoxDecoration(
        color: AppColor.primaryColorDark, borderRadius: BorderRadius.zero),
    child: Visibility(
      visible: hidden,
      child: Text(
        character,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 40.0,
        ),
      ),
    ),
  );
}
