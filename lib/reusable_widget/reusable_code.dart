import 'package:flutter/material.dart';

Image logoImage(String imageName) {
  return Image.asset(
    imageName,
    fit: BoxFit.fitWidth,
    height: 240,
    width: 240,
    color: Colors.white,
  );
}
TextField reusableTextField(String text,IconData icon,bool isPasswordType,TextEditingController controller){
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Colors.white,
    style: TextStyle(color: Colors.white.withOpacity(0.9)),
    decoration: InputDecoration(
      prefixIcon: Icon(icon,color: Colors.white70,),
      labelText: text,
      labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
      hintText: text,
      hintStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,//it removes label text
      fillColor: Colors.white.withOpacity(0.3),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(width: 0,style: BorderStyle.none)
      )
    ),
    keyboardType: isPasswordType ? TextInputType.visiblePassword : TextInputType.emailAddress,


  );
}