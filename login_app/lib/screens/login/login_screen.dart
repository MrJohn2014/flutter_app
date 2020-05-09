import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_app/models/login/login_view_model.dart';
import 'package:login_app/navigator_key.dart' as navigatorKey;
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  final LoginViewModel viewModel;
  LoginScreen(this.viewModel);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>{

  TextEditingController emailCtr = TextEditingController();
  TextEditingController pwdCtr = TextEditingController();


  @override
  Widget build(BuildContext context){
    print("%%%");

   return Scaffold(
     resizeToAvoidBottomPadding: false,
     backgroundColor: Color.fromRGBO(124, 154, 171, 1.0),
     body: Column(
       children: <Widget>[
         logo(),
         Container(
           padding: const EdgeInsets.only(top:15.0,bottom: 10.0),
           width: 350,
           child:TextField(
             controller: emailCtr,
             keyboardType: TextInputType.emailAddress,
             decoration: InputDecoration(
               fillColor: Colors.white,
               hintText: "EMAIL",
               hintStyle: TextStyle(fontWeight: FontWeight.w300, color: Colors.white),
               prefixIcon: new Icon(Icons.email, color: Colors.white),
               enabledBorder: OutlineInputBorder(
                 borderSide:   const BorderSide(color: Colors.white, width: 2.0),
                 //borderRadius: BorderRadius.circular(30.0),
               ),
               focusedBorder: OutlineInputBorder(
                 borderSide:   const BorderSide(color: Colors.white, width: 2.0),
                 //borderRadius: BorderRadius.circular(30.0),
               ),
               border: OutlineInputBorder(),

             ),
           ),
         ),
         Container(
           padding: const EdgeInsets.only(top:15.0,bottom: 10.0),
           width: 350,
           child: TextField(
             controller: pwdCtr,
             obscureText: true,
             decoration: InputDecoration(
               fillColor: Colors.white,
               hintText: "PASSWORD",
               hintStyle: TextStyle(fontWeight: FontWeight.w300, color: Colors.white),
               prefixIcon: new Icon(Icons.lock, color: Colors.white),
               enabledBorder: OutlineInputBorder(
                 borderSide: BorderSide(color: Colors.white, width: 2.0),
                 //borderRadius: BorderRadius.circular(30.0),
               ),
               focusedBorder: OutlineInputBorder(
                 borderSide:   const BorderSide(color: Colors.white, width: 2.0),
                 //borderRadius: BorderRadius.circular(30.0),
               ),
               border: OutlineInputBorder(),
             ),
           ),
         ),
         Container(
           child: Text(
             widget.viewModel.loginErr,
             style: TextStyle(
               color:Colors.red,
             ),
           ),
         ),
         Container(
           padding: const EdgeInsets.only(top:35.0,bottom: 5.0),
           width:200,
           height: 90,
           child:  OutlineButton(
             highlightedBorderColor: Colors.white,
             borderSide: BorderSide(color: Colors.white, width:2.0),
             highlightElevation: 0.0,
             splashColor: Color.fromRGBO(124, 154, 171, 1.0),
             highlightColor: Color.fromRGBO(124, 154, 171, 1.0),
             color: Colors.blue,
             shape: RoundedRectangleBorder(
               borderRadius: new BorderRadius.circular(30.0),
             ),
             child: Text(
               "LOGIN", style: TextStyle(
               fontWeight: FontWeight.bold,
               color: Colors.white,
               fontSize: 20,
             ),
             ),
             onPressed: (){
                 widget.viewModel.loginAccount(emailCtr.text, pwdCtr.text,() async{
                   SharedPreferences prefs = await SharedPreferences.getInstance();
                   prefs.setString('email', emailCtr.text);
                   //var email = prefs.getString("email");
                   //print("Stored Email:${email}");
                   navigatorKey.rootNavigatorKey.currentState.pushNamed("/home");
                 });
             },
           ),
         ),
         Container(
           padding: const EdgeInsets.only(top:10.0),
           child: Text(
               "- Version 1.0 -"
           ),
         ),
       ],
     ),
   );
  }

  Widget logo(){
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: 60),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 240,
          child: Stack(
            children: <Widget>[
              Positioned(
                child: Container(
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white
                      ),
                    ),
                  ),
                  height: 154,
                ),
              ),
              Positioned(
                child: Container(
                  height: 154,
                  width: MediaQuery.of(context).size.width,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "EPK",
                      style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(124, 154, 171, 1.0),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}