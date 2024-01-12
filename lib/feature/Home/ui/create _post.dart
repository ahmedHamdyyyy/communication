import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../service/components.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';
import '../widget/ImageUserAndName.dart';
import '../widget/pickImagePosts.dart';

class CreatePostScreen extends StatelessWidget {
  TextEditingController nameController = TextEditingController();

  CreatePostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getMyDataFromCach(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: imageUserAndName(
                state,
              ),
              centerTitle: true,
              actions: [
                TextButton(
                  onPressed: () {
                    var now = DateTime.now();

                    context.read<HomeCubit>().createPost(
                        dateTime:
                            "${now.year}/${now.month}/${now.day} h ${now.hour} m ${now.minute}",
                        text: nameController.text,
                        imagePost:
                            state.imagePath != "" ? state.imagePath : "");
                  },
                  child: state.createPostState == MyStatus.loading ||
                          state.uploadPostState == MyStatus.loading
                      ? const CircularProgressIndicator()
                      : const Text(
                          'Add Post',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [

                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: TextFormField(
                      cursorHeight: 25,
                      controller: nameController,
                      style: Theme.of(context).textTheme.bodyMedium,
                      decoration: const InputDecoration(
                        filled: true,
                        border: OutlineInputBorder(),
                        hintText: 'what do you think...',
                      ),
                      minLines: 2,
                      maxLines: 5,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'must not be empty';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      state.imagePath != ''
                          ? FutureBuilder(
                          future: context
                              .read<HomeCubit>()
                              .getPath(state.imagePath),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const SizedBox();
                            } else if (snapshot.connectionState ==
                                ConnectionState.done) {
                              return Image.memory(snapshot.data!,
                                  height: 280,
                                  width: double.infinity,
                                  fit: BoxFit.cover);
                            }
                            return Image.memory(snapshot.data!,
                                height: 150, width: 150, fit: BoxFit.cover);
                          })
                          : const SizedBox(),
                    ],
                  ),
                  pickImagePosts(context),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
