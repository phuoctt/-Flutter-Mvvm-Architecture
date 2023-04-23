import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/login_view_model.dart';
import '../widget/app_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loginViewModel = Provider.of<LoginViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          if (primaryFocus != null) primaryFocus!.unfocus();
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      hintText: 'Email',
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.alternate_email)),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                      hintText: 'Password',
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock)),
                ),
                const SizedBox(height: 26.0),
                AppButton(
                  title: 'Login',
                  loading: loginViewModel.loading,
                  onPress: () {
                    if(!_validateEmail(_emailController.text)){
                      _showAlertDialog(content: 'Invalid email');
                      return ;
                    }else if(_passwordController.text.length < 9){
                      _showAlertDialog(content: 'Please enter 9 digit password');
                    }else{
                      loginViewModel.onLogin(
                          context, _emailController.text, _passwordController.text);
                    }

                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  // validate email
  bool _validateEmail(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  void _showAlertDialog({String? title, String? content}) {
    showDialog(context: context, builder: (_) =>
        AlertDialog(
          title:  Text(title ?? 'Notification'),
          content: Text(content??''),
          actions: <Widget>[
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ));
  }
}
