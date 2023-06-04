import 'package:chattyfly/view/screens/auth/login_screen.dart';
import 'package:chattyfly/view/screens/auth/register_screen.dart';
import 'package:chattyfly/view/screens/complete_profile_screen.dart';
import 'package:chattyfly/view/screens/home_screen.dart';
import 'package:chattyfly/view/screens/splash_screen.dart';
import 'package:chattyfly/view/screens/welcome_screen.dart';
import 'package:get/get.dart';

import '../view/screens/add_user_screen.dart';
import '../view/screens/chat_screen.dart';

class Routers extends GetxController{
  static List<GetPage> pages = [
    GetPage(name: HOMESCREEN, page: ()=> HomeScreen()),
    GetPage(name: CHATSCREEN, page: ()=> ChatScreen()),
    GetPage(name: CHATSCREEN, page: ()=> WelcomeScreen()),
    GetPage(name: LOGINSCREEN, page: ()=> LoginScreen()),
    GetPage(name: REGISTERSCREEN, page: ()=> RegisterScreen()),
    GetPage(name: SPLASHSCREEN, page: ()=> SplashScreen()),
    GetPage(name: COMPLETEPROFILESCREEN, page: ()=> CompleteProfileScreen()),
    GetPage(name: ADDUSERSCREEN, page: ()=> AddUserScreen()),
  ];

  static const String CHATSCREEN = '/CHATSCREEN';
  static const String HOMESCREEN = '/HOMESCREEN';
  static const String WELCOMESCREEN = '/WELCOMESCREEN';
  static const String LOGINSCREEN = '/LOGINSCREEN';
  static const String REGISTERSCREEN = '/REGISTERSCREEN';
  static const String COMPLETEPROFILESCREEN = '/COMPLETEPROFILESCREEN';
  static const String SPLASHSCREEN = '/SPLASHSCREEN';
  static const String ADDUSERSCREEN = '/ADDUSERSCREEN';
}

