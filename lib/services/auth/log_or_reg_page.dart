import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/login_page.dart';
import 'package:food_delivery_app/pages/registration_page.dart';

class LogOrReg extends StatefulWidget{
  const LogOrReg({super.key});

  @override
  State<LogOrReg> createState() => _LogOrRegState();
}

class _LogOrRegState extends State<LogOrReg> {

bool showLoginPage = true;

void togglePages(){
  setState(() {
    showLoginPage = !showLoginPage;
  });
}

  @override
  Widget build(BuildContext context) {
    if (showLoginPage){
      return LoginPage(onRegisterTap: togglePages);
    }
    else{
      return RegistrationPage(onLoginTap: togglePages);
    }
  }
}