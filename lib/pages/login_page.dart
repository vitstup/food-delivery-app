import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_button.dart';
import 'package:food_delivery_app/components/my_textfield.dart';
import 'package:food_delivery_app/services/auth/auth_service.dart';

class LoginPage extends StatefulWidget{
  final void Function()? onRegisterTap;

  const LoginPage({super.key, required this.onRegisterTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  void login() async {
    // check data

    final _authService = AuthService();

    try{
        await _authService.signInWithEmailAndPassword(emailController.text, passwordController.text);
      }
      catch (e){
        showDialog(context: context, builder: (context) => AlertDialog(title: Text(e.toString())));
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

            const SizedBox(height: 25),

            MyButton(onTap: login, text: "Войти"),

            const SizedBox(height: 25),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Ещё не зарегистрированы?", style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary)),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: widget.onRegisterTap,
                  child: Text("Регистрация", style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary, fontWeight: FontWeight.bold)))
              ],
            )
          ],
        ),
      ),
    );
  }
}