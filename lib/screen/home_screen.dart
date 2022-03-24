import 'package:flutter/material.dart';
import 'package:login_logout_with_firebase/screen/singin_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return const SignInScreen();
            }
            ));
          },
          child: const Text('Logout'),
        ),
      ),
    );
  }
}
