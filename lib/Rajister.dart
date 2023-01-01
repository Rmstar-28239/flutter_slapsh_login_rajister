import 'package:flutter/material.dart';
import 'package:flutter_slapsh_login_rajister/Color.dart';
import 'package:flutter_slapsh_login_rajister/Login.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
class Rajister extends StatelessWidget {
  const Rajister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Rajisterstatesful(),
    );
  }
}
class Rajisterstatesful extends StatefulWidget {
  const Rajisterstatesful({Key? key}) : super(key: key);
  @override
  State<Rajisterstatesful> createState() => _RajisterstatesfulState();
}

class _RajisterstatesfulState extends State<Rajisterstatesful> {
  var height,width,font;
  TextEditingController name=new TextEditingController();
  TextEditingController phone=new TextEditingController();
  TextEditingController username=new TextEditingController();
  TextEditingController pass=new TextEditingController();
  TextEditingController cnfpass=new TextEditingController();
  @override
  Widget build(BuildContext context) {
    height=MediaQuery.of(context).size.height;
    width=MediaQuery.of(context).size.width;
    if(width>750)
    {
      font=20;
    }else
    {
      font=MediaQuery.of(context).size.width * 0.04;
    }
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
             children: [
               TopHeader(),
               SizedBox(height: 5,),
               TextLayout(),
             ],
          ),
        ),
      ),
    );
  }

  Widget TopHeader()
  {
    return Container(
      height: height/2.8,
      width: double.maxFinite,
      decoration: BoxDecoration(
        gradient:LinearGradient(
          colors: [
            (new Color(0xffF5591F)),
            (new Color(0xffF5591F)),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(70)),
      ),
      child: Stack(
         children: [
           Container(
             alignment: Alignment.center,
             child: Image(
               width:width/8,
               height:height/8,
               image: AssetImage("assets/hm.png"),
             ),
           ),
           Container(
             margin: EdgeInsets.all(10),
             alignment: Alignment.bottomRight,
             child: Text("Create account",
               style: TextStyle(fontSize:font,fontWeight: FontWeight.bold,color: Colors.white),),
           ),
           Container(
             margin: EdgeInsets.all(5),
             alignment: Alignment.topLeft,
             child: InkWell(child: Icon(Icons.arrow_back_ios_new,color: Colors.white,size: 30),onTap: (){
               Get.off(Login());
             },),
           ),
         ],
      ),
    );
  }

  Widget TextLayout()
  {
    return Container(
      constraints: BoxConstraints(
        maxWidth: 700,
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            constraints: BoxConstraints(
              maxWidth: 500,
            ),
            child: TextField(
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: background),
                ),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: background)),
                border: OutlineInputBorder(),
                label: Text("Name"),
                fillColor: Colors.white, //<--
              ),
              controller: name,
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            constraints: BoxConstraints(
              maxWidth: 500,
            ),
            child: TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: background)),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: background),
                ),
                border: OutlineInputBorder(),
                label: Text("Phone Num"),
                fillColor: Colors.white, //<--
              ),
              controller: phone,
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            constraints: BoxConstraints(
              maxWidth: 500,
            ),
            child: TextField(

              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: background)),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: background),
                ),
                border: OutlineInputBorder(),
                label: Text("UserName"),
                fillColor: Colors.white, //<--
              ),
              controller: username,
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            constraints: BoxConstraints(
              maxWidth: 500,
            ),
            child: TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: background)),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: background),
                ),
                border: OutlineInputBorder(),
                label: Text("Password"),
                fillColor: Colors.white, //<--
              ),
              controller: pass,
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            constraints: BoxConstraints(
              maxWidth: 500,
            ),
            child: TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: background)),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: background),
                ),
                border: OutlineInputBorder(),
                label: Text("Confirm Password"),
                fillColor: Colors.white, //<--
              ),
              controller: cnfpass,
            ),
          ),
          Container(
            width: double.maxFinite,
            margin: EdgeInsets.all(15),
            constraints: BoxConstraints(
              maxWidth: 500,
            ),
            child: ElevatedButton(
              onPressed:SubmitData,
              child: Text("Singup Here",style:
              TextStyle(fontSize:15,color: Colors.white),),
              style:ElevatedButton.styleFrom(
                  primary: background,
                  padding: EdgeInsets.all(24),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  )
              ),
            ),
          ),
        ],
      ),
    );
  }
  void SubmitData()
  {
    if(name.text.isEmpty)
      {
        Fluttertoast.showToast(msg: "Name is Empty",gravity: ToastGravity.TOP,timeInSecForIosWeb:3 );
        return;
      }
    if(phone.text.isEmpty)
      {
        Fluttertoast.showToast(msg: "Phone is Empty",gravity: ToastGravity.TOP,timeInSecForIosWeb: 3);
        return;
      }
    if(username.text.isEmpty)
      {
        Fluttertoast.showToast(msg: "User Name is Empty",gravity: ToastGravity.TOP,timeInSecForIosWeb: 3);
        return;
      }
    if(pass.text.isEmpty)
      {
        Fluttertoast.showToast(msg: "Password is Empty",gravity:ToastGravity.TOP,timeInSecForIosWeb: 3);
        return;
      }
    if(cnfpass.text.isEmpty)
      {
        Fluttertoast.showToast(msg: "Confirm Password is Empty",gravity: ToastGravity.TOP,timeInSecForIosWeb: 3);
        return;
      }
    if(cnfpass.text.toString()!=pass.text.toString())
      {
        Fluttertoast.showToast(msg: "Password Not Match",gravity: ToastGravity.TOP,timeInSecForIosWeb: 3);
        return;
      }
    Navigator.of(context);
    showModalBottomSheet(context: context, builder: (context)
    {
      return SingleChildScrollView(
        child:Container(
          width: double.maxFinite,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(5),
                height: 13,
                width: 100,
                child: InkWell(
                  onTap: (){
                    Navigator.of(context).pop();
                  },
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: textcolor,
                ),
              ),
              MyAllText()
            ],
          ),
        ),
      );
    },backgroundColor: background,constraints: BoxConstraints(maxHeight: height/2,maxWidth: 600),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(topRight: Radius.circular(15),
          topLeft: Radius.circular(15))
    ));

  }

  Widget MyAllText()
  {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(left: 10,right: 10,top: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.all(8),
          child: Text("Name     "+name.text,style: TextStyle(fontSize: font-3,color: textcolor),),),
          Padding(padding: EdgeInsets.all(8),
            child: Text("Phone Num     "+phone.text,style: TextStyle(fontSize: font-3,color: textcolor),),),
          Padding(padding: EdgeInsets.all(8),
            child: Text("UserName     "+username.text,style: TextStyle(fontSize: font-3,color: textcolor),),),
          Padding(padding: EdgeInsets.all(8),
            child: Text("PassWord     "+cnfpass.text,style: TextStyle(fontSize: font-3,color: textcolor),),),

        ],
      ),

    );
  }
}

