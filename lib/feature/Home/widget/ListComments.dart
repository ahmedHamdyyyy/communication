import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../service/components.dart';
import '../../../constant/color_constant.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';
import '../models/comments.dart';
import 'Loding.dart';

Widget commentsList(String postId, BuildContext context, HomeState state,
    TextEditingController textController) {
  return Column(
    children: [
      state.getCommentsUserState != MyStatus.loading
          ? Expanded(
              child: RefreshIndicator(
                onRefresh: () async =>
                    context.read<HomeCubit>().getAllComments(postId),
                child: ListView.separated(
                    shrinkWrap: true,
                    primary: false,
                    itemBuilder: (context, index) => Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Card(
                              elevation: 5,
                              margin: const EdgeInsets.symmetric(
                                horizontal: 8,
                              ),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        const SizedBox(
                                          width: 18,
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                state.comments[index].desc,
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      state
                                                          .comments[index].name,
                                                      style: const TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 13,
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      state.comments[index]
                                                          .dateTime,
                                                      style: const TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 13,
                                                      ),
                                                    ),
                                                  ),
                                                  CircleAvatar(
                                                    radius: 15,
                                                    backgroundImage: state.comments[index]
                                                        .image
                                                        .toString() ==
                                                        ""
                                                        ? const AssetImage(noImages) as ImageProvider
                                                        : NetworkImage(
                                                      state.comments[index]
                                                          .image.toString(),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 10,
                        ),
                    itemCount: state.comments.length),
              ),
            )
          : lauding,
      const SizedBox(
        height: 10,
      ),
      TextFormField(
        onFieldSubmitted: (value) {},
        controller: textController,
        decoration: InputDecoration(
            labelText: "اكتب كومنت جامد زيك ",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            prefixIcon: const Icon(
              Icons.watch_later,
            ),
            suffixIcon: IconButton(
                onPressed: () {
                  var now = DateTime.now();
                  context.read<HomeCubit>().createComment(CommentModel(
                      postId: postId,
                      image: state.myDataModelSocial.image,
                      desc: textController.text,
                      dateTime:
                          "${now.year}/${now.month}/${now.day} h ${now.hour}:${now.minute}:${now.second}",
                      name: state.myDataModelSocial.name));
                  textController.clear();
                  context.read<HomeCubit>().getAllComments(postId);
                },
                icon: const Icon(
                  Icons.send,
                  color: Colors.red,
                ))),
      ),
    ],
  );
}
