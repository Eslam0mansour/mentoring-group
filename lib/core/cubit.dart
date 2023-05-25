// ignore_for_file: avoid_print
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/core/staets.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(IntiAppState());

  static AppCubit get(context) => BlocProvider.of(context);

  FirebaseAuth auth = FirebaseAuth.instance;

  User? user;

  bool _isDark = false ;

  bool get isDark => _isDark;

  String? userEmail ;

  void changeThemeMode( context) {
    _isDark = !_isDark;
    emit(ChangeThemeModeState());
  }

  Future<void> initAndCheck() async {
    await Future.delayed(const Duration(seconds: 1));
    user = auth.currentUser;
    if (user != null) {
      userEmail = user!.email;
      emit(GetUserDataDoneState());
    } else {
      emit(NotHaveCurrentUser());
    }
  }

  void signOut() {
    emit(SignOutLoadingState());
    auth.signOut().then((value) {
      emit(NotHaveCurrentUser());
    }).catchError((error) {
      emit(SignOutErrorState(error.toString()));
    });
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    try {
      emit(SignInLoadingState());

      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        emit(SignInDoneState());
        initAndCheck();
      }

    } on FirebaseAuthException catch (e) {
      emit(SignInErrorState(getMessageFromErrorCode(e.code)));
    }
  }

  Future<void> signUp({
    required String email,
    required String password,
  }) async {
    try {
      emit(SignUpLoadingState());
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user != null) {
        emit(SignUpDoneState());
        initAndCheck();
      }
    } on FirebaseAuthException catch (e) {
      print('error code is ${e.code}***************************');
      emit(SignUpErrorState(getMessageFromErrorCode(e.code)));
    }
  }

  String getMessageFromErrorCode(
    String errorCode,
  ) {
    switch (errorCode) {
      case "ERROR_EMAIL_ALREADY_IN_USE":
      case "account-exists-with-different-credential":
      case "email-already-in-use":
        return "Email already used. Go to login page.";
      case "ERROR_WRONG_PASSWORD":
      case "wrong-password":
        return "Wrong email/password combination.";
      case "ERROR_USER_NOT_FOUND":
      case "user-not-found":
        return "No user found with this email.";
      case "ERROR_USER_DISABLED":
      case "user-disabled":
        return "User disabled.";
      case "ERROR_TOO_MANY_REQUESTS":
      case "operation-not-allowed":
        return "Too many requests to log into this account.";
      case "ERROR_OPERATION_NOT_ALLOWED":
        return "Server error, please try again later.";
      case "ERROR_INVALID_EMAIL":
      case "invalid-email":
        return "Email address is invalid.";
      default:
        return errorCode;
    }
  }
}
