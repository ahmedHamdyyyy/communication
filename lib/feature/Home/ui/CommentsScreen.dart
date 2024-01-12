import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../service/components.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';
import '../widget/ListComments.dart';
import '../widget/Loding.dart';

class CommentsScreen extends StatelessWidget {
  CommentsScreen({
    Key? key,
    required this.postId,
    required this.name,
  }) : super(key: key);
  TextEditingController textController = TextEditingController();
  String postId;
  String name;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()
        ..getAllComments(postId)
        ..getMyDataFromCach()
        ..getUserData(name),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(name),
            ),
            body:
                commentsList(postId, context, state, textController),
          );
        },
      ),
    );
  }
}
