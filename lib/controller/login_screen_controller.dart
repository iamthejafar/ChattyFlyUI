
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routers/routers.dart';

class LoginScreenController extends GetxController{
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();


  bool isLoading = false;

  final fireBaseAuth = FirebaseAuth.instance;

  passwordValidator(value){
    if (value!.isEmpty) {
      return 'Please enter a password';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  emailValidator(value){
    if (value!.isEmpty) {
      return 'Please enter an email';
    } else if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  login() async{
    isLoading = true;
    update();
    try{
      if(emailController.text.isNotEmpty&&
          passController.text.isNotEmpty){
        await fireBaseAuth.signInWithEmailAndPassword(
            email: emailController.text.trim().toString(),
            password: passController.text.trim().toString()
        ).then((value) => isLoading = false);
      }
      else{
        Get.snackbar('Error Logging in.', 'Please Enter all fields');
      }
    }
    catch(e){
      Get.snackbar('Error Logging in.', e.toString());
    }
    Get.offAllNamed(Routers.HOMESCREEN);
  }
}