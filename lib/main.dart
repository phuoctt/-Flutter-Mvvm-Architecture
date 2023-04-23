import 'package:flutter/material.dart';
import 'package:mvvm/routes/routes.dart';
import 'package:mvvm/routes/routes_name.dart';
import 'package:mvvm/view/login_screen.dart';
import 'package:mvvm/view_model/login_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => LoginViewModel()),

    ],child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: RoutesName.login,
      onGenerateRoute: Routes.generateRoute,
    ));
  }
}


