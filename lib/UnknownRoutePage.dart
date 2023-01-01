import 'package:flutter/material.dart';
import 'package:flutter_slapsh_login_rajister/Color.dart';
class UnknownRoutePage extends StatelessWidget {
  const UnknownRoutePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text("No Found Page",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: background),),
        ),
      ),
    );
  }
}
