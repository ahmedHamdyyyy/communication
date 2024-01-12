/*

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../service/components.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';
import '../widget/CardWidgt.dart';
import '../widget/Loding.dart';
import '../widget/listViewPosts.dart';

class AllPostsScreen extends StatelessWidget {
  const AllPostsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()
        ..getAllPosts()
        ..getMyDataFromCach(),
      child: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(

                title: const Text("All Posts User"),
              ),
              body: ConditionalBuilder(
                condition: state.posts.isNotEmpty,
                builder: (context) {
                  return SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        cardWidget,
                      listViewPosts(state,context),
                        const SizedBox(
                          height: 8,
                        ),
                      ],
                    ),
                  );
                },
                fallback: (context) =>  const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("No Posts "),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
*/
