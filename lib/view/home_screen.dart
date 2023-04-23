import 'package:flutter/material.dart';

import '../routes/routes_name.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Home Screen'),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: ()=>_onLogout(context),
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
  void _onLogout(BuildContext context){
    Navigator.pushNamedAndRemoveUntil(
      context,
      RoutesName.login,
          (route) => false,
    );
  }
}
