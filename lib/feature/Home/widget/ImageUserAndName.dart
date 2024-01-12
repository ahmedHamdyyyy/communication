import 'package:flutter/material.dart';

import '../../../constant/color_constant.dart';
import '../cubit/home_state.dart';

Widget imageUserAndName(HomeState state)=>Row(
  children: [
    CircleAvatar(
      radius: 18,
      backgroundImage:
      state.myDataModelSocial.image.toString() == ""
          ? const AssetImage(
        noImages,
      ) as ImageProvider
          : NetworkImage(state.myDataModelSocial.image),
    ),
    const SizedBox(
      width: 18,
    ),
    Expanded(
      child: Text(
        state.myDataModelSocial.name.toString(),
        style: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold),
      ),
    ),
  ],
);