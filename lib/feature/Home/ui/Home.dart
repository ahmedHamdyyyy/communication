
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../service/components.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';
import '../widget/CardWidgt.dart';
import '../widget/HomeDrawer.dart';
import '../widget/Loding.dart';
import '../widget/listViewPosts.dart';

class HomePostsScreen extends StatelessWidget {
  const HomePostsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()
        ..getAllPosts()
        ..getMyDataFromCach()..getTheme(),
      child: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(

                title: const Text("All Posts User"),
              ),
              body: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    cardWidget,
                  state.getAllPostsState==MyStatus.loading? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(child: CircularProgressIndicator()),
                    ],
                  ): listViewPosts(state,context),
                    const SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              ),
              drawerScrimColor: Colors.transparent,
              drawer: homeDrawer(context),
            );
          }),
    );
  }
}
