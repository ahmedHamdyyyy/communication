import 'package:flutter/material.dart';

import '../../../constant/color_constant.dart';
import '../cubit/home_state.dart';

AppBar appBarChat ( HomeState state){
  return AppBar(
    elevation: 1,
    titleSpacing: 0,
    title: Row(
      children: [
        CircleAvatar(
          radius: 22,
          backgroundImage: state.userModelSocial.image == ""
              ? const AssetImage(
            noImages,
          ) as ImageProvider
              : NetworkImage(
            state.userModelSocial.image,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          state.userModelSocial.name,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    ),
  );
}