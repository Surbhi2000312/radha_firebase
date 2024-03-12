import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:radha_firebase/main.dart';
import 'package:radha_firebase/uihelper.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController= TextEditingController();
  TextEditingController passController= TextEditingController();
  signUp(String email,String password) async {
    if(email=="" && password=="") {
      Uihelper.CustomAlertBox(context, "Enter Required fields");
    }
    else{
      UserCredential? userCredential;
      try{
        userCredential=await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password).then((value) {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage(title: "My Home Page")));
        } );

      }
      on FirebaseAuthException catch(ex){
        return Uihelper.CustomAlertBox(context, ex.code.toString());
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Page'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Uihelper.CustomTextField(emailController, "Email", Icons.mail, false),
          Uihelper.CustomTextField(passController, "Password", Icons.password, true),
          SizedBox(height: 30,),
          Uihelper.CustomButton(() { 
            signUp(emailController.text.toString(), passController.text.toString());
          }, "Sign Up")
        ],
      ),

    );
  }
}
