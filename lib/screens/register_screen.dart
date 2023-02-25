import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:p1/conponents/input_field.dart';
import 'package:p1/conponents/rounded_button.dart';
import 'package:p1/screens/home_screen.dart';
import 'package:p1/screens/login_screen.dart';

import '../utils/utility.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final nameController = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Image(
              image: AssetImage('assets/images/register.png'),
              height: 220,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Register',
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 32,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'Create new account',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            InputField(
              controller: nameController,
              text: 'Name',
              icon: Icon(Icons.person),
            ),
            InputField(
              controller: emailController,
              text: 'Email',
              icon: Icon(Icons.mail),
            ),
            InputField(controller: passController,
              text: 'Password',
              icon: Icon(Icons.lock),
            ),
            SizedBox(
              height: 20,
            ),
            RoundedButton( text: 'Create account',onTap: (){
              _auth.createUserWithEmailAndPassword(email: emailController.text, password: passController.text).then((value) {
                Utils().toastMessage('New User Registered Successfully!');
                Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen())).onError((error, stackTrace){
                  Utils().toastMessage(error.toString());
                });
              });


            },),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Already have an account?',
                    style: TextStyle(color: Colors.grey, fontSize: 16)),

                TextButton(
                   onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen())); }, child: Text('Sign in.',
                  style: TextStyle(
                      color: Colors.orange,fontSize: 16, fontWeight: FontWeight.bold),),
                )
              ],
            ),

          ],
        ),
      ),
    );
  }
}
