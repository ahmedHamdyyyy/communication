/*
import 'package:flutter/material.dart';

import '../cubit/home_state.dart';

Widget sendMessageMe({required int index, required HomeState state}) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Container(
      // alignment: Alignment.centerLeft,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: const EdgeInsets.only(left: 16, top: 10, bottom: 10, right: 16),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0),
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        color: Color(0xff2B515E),
      ),
      child: Text(
        state.messages[index].text!,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    ),
  );
}

Widget sendMessageHim({required int index, required HomeState state}) {
  return Align(
    alignment: Alignment.centerRight,
    child: Container(
      //alignment: Alignment.centerLeft,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: const EdgeInsets.only(left: 16, top: 10, bottom: 10, right: 16),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
          bottomRight: Radius.circular(0),
        ),
        color: Colors.deepOrange,
      ),
      child: Text(
        state.messages[index].text.toString(),
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    ),
  );
}
*/
import 'package:flutter/material.dart';

import '../models/MessageModel.dart';

Widget sendMessageMe(MessageModel model) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Container(
      // alignment: Alignment.centerLeft,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: const EdgeInsets.only(left: 16, top: 10, bottom: 10, right: 16),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0),
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        color: Color(0xff2B515E),
      ),
      child: Text(
        model.text.toString(),
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    ),
  );
}

Widget sendMessageHim(MessageModel model) {
  return Align(
    alignment: Alignment.centerRight,
    child: Container(
      //alignment: Alignment.centerLeft,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: const EdgeInsets.only(left: 16, top: 10, bottom: 10, right: 16),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
          bottomRight: Radius.circular(0),
        ),
        color: Colors.deepOrange,
      ),
      child: Text(
        model.text.toString(),
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    ),
  );
}