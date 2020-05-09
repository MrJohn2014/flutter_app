import 'package:flutter/material.dart';
import 'package:login_app/models/user/user_view_model.dart';

class UserCreateScreen extends StatefulWidget{

  final UserViewModel viewModel;
  UserCreateScreen(this.viewModel);

  _UserCreateScreenState createState() => _UserCreateScreenState();
}

class _UserCreateScreenState extends State<UserCreateScreen>{
  TextEditingController emailCtr = new TextEditingController();
  TextEditingController fnameCtr = new TextEditingController();
  TextEditingController lnameCtr = new TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(124, 154, 171, 1.0),
        title: Text("Create User"),
      ),
      body: Container(
        height:MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(25.0),
              child:TextFormField(
                decoration: InputDecoration(
                    hintText: "Email",
                    hintStyle: TextStyle(fontSize: 18, color: Colors.grey),
                    contentPadding: EdgeInsets.only(top: 10.0, bottom: 5.0)
                ),
                controller: emailCtr,
              ),
            ),
            Container(
              padding: EdgeInsets.all(25.0),
              child:TextFormField(
                decoration: InputDecoration(
                    hintText: "Firstname",
                    hintStyle: TextStyle(fontSize: 18, color: Colors.grey),
                    contentPadding: EdgeInsets.only(top: 10.0, bottom: 5.0)
                ),
                controller: fnameCtr,
              ),
            ),
            Container(
              padding: EdgeInsets.all(25.0),
              child:TextFormField(
                decoration: InputDecoration(
                    hintText: "Lastname",
                    hintStyle: TextStyle(fontSize: 18, color: Colors.grey),
                    contentPadding: EdgeInsets.only(top: 10.0, bottom: 5.0)
                ),
                controller: lnameCtr,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        top: true,
        left: true,
        right: true,
        bottom: false,
        child: Container(
          padding: EdgeInsets.only(
              left: 55.0, right: 55.0, bottom: 15.0, top: 10.0),
          child: InkWell(
            onTap: (){
               widget.viewModel.createUser(emailCtr.text, fnameCtr.text, lnameCtr.text);
            },
            child: Container(
              height: 50.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  colors: [
                    Color(0xFF607D8B),
                    Color(0xFFB0BEC5),
                    Color(0xFFCFD8DC),
                  ],
                ),
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
              child: Text(
                "CREATE",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}