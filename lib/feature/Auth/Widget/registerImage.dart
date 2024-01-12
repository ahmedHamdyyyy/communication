// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../constant/color_constant.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/auth_state.dart';

Widget  registerImage( BuildContext context) => BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) => Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(150),
                child: state.imagePath != ''
                    ? FutureBuilder(
                        future: context.read<AuthCubit>(). getPath(state.imagePath),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Image.asset(noImages,
                                fit: BoxFit.cover, height: 150, width: 150);
                          } else if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return Image.memory(snapshot.data!,
                                height: 150, width: 150, fit: BoxFit.cover);
                          }
                          return Image.memory(snapshot.data!,
                              height: 150, width: 150, fit: BoxFit.cover);
                        })
                    : Image.asset(noImages,
                        fit: BoxFit.cover, height: 150, width: 150),
              ),
              const SizedBox(height: 20),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  context
                      .read<AuthCubit>()
                      .pickImageUser(source: ImageSource.camera);
                },
                clipBehavior: Clip.antiAliasWithSaveLayer,
                style: const ButtonStyle(
                  shape: MaterialStatePropertyAll(CircleBorder()),
                ),
                child: const Align(
                  alignment: Alignment.topLeft,
                  child: Icon(Icons.camera_alt_rounded, size: 20),
                ),
              ),
              Column(
                children: [
                  const SizedBox(height: 50, width: 30),
                  state.imagePath != ''
                      ? ElevatedButton(
                          onPressed: () => context.read<AuthCubit>().clearImage,
                          style: const ButtonStyle(
                            shape: MaterialStatePropertyAll(CircleBorder()),
                          ),
                          child: const Icon(Icons.clear, size: 25),
                        )
                      : const SizedBox(),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  context
                      .read<AuthCubit>()
                      .pickImageUser(source: ImageSource.gallery);
                },
                style: const ButtonStyle(
                    shape: MaterialStatePropertyAll(CircleBorder())),
                child: const Icon(Icons.photo_library_rounded, size: 25),
              ),
            ],
          ),
        ],
      ),
    );
