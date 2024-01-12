import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../constant/color_constant.dart';

import 'UserDataInfo.dart';

class AllOfUser extends StatefulWidget {
  const AllOfUser({Key? key}) : super(key: key);

  @override
  State<AllOfUser> createState() => _AllOfUserState();
}

class _AllOfUserState extends State<AllOfUser> {
  TextEditingController searchName = TextEditingController();
  String name = "";
  bool isShow=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          controller: searchName,
          onChanged: (value) {
            setState(() {
              name = value;
            });
          },
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection(users)
            .orderBy("name")
            .startAt([name]).endAt(["$name\uf8ff"]).snapshots(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading");
          }
          return ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              var data = snapshot.data!.docs[index];
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserDataInfo(uId: data["uId"]),
                        ));
                  },
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundImage: data["image"] == ""
                            ? const AssetImage(
                                noImages,
                              ) as ImageProvider
                            : NetworkImage(
                                data["image"],
                              ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {

                        },
                        child: Text(
                          data["name"],
                          style: const TextStyle(
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                height: 1,
                color: Colors.grey[300],
              ),
            ),
            itemCount: snapshot.data!.docs.length,
          );
        },
      ),
    );
  }
}
