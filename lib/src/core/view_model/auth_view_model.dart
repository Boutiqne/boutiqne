import 'package:boutiqnet/src/core/service/firestore_user.dart';
import 'package:boutiqnet/src/model/address.dart';
import 'package:boutiqnet/src/model/user_model.dart';
import 'package:boutiqnet/src/view/control_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
// import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends GetxController {
  // GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  FirebaseAuth _auth = FirebaseAuth.instance;

  String? phone = '', email = '', password = '', name = '', otp = '';
  String verId = '';
  // User? _user = FirebaseAuth.instance.currentUser;
  // get user => _user;
  bool isLoading = false;
  bool istoVerificate = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  ConfirmationResult? confirmationResult;
  @override
  void onInit() {
    super.onInit();
    // FirebaseAuth.instance.signOut();
  }

  verifyPhone() async {
    isLoading = true;
    update();
    try {
      if (kIsWeb) {
        confirmationResult = await _auth.signInWithPhoneNumber('+222$phone');
        if (confirmationResult?.verificationId != null) {
          verId = confirmationResult?.verificationId ?? '';
          print('code sent');
          isLoading = false;
          istoVerificate = true;
          update();
        } else {
          isLoading = false;

          update();
        }
      } else {
        await auth.verifyPhoneNumber(
            timeout: const Duration(seconds: 120),
            phoneNumber: '+222$phone',
            verificationCompleted: (AuthCredential authCredential) async {
              if (authCredential.token != null) {
                UserCredential userCredential =
                    await auth.signInWithCredential(authCredential);
                await userCredential.user?.updateEmail(email ?? '');
                await userCredential.user?.updatePassword(password ?? '');
                await userCredential.user?.updateDisplayName(name);

                saveUser(UserModel(
                  userId: userCredential.user?.uid,
                  email: email,
                  name: name,
                  pic: userCredential.user?.toString(),
                ));
                Get.off(() => ControlView());
                isLoading = false;
                update();

                print('sign complet ');
                print('sign complet authomatique ');
                Get.back(result: userCredential.user);
              }
            },
            verificationFailed: (authException) {
              isLoading = !isLoading;
              update();
              Get.rawSnackbar(
                messageText: Text(
                  'Une erreur est survenue'.tr,
                  style: TextStyle(color: Colors.red),
                ),
              );
            },
            codeSent: (String id, forceResent) {
              verId = id;
              print('code sent');
              isLoading = !isLoading;
              istoVerificate = true;
              update();
            },
            codeAutoRetrievalTimeout: (id) {
              print('codeAutoRetrievalTimeout $id');
              istoVerificate = false;
              isLoading = false;
              update();
              Get.rawSnackbar(
                messageText: Text(
                  'Une erreur est survenue'.tr,
                  style: const TextStyle(color: Colors.red),
                ),
              );
              verId = id;
            });
      }
    } catch (e) {
      isLoading = !isLoading;
      print(e);
      update();
      Get.rawSnackbar(
        messageText: Text(
          'Une erreur est survenue'.tr,
          style: const TextStyle(color: Colors.red),
        ),
      );
    }
  }

  /////////
  otpVerify() async {
    isLoading = true;
    update();
    try {
      if (kIsWeb) {
        UserCredential? userCredential =
            await confirmationResult?.confirm(otp ?? '');
        if (userCredential?.user != null) {
          await userCredential?.user?.updateEmail(email ?? '');
          await userCredential?.user?.updatePassword(password ?? '');
          await userCredential?.user?.updateDisplayName(name);

          saveUser(UserModel(
            userId: userCredential?.user?.uid,
            email: email,
            name: name,
            pic: userCredential?.user?.toString(),
          ));
          Get.off(() => ControlView());
          isLoading = false;
          update();

          print('sign complet ');

          Get.back(result: userCredential?.user);
        }
      } else {
        UserCredential? userCredential = await auth.signInWithCredential(
            PhoneAuthProvider.credential(
                verificationId: verId, smsCode: otp ?? ''));
        if (userCredential.user != null) {
          await userCredential.user?.updateEmail(email ?? '');
          await userCredential.user?.updatePassword(password ?? '');
          await userCredential.user?.updateDisplayName(name);

          saveUser(UserModel(
            userId: userCredential.user?.uid,
            email: email,
            name: name,
            phone: phone,
            address: Address(
                address: GeoPoint(12, 12), city: 'Nouakchott', moukata: 'Ksar'),
          ));

          Get.off(() => ControlView());
          isLoading = false;
          update();

          print('sign complet ');
        }
      }
    } on FirebaseAuthException catch (e) {
      istoVerificate = false;
      if (e.code == 'account-exists-with-different-credential') {
        AuthCredential? pendingCredential = e.credential;
        String? phone = e.phoneNumber;
        isLoading = false;
        print('------$phone-------$pendingCredential--------');
        print(e.message);
      } else if (e.code == 'invalid-verification-code') {
        print('error ${e.code}');
        isLoading = false;
        update();
        Get.rawSnackbar(
            messageText: Text(
          'votre code OTP est incorrect.'.tr,
          style: TextStyle(color: Colors.red),
        ));
      }
      if (e.code == 'email-already-in-use') {
        print('error ${e.code}');
        isLoading = !isLoading;
        update();
        Get.rawSnackbar(
            messageText: Text(
          'Cette adresse email est déjà utilisée.'.tr,
          style: TextStyle(color: Colors.red),
        ));
      } else if (e.code == 'invalid-email') {
        print('error ${e.code}');

        isLoading = !isLoading;
        update();
        Get.rawSnackbar(
            messageText: Text(
          'Cette adresse email est invalide.'.tr,
          style: TextStyle(color: Colors.red),
        ));
      } else if (e.code == 'invalid-verification-code') {
        print('error ${e.code}');
        isLoading = !isLoading;
        update();
        Get.rawSnackbar(
            messageText: Text(
          'votre code OTP est incorrect.'.tr,
          style: TextStyle(color: Colors.red),
        ));
      } else if (e.code == 'weak-password') {
        print('error ${e.code}');
        isLoading = !isLoading;
        update();
        Get.rawSnackbar(
            messageText: Text(
          'Le mot de passe doit contenir au moins 6 caractères.'.tr,
          style: TextStyle(color: Colors.red),
        ));
      } else {
        isLoading = false;
        print('error ${e.code}');
        update();
        Get.rawSnackbar(
            messageText: Text(
          'Une erreur est survenue'.tr,
          style: TextStyle(color: Colors.red),
        ));
      }
    }

    // Handle other OAuth providers...
  }

  // sign in with phone number and password
  signIn() async {
    isLoading = true;
    update();

    try {
      UserCredential? userCredential = await auth.signInWithEmailAndPassword(
          email: email ?? '', password: password ?? '');
      if (userCredential.user != null) {
        isLoading = false;
        update();
        User? user = userCredential.user;

        Get.off(() => ControlView());
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'account-exists-with-different-credential') {
        AuthCredential? pendingCredential = e.credential;
        String? phone = e.phoneNumber;
        isLoading = false;
        print('------$phone-------$pendingCredential--------');
        print(e.message);
      } else if (e.code == 'invalid-verification-code') {
        print('error ${e.code}');
        isLoading = false;
        update();
        Get.rawSnackbar(
            messageText: Text(
          'votre code OTP est incorrect.'.tr,
          style: TextStyle(color: Colors.red),
        ));
      } else if (e.code == 'wrong-password') {
        isLoading = false;
        update();
        Get.rawSnackbar(
            messageText: Text(
          'votre mot de passe est incorrect.'.tr,
          style: TextStyle(color: Colors.red),
        ));
      } else {
        isLoading = false;
        print('error ${e.code}');
        update();
        Get.rawSnackbar(
            messageText: Text(
          'Une erreur est survenue'.tr,
          style: TextStyle(color: Colors.red),
        ));
      }
    }
  }

  // save user to firebase
  Future<void> saveUser(UserModel user) async {
    await FireStoreUser().addUserToFireStore(user);
  }
}
