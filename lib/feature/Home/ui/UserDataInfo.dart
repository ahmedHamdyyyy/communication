import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../service/components.dart';
import '../../../constant/color_constant.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';
import '../widget/IconeButton.dart';
import '../widget/ListViewPostsUser.dart';
import '../widget/Loding.dart';
import 'chat_screen.dart';

class UserDataInfo extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  UserDataInfo({super.key, required this.uId});
  String uId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()
        ..getUserData(uId)
        ..getMyDataFromCach()
        ..getUserPosts(uId)..getTheme(),
      child: BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
        phoneController.text = state.userModelSocial.phone;
        nameController.text = state.userModelSocial.name;
        emailController.text = state.userModelSocial.email;

        return Scaffold(
          appBar: AppBar(
            centerTitle: false,
            titleSpacing: 5.0,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_sharp,
              ),
            ),
            title: const Text('Data User',/*style: TextStyle(color: Colors.cyanAccent),*/),
          ),
          floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.deepOrange,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatScreen(
                        uIdUser: state.userModelSocial.uId!,
                        uId:state.myDataModelSocial.uId!,

                      ),
                    ));
              },
              child: const Icon(Icons.chat)),
          body: state.getUserInfo != MyStatus.loading
              ? SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 200,
                          child: Stack(
                            alignment: Alignment.bottomLeft,
                            children: [
                              Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  CircleAvatar(
                                    radius: 80,
                                    backgroundColor: Colors.white,
                                    child: CircleAvatar(
                                      radius: 78,
                                      backgroundImage:
                                          state.userModelSocial.image == ""
                                              ? const AssetImage(noImages)
                                              : NetworkImage(state
                                                  .userModelSocial
                                                  .image) as ImageProvider,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 50.0,
                        ),
                        iconButton(state.userModelSocial.name),
                        const SizedBox(
                          height: 10.0,
                        ),
                        iconButton(state.userModelSocial.birthDate),
                        const SizedBox(
                          height: 10.0,
                        ),
                        iconButton(state.userModelSocial.phone),
                        const SizedBox(
                          height: 10.0,
                        ),
                        iconButton(state.userModelSocial.email),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Column(
                          children: [
                            ConditionalBuilder(
                              condition: state.postsUser.isNotEmpty,
                              builder: (context) {
                                return SingleChildScrollView(
                                  physics: const BouncingScrollPhysics(),
                                  child: Column(
                                    children: [
                                      Center(
                                          child: Container(
                                        height: 50,
                                        width: 300,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.deepOrange,
                                        ),
                                        child: MaterialButton(
                                          onPressed: () {},
                                          child: Text(
                                            'Posts  ${state.userModelSocial.name}',
                                            style: const TextStyle(
                                                fontSize: 20,
                                                color: Colors.white),
                                          ),
                                        ),
                                      )),
                                      listViewPostsUser(state),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                    ],
                                  ),
                                );
                              },
                              fallback: (context) => lauding,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              : lauding,
        );
      }),
    );
  }
}
