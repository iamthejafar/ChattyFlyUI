import 'package:chattyfly/routers/routers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreenController extends GetxController{
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  bool isLoading = false;

  final fireBaseAuth = FirebaseAuth.instance;


  String? passwordValidator(String? value){
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

  confirmPassValidator(value){
    if (value!.isEmpty) {
      return 'Password does not match.';
    } else if (passController.text != confirmPassController.text) {
      return 'Password does not match.';
    }
    return null;
  }

  signUp() async{
    isLoading = true;
    update();
    final UserCredential userCredential;
    try{
      if(emailController.text.isNotEmpty&&
          passController.text.isNotEmpty){
        userCredential = await fireBaseAuth.createUserWithEmailAndPassword(
            email: emailController.text.trim().toString(),
            password: passController.text.trim().toString()
        );
        isLoading = false;
        if(!userCredential.isBlank!){
          Get.offAllNamed(Routers.COMPLETEPROFILESCREEN);
        }
      }
      else{
        Get.snackbar('Error Logging in.', 'Please Enter all fields');
      }
    }
    catch(e){
      Get.snackbar('Error Logging in.', e.toString());
    }

  }

}