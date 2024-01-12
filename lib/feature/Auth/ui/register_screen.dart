import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constant/color_constant.dart';
import '../Widget/registerBody.dart';
import '../Widget/registerImage.dart';
import '../cubit/auth_cubit.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<AuthCubit>().initRegister;
    return Scaffold(
      body: SafeArea(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: SingleChildScrollView(
            child: Column(
              children: [
                registerImage(context),
                Align(
                  alignment: AlignmentDirectional.bottomCenter,
                  child: Container(
                    margin: const EdgeInsets.only(left: 15, right: 15),
                    decoration: BoxDecoration(
                      color: foreGround[0],
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35),
                      ),
                    ),
                    padding: const EdgeInsets.only(
                        left: 15, right: 15, top: 15, bottom: 5),
                    child: registerBody(context),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
