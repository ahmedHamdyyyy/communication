import 'dart:ffi';

import 'package:communication/feature/Auth/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constant/color_constant.dart';
import '../Widget/loginBody.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        body: Align(
          alignment: Alignment.bottomCenter,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 55),
                Image.asset(logoImage, height: 222, width: 222),
                Align(
                  alignment: AlignmentDirectional.bottomCenter,
                  child: Container(
                    padding: const EdgeInsets.only(
                        left: 15, right: 15, top: 15, bottom: 5),
                    margin: const EdgeInsets.only(left: 15, right: 15, top: 15),
                    decoration: BoxDecoration(
                      color: foreGround[0],
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35),
                      ),
                    ),
                    child: BlocProvider.value(
                     value: AuthCubit(),
                      child: loginBody(context),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
