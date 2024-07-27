// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marckit/fetchars/page_user/model/user_model.dart';
import 'package:marckit/fetchars/page_user/sign_in/view/sign_in_view.dart';

import '../../../core/constants/app_strings.dart';
import '../../../core/utils/my_aleart_dialog.dart';

class AuthCrl extends GetxController {
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  ///----User Model
  UserModel userModel = UserModel(
    id: '',
    email: '',
    password: '',
    username: '',
    cpassword: '',
    isAdmin: false,
  );

  void setEmail(String newVal) {
    userModel.email = newVal;
    update();
  }

  void setName(String newVal) {
    userModel.username = newVal;
    update();
  }

  void setPassword(String newVal) {
    userModel.password = newVal;
    update();
  }

  void setCPassword(String newVal) {
    userModel.cpassword = newVal;
    update();
  }

  bool isLoading = false;
  void setIsLoading(bool newVal) {
    isLoading = newVal;
    update();
  }

  bool isVisable = true;
  void setIsVisable() {
    isVisable = !isVisable;
    update();
  }

  void clearData() {
    userModel = UserModel(
      id: '',
      email: '',
      password: '',
      username: '',
      cpassword: '',
      isAdmin: false,
    );

    update();
  }

  Future<void> signUp(BuildContext context) async {
    FocusScope.of(context).unfocus();
    signupFormKey.currentState!.save();

    final bool isValid = signupFormKey.currentState!.validate();

    try {
      if (!userModel.email.isEmail) {
        myAleartDialog(context, text: 'Please enter a valid email');
      } else if (userModel.username.isEmpty) {
        myAleartDialog(context, text: 'Please enter your name');
      } else if (userModel.password.length <= 6 &&
          userModel.cpassword.length <= 6) {
        myAleartDialog(context, text: 'Password must be 6 characters at least');
      } else if (userModel.password != userModel.cpassword) {
        myAleartDialog(context, text: 'Passwords do not match');
      } else if (isValid) {
        setIsLoading(true);
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
          email: userModel.email,
          password: userModel.password,
        )
            .then((UserCredential userCedential) {
          userModel.id = userCedential.user!.uid;

          DocumentReference ref = FirebaseFirestore.instance
              .collection(AppStrings.users)
              .doc(userCedential.user!.uid);

          ref.set(userModel.toMap()).then((val) {
            log('OK');
          });
          Route route = MaterialPageRoute(builder: (_) => const SignInView());

          Navigator.pushReplacement(context, route);

          setIsLoading(false);
        });
      }
    } on FirebaseAuthException catch (e) {
      setIsLoading(false);
      log(e.toString());

      if (e.code == 'weak-password') {
        myAleartDialog(context, text: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        myAleartDialog(context,
            text: 'The account already exists for that email.');
      } else if (e.code == 'invalid-email') {
        myAleartDialog(context, text: 'The email address is badly formatted.');
      } else {
        log(e.toString());
      }
    }
  }

  Future<void> logIn(BuildContext context) async {
    FocusScope.of(context).unfocus();
    loginFormKey.currentState!.save();

    final bool isValid = loginFormKey.currentState!.validate();

    try {
      if (!userModel.email.isEmail) {
        myAleartDialog(context, text: 'Please enter a valid email');
      } else if (userModel.password.length <= 6) {
        myAleartDialog(context,
            text: 'Passwords must be 6 characters at least');
      } else if (isValid) {
        setIsLoading(true);

        await FirebaseAuth.instance
            .signInWithEmailAndPassword(
          email: userModel.email,
          password: userModel.password,
        )
            .then((UserCredential userCedential) async {
          // QuerySnapshot<Map<String, dynamic>> getData = await FirebaseFirestore
          //     .instance
          //     .collection(AppStrings.users)
          //     .where('id', isEqualTo: userCedential.user!.uid);

          // if (userModel.isAdmin) {
          //   Get.to(() => const AdminView());
          // } else {
          //   Get.to(() => const CustomCurvedNavigationBar());
          // }

          // Route route = MaterialPageRoute(
          //     builder: (_) => const CustomCurvedNavigationBar());

          // Navigator.pushReplacement(context, route);

          setIsLoading(false);
        });
      }
    } on FirebaseAuthException catch (e) {
      myAleartDialog(context, text: e.toString());
      setIsLoading(false);
      log(e.toString());

      if (e.code == 'weak-password') {
        myAleartDialog(context, text: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        myAleartDialog(context,
            text: 'The account already exists for that email.');
      } else if (e.code == 'invalid-email') {
        myAleartDialog(context, text: 'The email address is badly formatted.');
      } else {
        log(e.toString());
      }
    }
  }

  Future<void> signOut() async {}
}
