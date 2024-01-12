import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../constant/color_constant.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';
import '../models/MessageModel.dart';
import '../widget/AppBarChat.dart';
import '../widget/message.dart';
import '../widget/sendMessage.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key, required this.uId, required this.uIdUser});
  String uIdUser;
  String uId;
  TextEditingController controller = TextEditingController();
  final _controllerScroll = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        context.read<HomeCubit>().getUserData(uIdUser);
        context.read<HomeCubit>().getMyDataFromCach();

        return BlocConsumer<HomeCubit, HomeState>(
            listener: (context, state) {},
            builder: (context, state) {
              return Scaffold(
                appBar: appBarChat(state),
                body: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection(users)
                              .doc(uId)
                              .collection('chats')
                              .doc(uIdUser)
                              .collection('messages')
                              .orderBy('timestamp', descending: true)
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              List<MessageModel> messages =
                                  snapshot.data!.docs.map((doc) {
                                return MessageModel.fromJson(doc.data());
                              }).toList();

                              // Process the retrieved messages
                              return ListView.builder(
                                reverse: true,
                                controller: _controllerScroll,
                                itemCount: messages.length,
                                itemBuilder: (context, index) {
                                  final message = messages[index];
                                  // Display the message in your UI
                                  return message.senderId == uId
                                      ? sendMessageMe(message)
                                      : sendMessageHim(message);
                                },
                              );
                              // Handle the error state
                              // return
                            }

                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              // Handle the loading state
                              return const Center(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircularProgressIndicator(),
                                ],
                              ));
                            }
                            return Text('Error: ${snapshot.error}');
                          },
                        ),
                      ),
                     /* Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              width: 1,
                              color: Colors.lightBlueAccent,
                            ),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  child: TextFormField(
                                    onFieldSubmitted: (value) {
                                      DateTime now = DateTime.now();
                                      context.read<HomeCubit>().sendMessage(
                                            senderId: uId,
                                            receiverId: uIdUser,
                                            text: value,
                                            timestamp: now.toString(),
                                          );
                                      _controllerScroll.animateTo(
                                        _controllerScroll
                                            .position.maxScrollExtent,
                                        duration: const Duration(seconds: 10),
                                        curve: Curves.bounceInOut,
                                      );
                                      controller.clear();
                                    },
                                    controller: controller,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'write your message here...',
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 50,
                                child: MaterialButton(
                                  color: Colors.blueGrey,
                                  minWidth: 1.0,
                                  onPressed: () {
                                    DateTime now = DateTime.now();
                                    context.read<HomeCubit>().sendMessage(
                                          senderId: uId,
                                          receiverId: uIdUser,
                                          text: controller.text,
                                          timestamp: now.toString(),
                                        );
                                    _controllerScroll.animateTo(
                                      _controllerScroll
                                          .position.maxScrollExtent,
                                      duration: const Duration(seconds: 1),
                                      curve: Curves.fastOutSlowIn,
                                    );
                                    controller.clear();
                                  },
                                  child: const Icon(
                                    Icons.send,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),*/
                         sendMessage(
                        controllerScroll: _controllerScroll,
                          uId: uId,
                          context: context,
                          controller: controller,
                          uIdUser: uIdUser),
                    ],
                  ),
                ),
              );
            });
      },
    );
  }
}

/*
Widget sendMessageMe(MessageModel model) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Container(
      // alignment: Alignment.centerLeft,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: const EdgeInsets.only(left: 16, top: 10, bottom: 10, right: 16),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0),
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        color: Color(0xff2B515E),
      ),
      child: Text(
        model.text,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    ),
  );
}

Widget sendMessageHim(MessageModel model) {
  return Align(
    alignment: Alignment.centerRight,
    child: Container(
      //alignment: Alignment.centerLeft,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: const EdgeInsets.only(left: 16, top: 10, bottom: 10, right: 16),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
          bottomRight: Radius.circular(0),
        ),
        color: Colors.deepOrange,
      ),
      child: Text(
        model.text,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    ),
  );}*/
