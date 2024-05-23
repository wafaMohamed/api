import 'package:api_2/cubit/user_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  //Sign in Form key
  GlobalKey<FormState> signInFormKey = GlobalKey();

  //Sign in email
  TextEditingController signInEmail = TextEditingController();

  //Sign in password
  TextEditingController signInPassword = TextEditingController();

  //Sign Up Form key
  GlobalKey<FormState> signUpFormKey = GlobalKey();

  //Profile Pic
  XFile? profilePic;

  //Sign up name
  TextEditingController signUpName = TextEditingController();

  //Sign up phone number
  TextEditingController signUpPhoneNumber = TextEditingController();

  //Sign up email
  TextEditingController signUpEmail = TextEditingController();

  //Sign up password
  TextEditingController signUpPassword = TextEditingController();

  //Sign up confirm password
  TextEditingController confirmPassword = TextEditingController();

  Future<void> signIn() async {
    try {
      emit(SignInLoading());
      final response = await Dio().post(
        'https://food-api-omega.vercel.app/api/v1/user/signin',
        data: {"email": signInEmail.text, "password": signInPassword.text},
      );
      emit(SignInSuccess());

      print(response);
    } catch (error) {
      emit(SignInFailure(errorMessage: error.toString()));
      print("/////////Error: ${error.toString()}");
    }
  }
}
