import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'views/login_view.dart';
import 'views/register_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: LoginView(),
      getPages: [
        GetPage(name: '/login', page: () => LoginView()),
        GetPage(name: '/register', page: () => RegisterView()),
      ],
    );
  }
}
