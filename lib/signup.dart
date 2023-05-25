import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled1/core/cubit.dart';
import 'package:untitled1/core/staets.dart';
import 'package:untitled1/home.dart';
import 'package:untitled1/widgets/my_form_field.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        if (state is SignUpErrorState) {
          Fluttertoast.showToast(
            msg: state.error,
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.pink,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage(
                'assets/img_3.png',
              ),
              alignment: Alignment.topCenter,
            )),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 50),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Sign Up',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    MyFormField(
                      hint: 'email',
                      controller: emailC,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'email must not be empty';
                        }
                      },
                    ),
                    MyFormField(
                      hint: 'password',
                      controller: passwordC,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'password must not be empty';
                        }
                        else if (value.length < 6 )
                          {
                            return 'password must be 6';
                          }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          textStyle: const TextStyle(fontSize: 20)),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          AppCubit.get(context).signUp(
                              email: emailC.text, password: passwordC.text);
                        }
                      },
                      child: const Text(
                        'SignUp',
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
