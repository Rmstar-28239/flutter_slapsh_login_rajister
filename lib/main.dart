import 'package:flutter/material.dart';
import 'package:flutter_slapsh_login_rajister/Login.dart';
import 'package:flutter_slapsh_login_rajister/Rajister.dart';
import 'Slapsh.dart';
import 'package:get/get.dart';
import 'UnknownRoutePage.dart';
void main() {
  runApp(GetMaterialApp(
    initialRoute: '/',
    unknownRoute: GetPage(name: '/notfound', page: () => UnknownRoutePage()), //like 404 page in web
    getPages: [
      GetPage(name: '/', page: () => MyApp()),
      GetPage(name: '/login', page: () =>Login(),),
      GetPage(name: '/newuser', page: () => Rajister()),
    ],
  )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     home: Slapsh(),
    );
  }
}
