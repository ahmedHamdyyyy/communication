import 'package:flutter/material.dart';

import '../../../constant/color_constant.dart';

Widget themeButton(
    BuildContext context,
    String text,
    bool condition,
    void Function() onTap,
    ) =>
    Row(
      children: [
        Expanded(
          child: TextButton(
            style: buttonStyle(condition),
            onPressed: onTap,
            child: Text(text),
          ),
        ),
      ],
    );

ButtonStyle buttonStyle(bool condition) => ButtonStyle(
  backgroundColor: MaterialStatePropertyAll(
    condition ? secondaryColor[0] : Colors.transparent,
  ),
);