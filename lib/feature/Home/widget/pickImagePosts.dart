import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../cubit/home_cubit.dart';

Widget pickImagePosts(BuildContext context) => Row(
      children: [
        Expanded(
          child: IconButton(
              onPressed: () async {
                context
                    .read<HomeCubit>()
                    .pickImagePosts(source: ImageSource.camera);
              },
              icon: const CircleAvatar(
                backgroundColor: Colors.blueGrey,
                radius: 20,
                child: Icon(
                  Icons.camera_alt_rounded,
                  color: Colors.white,
                  size: 20,
                ),
              )),
        ),
        Expanded(
          child: IconButton(
            onPressed: () async {
              context
                  .read<HomeCubit>()
                  .pickImagePosts(source: ImageSource.gallery);
            },
            icon: const CircleAvatar(
                radius: 20,
                backgroundColor: Colors.blueGrey,
                child: Icon(
                  Icons.photo,
                  color: Colors.white,
                )),
          ),
        ),
      ],
    );
