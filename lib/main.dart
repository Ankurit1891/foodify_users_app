import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:foodify_user_app/authentication/auth_screen.dart';
import 'package:foodify_user_app/splash_screen/splashScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'global/global.dart';

void main()async {
  runApp(const MyApp());
  sharedPreferences = await SharedPreferences.getInstance();
  await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MySplashScreen(),
    );
  }
}
