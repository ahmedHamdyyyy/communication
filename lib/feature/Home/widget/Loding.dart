
import 'package:flutter/material.dart';

Widget  get lauding=>const Center(child:
CircularProgressIndicator(color: Colors.red,));

Widget get textNoComments=>const Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Center(
        child: Text(
          "...لا توجد تعليقات ",
          style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: 30),
        )),
  ],
);