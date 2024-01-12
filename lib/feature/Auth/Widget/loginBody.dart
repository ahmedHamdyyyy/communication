import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../service/components.dart';
import '../../Home/ui/AllPostsScreen.dart';
import '../../Home/ui/Home.dart';
import '../../../constant/color_constant.dart';
import 'validation.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/auth_state.dart';
import '../ui/register_screen.dart';


Widget loginBody(BuildContext context) {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  return Form(
    key: formKey,
    child: Column(
      children: [
        Text(
          'login',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const SizedBox(height: 25),
        TextFormField(
          controller: emailController,
          validator: (value) =>
              InputValidation.emailValidation(value),
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: " Enter your Email",
            prefixIcon: const Icon(Icons.email_rounded),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        TextFormField(
          validator: (value) =>
              InputValidation.passwordValidation(value),
          controller: passwordController,
          keyboardType: TextInputType.visiblePassword,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.key),
            labelText: " Enter your password",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        BlocProvider.value(
  value: AuthCubit(),
  child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            switch (state.userLogin) {
              case MyStatus.initial:
                break;
              case MyStatus.loading:
                ShowToast(
                    stute: ToustStute.WORNNING,
                    text: ' ...جار تسجيل الدخوووول اصبر');

                break;
              case MyStatus.success:
                ShowToast(
                  stute: ToustStute.SUCCESS,
                  text: "جار تسجيل الدخول بنجاح استمتع ياعم.😉🍁",
                );

                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePostsScreen(),
                    ));
                break;
              case MyStatus.failure:
                break;
              case MyStatus.error:
                break;
            }
          },
          builder: (context, state) {
            return  state.userLogin == MyStatus.loading
                ? const Center(child: CircularProgressIndicator())
                : ElevatedButton(

              onPressed: () async {
                if (!formKey.currentState!.validate()) return;
                context.read<AuthCubit>().login(
                  email:  emailController.text,
                  password:  passwordController.text,
                );
              },
              child: const Text(
                "LOGIN",
                style: TextStyle(
                    fontSize: 25, color: Colors.white),
              ),
            );
          },
        ),
),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Do not have an account ',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>const RegistrationScreen() ,));
              },

              child: Text(
                'Register Now.?',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: custom[0]),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () => ShowToast(text: "لسه ما عملتهوش  😂😂👽", stute: ToustStute.WORNNING),
          child: Text(
            'forget Password.?',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: custom[0],
            ),
          ),
        ),
        const SizedBox(height: 25),
      ],
    ),
  );
}
