import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../service/components.dart';
import 'validation.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/auth_state.dart';
import '../models/UserModel.dart';
import '../ui/login_screen.dart';

Widget registerBody(BuildContext context) {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  DateTime birthDate = DateTime(2000);
  return Form(
    key: formKey,
    child: Column(
      children: [
        Text(
          'Registration',
          style: Theme.of(context).textTheme.headlineLarge,
        ),

        const SizedBox(
          height: 30,
        ),
        TextFormField(
          validator: (value) =>
              InputValidation.nameValidation(value),
          controller: nameController,
          keyboardType: TextInputType.name,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.person),
            labelText: " Enter your name",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        TextFormField(
          validator: (value) =>
              InputValidation.phoneValidation(value),
          controller: phoneController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.phone),
            labelText: " Enter your phone",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
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
          height: 10,
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

        StatefulBuilder(
          builder: (BuildContext context, setState) => TextButton(
            onPressed: () => showDatePicker(
              context: context,
              initialDate: birthDate,
              firstDate: DateTime(1950),
              lastDate: DateTime.now(),
            ).then((date) => setState(() => birthDate = date!)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${birthDate.year} / ${birthDate.month} / ${birthDate.day}',
                ),
                const Icon(Icons.date_range)
              ],
            ),
          ),
        ),
        //RegisterCallBack(email: emailController),
        BlocProvider.value(
          value: AuthCubit(),
  child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            switch (state.userRegestStat) {
              case MyStatus.initial:
                break;
              case MyStatus.loading:
                ShowToast(
                    stute: ToustStute.WORNNING,
                    text: "جار تسجيل الدخول اصبر...");
                break;
              case MyStatus.success:
                ShowToast(
                    stute: ToustStute.SUCCESS,
                    text: state.message);

                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ));

                break;
              case MyStatus.failure:
                ShowToast(
                    stute: ToustStute.ERROR,
                    text: state.message);
                break;
              case MyStatus.error:

                break;
            }
          },
          builder: (context, state) {
            return   state.userRegestStat == MyStatus.loading
                ? const Center(child: CircularProgressIndicator())
                : ElevatedButton(

              onPressed: () async {
                if (!formKey.currentState!.validate()) return;
                context.read<AuthCubit>().registerUser(
                 userModelSocial:UserModelSocial(
                   name: nameController.text,

                   bio: "",
                   
                   cover: "",
                   password:passwordController.text ,
                   email: emailController.text,
                   phone: phoneController.text,
                   image: state.imagePath,
                   birthDate: '${birthDate.year} / '
                       '${birthDate.month} / ${birthDate.day}',),

                );  },
              child:  const Text(
            "REGEST",
            style: TextStyle(
            fontSize: 25, color: Colors.white),
            ),
            );
          },
        ),
),
        const SizedBox(height: 15),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              const Text(
                "I have an account",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black54,
                ),
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ));
                },
                child: const Text(
                  "Login",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}