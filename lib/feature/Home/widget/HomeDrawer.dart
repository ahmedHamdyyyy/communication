import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../service/components.dart';
import '../../../generated/l10n.dart';
import '../../Auth/ui/login_screen.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';
import '../ui/AllPostsScreen.dart';
import '../ui/create _post.dart';
import '../ui/AllUserApp.dart';
import 'themeButton.dart';

Widget homeDrawer(BuildContext context) {
  String lang = context.read<HomeCubit>().getCurrentLang;
  int theme = context.read<HomeCubit>().getCurrentTheme;


  return Container(
    width: 300,
    height: double.infinity,
    decoration: const BoxDecoration(
       // color: Color.fromARGB(180, 250, 250, 250),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(31, 38, 135, 0.4),
            blurRadius: 10.0,
          )
        ],
        border: Border(
            bottom:BorderSide(color: Colors.cyan),
            top: BorderSide(color: Colors.cyan),
            left: BorderSide(color: Colors.cyan),
            right: BorderSide(
              color: Colors.cyanAccent,
            ))),
    child: Stack(
      children: [
        SizedBox(
          child: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 5.0,
                sigmaY:5.0,
              ),
              child: Container(
                decoration:  BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Colors.grey.withOpacity(0.0),
                  Colors.white.withOpacity(0.2),
                ])),
              ),
            ),
          ),
        ),
        Column(
          children: [
            DrawerHeader(
              child: Row(
                children: [
                  const SizedBox(
                    width: 20.0,
                  ),
                  BlocProvider(
                    create: (context) => HomeCubit()..getMyDataFromCach(),
                    child: BlocBuilder<HomeCubit, HomeState>(
                      builder: (context, state) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(state.myDataModelSocial.name.toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20)),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(state.myDataModelSocial.email.toString(), style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(state.myDataModelSocial.phone.toString(), style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                          ],
                        ); // TODO: implement listener
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AllOfUser(),
                          ));
                    },
                    leading: const Icon(
                      Icons.people,
                      size: 33,
                    ),
                    title: Text(S.of(context).chatsScreen),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CreatePostScreen(),
                          ));
                    },
                    leading: const Icon(
                      Icons.post_add,
                     // color: Colors.blueGrey,
                      size: 33,
                    ),
                    title: const Text("Create post"),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.pop(context);
                      showModalBottomSheet(
                        context: context,
                        builder: (_) => Container(
                          padding: const EdgeInsets.all(10),
                          height: 215,
                          width: double.infinity,
                          child: StatefulBuilder(
                            builder: (context, setState) => Column(
                              children: [
                                themeButton(
                                  context,
                                  'white theme',
                                  theme == 0,
                                      () => setState(() => theme = 0),
                                ),
                                themeButton(
                                  context,
                                  'dark theme',
                                  theme == 1,
                                      () => setState(() => theme = 1),
                                ),
                                themeButton(
                                  context,
                                  'custom theme',
                                  theme == 2,
                                      () => setState(() => theme = 2),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text("cancel"),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        context.read<HomeCubit>().setTheme(currentTheme: theme);
                                        Navigator.pop(context);
                                      },
                                      child: const Text("confirm"),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    leading: const Icon(Icons.color_lens_rounded, size: 30, /*color: Colors.blueGrey,*/),
                    title:  Text(S.of(context).Theme),
                  ),

                  ListTile(
                    onTap: () {
                      Navigator.pop(context);
                      showModalBottomSheet(
                        context: context,
                        builder: (_) => Container(
                          padding: const EdgeInsets.all(10),
                          height: 165,
                          width: double.infinity,
                          child: StatefulBuilder(
                            builder: (context, setState) => Column(
                              children: [
                                themeButton(
                                  context,
                                  "اللغة العربية",
                                  lang == 'ar',
                                  () => setState(() => lang = 'ar'),
                                ),
                                themeButton(
                                  context,
                                  'English',
                                  lang == 'en',
                                  () => setState(() => lang = 'en'),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    const Spacer(flex: 1),
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text("cancel"),
                                    ),
                                    const Spacer(flex: 1),
                                    ElevatedButton(
                                      onPressed: () {
                                        context
                                            .read<HomeCubit>()
                                            .setLanguage(languageCode: lang);
                                        Navigator.pop(context);
                                      },
                                      child: const Text(
                                        "confirm",
                                        style: TextStyle(
                                            fontSize: 25, color: Colors.white),
                                      ),
                                    ),
                                    const Spacer(flex: 1),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    leading: const Icon(
                      Icons.language,
                      //color: Colors.blueGrey,
                      size: 33,
                    ),
                    title: Text(S.of(context).language),
                  ),
                  BlocConsumer<HomeCubit, HomeState>(
                    listener: (context, state) {
                      switch (state.logOutState) {
                        case MyStatus.initial:
                          // TODO: Handle this case.
                          break;
                        case MyStatus.loading:
                          ShowToast(
                              stute: ToustStute.WORNNING,
                              text: "برجاء الانتظار ي معلم ");
                          break;
                        case MyStatus.success:
                          context.read<HomeCubit>().deleteTheme();
                          ShowToast(
                              stute: ToustStute.SUCCESS,
                              text: '..تسجيل الخروج بنجاح');
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ));
                          break;
                        case MyStatus.failure:
                          ShowToast(
                              stute: ToustStute.ERROR,
                              text: 'لم يتمكن من تسجيل الخروج.');
                          break;
                        case MyStatus.error:
                          // TODO: Handle this case.
                          break;
                      }
                    },
                    builder: (context, state) {
                      return ListTile(
                        onTap: () {
                          context.read<HomeCubit>().logOut();
                        },
                        leading: const Icon(
                          Icons.logout,
                         // color: Colors.blueGrey,
                          size: 33,
                        ),
                        title: state.logOutState == MyStatus.loading
                            ? const Center(child: CircularProgressIndicator())
                            : const Text("Log Out"),
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    ),
  );
}
