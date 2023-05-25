import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/core/cubit.dart';
import 'package:untitled1/core/staets.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset('assets/img_2.png'),
                Text(
                  AppCubit.get(context).userEmail!,
                  style: const TextStyle(
                    fontSize: 30
                  ),
                ),
                 const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: (){
                      AppCubit.get(context).signOut();
                    },
                    child:const Text('sign out')
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
