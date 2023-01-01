import 'package:flutter/material.dart';
import 'package:flutter_slapsh_login_rajister/Color.dart';
import 'package:flutter_slapsh_login_rajister/Rajister.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var height,width,font;
  var username,password;
  TextEditingController user=new TextEditingController();
  TextEditingController pass=new TextEditingController();


  void GotoNext()
  {
    Get.to(Rajister());
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    height=MediaQuery.of(context).size.height;
    width=MediaQuery.of(context).size.width;
     if(width>750)
       {
         font=20;
       }else
       {
           font=MediaQuery.of(context).size.width * 0.035;
       }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        body: SingleChildScrollView(
          child:Column(
            children: [
              TopRoundedContainer(),
              SizedBox(height: 10,),
              ForfildLayout(),
            ],
          ),
        ),
      )
    );
  }

  Widget TopRoundedContainer()
  {
    return Container(
      height: height/3,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.only(bottomLeft:Radius.circular(70)),
        gradient: LinearGradient(
          colors: [(new Color(0xffF5591F)),(new Color(0xffF2861E))],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )
      ),
      child:Center(
        child: Stack(
          children: [
            Container(
              alignment: Alignment.center,
              child: Image(
                      width:width/8,
                      height:height/8,
                      image: AssetImage("assets/hm.png")
                  ),
              ),
            Container(
              margin: EdgeInsets.all(10),
              alignment: Alignment.bottomRight,
              child: Text("Login here",style: TextStyle(fontSize:font,color: Colors.white,fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget  ForfildLayout()
  {
    return Container(
      child: Column(
        children: [
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
              controller: user,
            ),
          ),
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
                label: Text("Password"),
                fillColor: Colors.white, //<--
              ),
              obscureText: true,
              controller: pass,
            ),
          ),
          SizedBox(height: 5,),
          Container(
            constraints: BoxConstraints(
              maxWidth: 500,
            ),
            alignment: Alignment.centerRight,
            child: TextButton(onPressed: (){},child: Text("Forget Password",style: TextStyle(fontSize: font-2,color: background),),),
          ),
          SizedBox(height: 5,),
          Container(
            width: double.maxFinite,
            margin: EdgeInsets.all(15),
            constraints: BoxConstraints(
              maxWidth: 500,
            ),
            child: ElevatedButton(
              onPressed:OpenBottomsheet,
              child: Text("Login Here",style:
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
          SizedBox(height: 5,),
          Container(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Are you create new acccount?",style: TextStyle(color:background,fontSize:font-4),),
                TextButton(onPressed: GotoNext,
                  child:Text("Singup",style: TextStyle(color:Colors.blue,fontSize:font-4),),)
              ],
            ),),
        ],
      ),
    );
  }
  void OpenBottomsheet()
  {
    username=user.text;
    password=pass.text;
    if(username.toString().isEmpty)
    {
      Fluttertoast.showToast(msg: "UserName Empty",gravity: ToastGravity.TOP,timeInSecForIosWeb:3);
      return;
    }
    if(password.toString().isEmpty)
    {
      Fluttertoast.showToast(msg: "Password Empty",gravity: ToastGravity.TOP,timeInSecForIosWeb:3);
      return;
    }
    Navigator.of(context);
    showModalBottomSheet(
        context: context,
        builder: (context)
    {
      return Container(
        width: double.maxFinite,
        constraints: BoxConstraints(
          maxHeight: height/2,
        ),
        child: SingleChildScrollView(
          child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             Container(
               alignment: Alignment.center,
               child: InkWell(
                 onTap: (){
                   Navigator.of(context).pop();
                 },
                 child: Container(
                   margin: EdgeInsets.all(8),
                   height: 12,
                   width: 110,
                   decoration: BoxDecoration(
                     color: textcolor,
                     borderRadius: BorderRadius.circular(4),
                   ),
                 ),
               ),
             ),
              Container(
                margin: EdgeInsets.all(2),
                padding: EdgeInsets.all(8),
                child: Text("UserName:      $username",style: TextStyle(fontSize:font-3,color: textcolor),),
              ),
              Container(
                margin: EdgeInsets.all(2),
                padding: EdgeInsets.all(8),
                child: Text("Password:      $password",style: TextStyle(fontSize:font-3,color: textcolor),),
              ),
            ],
          ),
        ),
      );
        
    },backgroundColor: background,constraints: BoxConstraints(maxWidth: 550),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
    )
    );

  }
}
