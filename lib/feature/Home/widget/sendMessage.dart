import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/home_cubit.dart';

Widget sendMessage({
  required TextEditingController controller,
  required String uId,
  required String uIdUser,
  required BuildContext context,
  required ScrollController controllerScroll,
}) {
  return Padding(
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
                  controllerScroll.animateTo(
                    0,
                    duration: const Duration(milliseconds: 900),
                    curve: Curves.easeIn,
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
                controllerScroll.animateTo(
                  0,
                  duration: const Duration(milliseconds: 900),
                  curve: Curves.bounceInOut,
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
  );
}
