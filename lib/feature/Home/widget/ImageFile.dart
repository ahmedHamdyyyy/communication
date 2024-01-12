import 'package:flutter/material.dart';

import '../cubit/home_state.dart';

Widget imageFile(HomeState state) => Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (state.imageFile != null)
          Image.file(
            state.imageFile!,
            height: 280,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
      ],
    );
