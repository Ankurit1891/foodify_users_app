import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../global/global.dart';
import '../mainScreens/home_screen.dart';
import '../widgets/custom_text.dart';
import '../widgets/error_dialog.dart';
import '../widgets/loading_dialog.dart';
import 'auth_screen.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  formValidation()
  {
    if(emailController.text.isNotEmpty && passwordController.text.isNotEmpty)
      {
        loginNow();
      }
    else
      {
        showDialog(context: context, builder: (c){
            return ErrorDialog(
              message: "Please write email/password.",
            );
          }
         );
      }
  }

  loginNow()async
  {
      showDialog(context: context, builder: (c){
        return const LoadingDialog(
          message: "Checking Credentials",
        );
      });

      User? currentUser;
      await firebaseAuth.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim()).then((auth) {
            currentUser=auth.user!;
      }).catchError((error){
        Navigator.pop(context);
        showDialog(context: context, builder: (c){
            return ErrorDialog(
          message: error.message.toString(),
          );
        }
        );
      });
      if(currentUser!=null)
        {
              readDataAndSetDataLocally(currentUser!);
        }
  }

  Future readDataAndSetDataLocally(User currentUser)async
  {
      await FirebaseFirestore.instance.collection("users")
          .doc(currentUser.uid)
          .get().then((snapShot) async{
            if(snapShot.exists) {
              await sharedPreferences!.setString("uid", currentUser.uid);
              await sharedPreferences!.setString(
                  "email", snapShot.data()!["userEmail"]);
              await sharedPreferences!.setString(
                  "name", snapShot.data()!["userName"]);
              await sharedPreferences!.setString(
                  "photoUrl", snapShot.data()!["userAvatarUrl"]);

              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomeScreen()));
            }
            else
              {
                firebaseAuth.signOut();
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const AuthScreen()));
                showDialog(context: context, builder: (c){
                  return ErrorDialog(
                    message: "Account doesn't exist",
                  );
                });
              }
      });
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (OverscrollIndicatorNotification overscroll) {
        overscroll.disallowIndicator();
        return true;
      },
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Image.asset(
                  "images/login.png",
                  height: 270,
                ),
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextField(
                    data: Icons.email,
                    controller: emailController,
                    hintText: "Email",
                    isObscure: false,
                  ),
                  CustomTextField(
                    data: Icons.lock,
                    controller: passwordController,
                    hintText: "Password",
                    isObscure: true,
                  ),
                ],
              ),
            ),
            // ignore: avoid_print
            ElevatedButton(
              onPressed: (){
                formValidation();
              },
              child: const Text(
                "Login",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.cyan,
                padding: const EdgeInsets.symmetric(
                  horizontal: 50,vertical: 10
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
