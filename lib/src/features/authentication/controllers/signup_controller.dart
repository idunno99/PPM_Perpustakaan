import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
// import 'package:perpustakaan/src/repository/authentication_repository/authentication_repository.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  final fullname = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final confrimpassword = TextEditingController();
  
  void registerUser (String email, String password) {
    // AuthenticationRepository.instance.createUserWithEmailAndPassword(email, password);
  }
}