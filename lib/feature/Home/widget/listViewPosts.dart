import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:communication/service/components.dart';
import '../../../constant/color_constant.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';
import '../ui/CommentsScreen.dart';
import '../ui/UserDataInfo.dart';

Widget listViewPosts(HomeState state, BuildContext context) {
  final post = state.posts;

  return ListView.separated(
    physics: const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    primary: false,
    itemBuilder: (context, index) => Card(
      elevation: 5,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    print("object");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              UserDataInfo(uId: state.posts[index].uId),
                        ));
                  },
                  child: CircleAvatar(
                    radius: 25,
                    backgroundImage: state.posts[index].image == ""
                        ? const AssetImage(
                            noImages,
                          ) as ImageProvider
                        : NetworkImage(
                            state.posts[index].image,
                          ),
                  ),
                ),
                const SizedBox(
                  width: 18,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    UserDataInfo(uId: state.posts[index].uId),
                              ));
                        },
                        child: Text(
                          state.posts[index].name.toString(),
                          style: const TextStyle(
                              color: Colors.pink,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        state.posts[index].dateTime.toString(),
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                IconButton(
                    onPressed: () {

                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    )),


              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 15,
              ),
              child: Container(
                height: 1,
                width: double.infinity,
                color: Colors.grey[300],
              ),
            ),
            Text(
              state.posts[index].text.toString(),
              style: const TextStyle(
                height: 1.2,
                fontWeight: FontWeight.w700,
                fontSize: 14,
              ),
            ),
            const SizedBox(
              width: 25,
            ),
            if (state.posts[index].postImage != "")
              Padding(
                padding: const EdgeInsetsDirectional.only(),
                child: Container(
                  height: 350,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        state.posts[index].postImage.toString(),
                      ),
                    ),
                  ),
                ),
              ),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.favorite_border,
                            color: Colors.red,
                            size: 20,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(post[index]
                              .likes
                              .length
                              .toString()), // Text(SocialCubit.get(context).likes[index].toString()),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    child:  Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.messenger_outline_sharp,
                            color: Colors.amber,
                            size: 20,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text("100"),
                          SizedBox(
                            width: 5,
                          ),
                          Text("comment"),
                        ],
                      ),
                    ),
                    onTap: () {},
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Container(
                height: 1,
                width: double.infinity,
                color: Colors.grey[300],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 15,
                          backgroundImage:
                              state.myDataModelSocial.image.toString() == ""
                                  ? const AssetImage(noImages) as ImageProvider
                                  : NetworkImage(
                                      state.myDataModelSocial.image.toString(),
                                    ),
                        ),
                        const SizedBox(
                          width: 18,
                        ),
                        const Text(
                          "Write a comment...",

                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CommentsScreen(
                              postId: state.posts[index].postId,
                              name: state.posts[index].name,
                            ),
                          ));
                    },
                  ),
                ),
                InkWell(
                  child: const Row(
                    children: [
                      Icon(
                        Icons.favorite_border,
                        color: Colors.red,
                        size: 20,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        "Like",
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    ),
    separatorBuilder: (context, index) => const SizedBox(height: 8),
    itemCount: state.posts.length,
  );
}
