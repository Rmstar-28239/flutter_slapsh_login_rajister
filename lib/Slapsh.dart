import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_slapsh_login_rajister/Color.dart';
import 'package:flutter_slapsh_login_rajister/Login.dart';
import 'package:get/get.dart';
class Slapsh extends StatefulWidget {
  const Slapsh({Key? key}) : super(key: key);

  @override
  State<Slapsh> createState() => _SlapshState();
}

class _SlapshState extends State<Slapsh> {
  var size,height,width;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }
  void startTimer()
  {
    Timer(Duration(seconds: 3),(){
      Get.off(Login());
    });

  }


  @override
  Widget build(BuildContext context) {
   height=MediaQuery.of(context).size.height;
   width=MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: background,
              gradient: LinearGradient(
                colors: [(new Color(0xffF5591F)),(new Color(0xffF2861E))],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child:Image(
                width:width/6,
                height:height/6,
                image: AssetImage("assets/hm.png")
            ),
          )
        ],
      ),
    );
  }
}
