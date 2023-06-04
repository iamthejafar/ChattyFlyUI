import 'dart:io';

import 'package:chattyfly/constants.dart';
import 'package:chattyfly/model/user_model.dart';
import 'package:chattyfly/routers/routers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';


class CompleteProfileScreenController extends GetxController {

  bool isLoading = false;

  File? imageFile;

  void showphotooption(BuildContext context) {
    showDialog(context: context, builder: (context) {
      return AlertDialog(
        backgroundColor: AppColor.kBlackLightColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(2.h))),
        title: Text('Upload Profile Pic', style: AppTextStyle.k20pxWhite600,),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              onTap: () async {
                Navigator.pop(context);
                selectImage(ImageSource.gallery);
              },
              leading: Icon(
                Icons.photo_album, color: AppColor.kGreyLightColor,),
              title: Text('Gallery', style: AppTextStyle.k14pxLightGrey600,),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                selectImage(ImageSource.camera);
              },
              leading: Icon(Icons.camera_alt, color: AppColor.kGreyLightColor,),
              title: Text('Camera', style: AppTextStyle.k14pxLightGrey600,),
            )
          ],
        ),
      );
    });
  }

  void selectImage(ImageSource source) async {
    XFile ? pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      final File fileImage = File(pickedFile.path);
      imageFile = fileImage;
      update();
      // cropImage(pickedFile);
    }
  }

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController statusController = TextEditingController();

  firstNameValidator(value) {
    if (value!.isEmpty) {
      return 'First name is required*';
    }
    return null;
  }

  lastNameValidator(value) {
    if (value!.isEmpty) {
      return 'Last name is required*';
    }
    return null;
  }

  statusValidator(value) {
    if (value!.isEmpty) {
      return 'Status is required*';
    }
    return null;
  }

  Future<void> addUserToFirebase() async {
    isLoading = true;
    update();
    // Create a Firebase Storage reference for the profile picture file
    try {
      final fireBaseAuth = FirebaseAuth.instance;
      final uid = await fireBaseAuth.currentUser!.uid;
      final storageRef =
      FirebaseStorage.instance.ref('profilepic').child('$uid.jpg');

      // Upload the file to Firebase Storage
      final UploadTask uploadTask = storageRef.putFile(imageFile!);
      final downloadUrl = await uploadTask;
      final String profilePicUrl = (await downloadUrl.ref.getDownloadURL());

      // Create a new user object with the given properties
      final UserModel newUser = UserModel(
          firstname: firstNameController.text.trim().toString(),
          lastname: lastNameController.text.trim().toString(),
          status: statusController.text.trim().toString(),
          uid: uid,
          profilepic: profilePicUrl
      );

      // Add the new user to Firebase Firestore
      await FirebaseFirestore.instance.collection('users').add(
          newUser.toJson());
    }
    catch (e) {
      Get.snackbar('Error', e.toString());
    }
    isLoading = false;
    Get.toNamed(Routers.HOMESCREEN);
  }
}