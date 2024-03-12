import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:radha_firebase/loginpage.dart';
import 'package:radha_firebase/main.dart';

class CheckUser extends StatefulWidget {
  const CheckUser({super.key});

  @override
  State<CheckUser> createState() => _CheckUserState();
}

class _CheckUserState extends State<CheckUser> {

  @override
  Widget build(BuildContext context) {
    return checkuser();
  }
  checkuser(){
    final user = FirebaseAuth.instance.currentUser;
    if(user!=null){
      return MyHomePage(title: "My home Page");
    }
    else{
      return LoginPage();
    }
  }
}
