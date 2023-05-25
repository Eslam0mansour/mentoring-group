import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/core/BlocObserver.dart';
import 'package:untitled1/core/staets.dart';
import 'package:untitled1/home.dart';
import 'package:untitled1/signIn.dart';
import 'package:untitled1/signup.dart';

import 'core/cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();

  await Firebase.initializeApp();
  runApp(BlocProvider<AppCubit>(
    create: (context) => AppCubit()..initAndCheck(),
    child: MyApp.create(),
  ));
}

final _navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static Widget create() {
    return BlocListener<AppCubit, AppState>(
      listener: (context, state) {
        if (state is GetUserDataDoneState) {
          Future.delayed(const Duration(seconds: 1), () {
            _navigatorKey.currentState?.pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) {
              return const Home();
            }), (r) => false);
          });
        }
        if (state is NotHaveCurrentUser) {
          Future.delayed(const Duration(seconds: 1), () {
            _navigatorKey.currentState?.pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) {
              return SignUp();
            }), (r) => false);
          });
        }
      },
      child: const MyApp(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      navigatorKey: _navigatorKey,
      home: Splash(),
    );
  }
}

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/img.png',
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
