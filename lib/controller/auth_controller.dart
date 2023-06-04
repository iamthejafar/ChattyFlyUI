import 'package:chattyfly/routers/routers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';



class AuthController extends GetxController{
  static AuthController instance = Get.find();
  User get user => _user.value!;
  late Rx<User?> _user;

  final firebaseAuth = FirebaseAuth.instance;


  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(firebaseAuth.currentUser);
    _user.bindStream(firebaseAuth.authStateChanges());
    ever(_user,_setInitialScreen);
  }

  _setInitialScreen(User? user){
    if(user==null){
      Get.offAndToNamed(Routers.LOGINSCREEN);
    }
    else{
      Get.offAndToNamed(Routers.HOMESCREEN);
    }
  }
}