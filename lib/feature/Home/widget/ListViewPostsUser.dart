import 'package:flutter/material.dart';

import '../../../constant/color_constant.dart';
import '../cubit/home_state.dart';
import '../ui/CommentsScreen.dart';

ListView listViewPostsUser(HomeState state) => ListView.separated(
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
              CircleAvatar(
                radius: 25,
                backgroundImage: state.postsUser[index].image == ""
                    ? const AssetImage(
                  noImages,
                ) as ImageProvider
                    : NetworkImage(
                  state.postsUser[index].image,
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
                      /*  Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  UserDataInfo(uId: state.posts[index].uId),
                            ));*/
                      },
                      child: Text(
                        state.postsUser[index].name,
                        style: const TextStyle(
                            color: Colors.pink,
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      state.postsUser[index].dateTime,
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
                  onPressed: () {}, icon: const Icon(Icons.more_horiz))
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
            state.postsUser[index].text.toString(),
            style: const TextStyle(
              height: 1.2,
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ),
          const SizedBox(
            width: 25,
          ),
          if (state.postsUser[index].postImage != "")
            Padding(
              padding: const EdgeInsetsDirectional.only(
                top: 15,
              ),
              child: Container(
                height: 350,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      state.postsUser[index].postImage,
                    ),
                  ),
                ),
              ),
            ),

          Row(
            children: [
              Expanded(
                child: InkWell(
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Row(
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
                            "0"), // Text(SocialCubit.get(context).likes[index].toString()),
                      ],
                    ),
                  ),
                  onTap: () {},
                ),
              ),
              Expanded(
                child: InkWell(
                  child: const Padding(
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
                        Text("200"),
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
                        backgroundImage: state.myDataModelSocial.image
                            .toString() ==
                            ""
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
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CommentsScreen(
                            name: state.postsUser[index].name,
                            postId: state.postsUser[index].postId,),
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
                onTap: () {
                  // SocialCubit.get(context).LikePost(SocialCubit.get(context).postsId[index]);
                },
              ),
            ],
          ),
        ],
      ),
    ),
  ),
  separatorBuilder: (context, index) => const SizedBox(height: 8),
  itemCount: state.postsUser.length,
);
