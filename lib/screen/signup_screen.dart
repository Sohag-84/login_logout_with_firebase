
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_logout_with_firebase/screen/home_screen.dart';

import '../reusable_widget/reusable_code.dart';
import '../utils/color_utils.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _userNameTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: const Icon(Icons.arrow_back,size: 24,),
          title: const Text('Sign UP',style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                hexStringToColor('CB2B93'),
                hexStringToColor('9546C4'),
                hexStringToColor('5E61F4'),
              ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter
              )
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, height*0.15, 20, 0),
              child: Column(
                children: [
                  SizedBox(height: height*0.05,),
                  reusableTextField('Enter your user name', Icons.person_outline, false, _userNameTextController),
                  SizedBox(height: height*0.02,),
                  reusableTextField('Enter your email', Icons.mail_outline, false, _emailTextController),
                  SizedBox(height: height*0.02,),
                  reusableTextField('Enter your password', Icons.lock_outline, false, _passwordTextController),
                  SizedBox(height: height*0.01,),
                  Container(
                    margin: const EdgeInsets.all(0),
                    width: width*0.7,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: const BorderSide(
                              color: Colors.white10,
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                      child: const Text('Register'),
                      onPressed: () {
                        FirebaseAuth.instance.createUserWithEmailAndPassword(
                            email: _emailTextController.text,
                            password: _passwordTextController.text
                        ).then((value) {
                          print("Created new account");
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return HomeScreen();
                          }));
                        }).onError((error, stackTrace){
                          print("Error: ${error.toString()}");
                        });
                      },
                    ),

                  ),
                  Row(
                    children: [
                      const Text('Already have an account?',style: TextStyle(color: Colors.grey),),
                      Container(
                        alignment: Alignment.center,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            primary: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Sign In'),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
