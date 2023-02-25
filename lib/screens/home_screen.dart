import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:p1/screens/login_screen.dart';
import 'package:p1/utils/utility.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text('Home'),actions: [
        IconButton(onPressed: (){
          auth.signOut().then((value) {
            Utils().toastMessage("LogOut!");
            Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()),
            ).onError((error, stackTrace){
              Utils().toastMessage(error.toString());

            });
          });
        }, icon: Icon(Icons.logout_sharp))
      ],elevation: 0,)
      ,
    );
  }
}
