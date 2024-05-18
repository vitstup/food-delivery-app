import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_button.dart';
import 'package:food_delivery_app/components/my_textfield.dart';
import 'package:food_delivery_app/services/auth/auth_service.dart';

class RegistrationPage extends StatefulWidget{
  final void Function()? onLoginTap;

  const RegistrationPage({super.key, required this.onLoginTap});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  void register() async{
    final _authService = AuthService();

    if (passwordController.text == confirmPasswordController.text){
      try{
        await _authService.signUpWithEmailAndPassword(emailController.text, passwordController.text);
      }
      catch (e){
        showDialog(context: context, builder: (context) => AlertDialog(title: Text(e.toString())));
      }
    }
    else{
      showDialog(context: context, builder: (context) => AlertDialog(title: Text("Пароли не совпадают!")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        
            Icon(
              Icons.lock_open_rounded,
              size: 100,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),

            Text(
              'Доставка еды',
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),

            const SizedBox(height: 25),

            MyTextfield(controller: emailController, hintText: "Email", obscureText: false),

            const SizedBox(height: 15),

            MyTextfield(controller: passwordController, hintText: "Пароль", obscureText: true),

            const SizedBox(height: 15),

            MyTextfield(controller: confirmPasswordController, hintText: "Повторите пароль", obscureText: true),

            const SizedBox(height: 25),

            MyButton(onTap: register, text: "Регистрация"),

            const SizedBox(height: 25),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Уже зарегистрированы?", style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary)),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: widget.onLoginTap,
                  child: Text("Войти", style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary, fontWeight: FontWeight.bold)))
              ],
            )
          ],
        ),
      ),
    );
  }
}