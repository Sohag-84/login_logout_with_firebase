import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_logout_with_firebase/screen/signup_screen.dart';
import 'package:login_logout_with_firebase/utils/color_utils.dart';

import '../reusable_widget/reusable_code.dart';


class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    TextEditingController _passwordTextController = TextEditingController();
    TextEditingController _emailTextController = TextEditingController();

    return Scaffold(
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
                logoImage('images/logo1.png'),
                SizedBox(height: height*0.05,),
                reusableTextField('Enter your user name', Icons.person_outline, false, _emailTextController),
                SizedBox(height: height*0.02,),
                reusableTextField('Enter your password', Icons.lock_outline, false, _passwordTextController),
                //SizedBox(height: height*0.01,),
                Container(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                    ),
                    onPressed: () { },
                    child: const Text('Forgot password?'),
                  )

                ),
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
                    child: const Text('Login'),
                    onPressed: () {},
                  ),

                ),
                Row(
                  children: [
                    const Text('Don\'t have an account?',style: TextStyle(color: Colors.grey),),
                    TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                      ),
                      onPressed: () {
                        FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: _emailTextController.text,
                            password: _passwordTextController.text).then((value){
                              print("logout successfully");
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return const SignUpScreen();
                          }
                          ));
                        });

                      },
                      child: const Text('Sign Up'),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}