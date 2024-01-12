import 'package:flutter/material.dart';


Widget iconButton( String text)=>
   Container(
    height: 50,
    width: 300,
    decoration: BoxDecoration(
      borderRadius:
      BorderRadius.circular(20),
      color: Colors.blueGrey,
    ),
    child: MaterialButton(
      onPressed: () {},
      child:  Text(
       text ,
        style: TextStyle(
            fontSize: 20,
            color: Colors.white),
      ),
    ),
  );
