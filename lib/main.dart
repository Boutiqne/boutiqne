import 'package:boutiqnet/firebase_options.dart';
import 'package:boutiqnet/src/helper/binding.dart';
import 'package:boutiqnet/src/helper/lang/traslation.dart';

import 'package:boutiqnet/src/view/splash/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
//  await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      // initialBinding: Binding(),
      translations: Translation(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('fr'),
      defaultTransition: Transition.cupertino,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'SourceSans',
        primaryColor: const Color.fromRGBO(63, 81, 181, 1),
      ),
      home: SplashScreen(),
    );
  }
}
