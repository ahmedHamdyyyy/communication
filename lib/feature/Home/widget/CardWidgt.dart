import 'package:flutter/material.dart';

Widget get cardWidget => const Card(
      elevation: 10,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          Image(
            height: 220,
            width: double.infinity,
            fit: BoxFit.cover,
            image: NetworkImage(
              "https://img.freepik.com/free-photo/woman-working-from-home-laptop-with-empty-screen_53876-127275.jpg?w=900&t=st=1660365955~exp=1660366555~hmac=dacbfd0184fae884248eebbe8d846b07c62de9659ae5135f7b6e2dcdfacc4f98",
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Communicate with friends ",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
