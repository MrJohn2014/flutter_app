import 'package:flutter/material.dart';
import 'package:login_app/models/user/user_view_model.dart';
import 'package:login_app/navigator_key.dart' as navigatorKey;

class UserUpdateScreen extends StatefulWidget{
  final UserViewModel viewModel;
  UserUpdateScreen(this.viewModel);

  _UserUpdateScreenState createState() => _UserUpdateScreenState();
}

class _UserUpdateScreenState extends State<UserUpdateScreen>{
  TextEditingController emailCtr = new TextEditingController();
  TextEditingController fnameCtr = new TextEditingController();
  TextEditingController lnameCtr = new TextEditingController();
  var flag = true;

  @override
  Widget build(BuildContext context){
    if(flag == true){
      emailCtr.value = emailCtr.value.copyWith(text: widget.viewModel.updateUser.email);
      fnameCtr.value = fnameCtr.value.copyWith(text: widget.viewModel.updateUser.firstName);
      lnameCtr.value = lnameCtr.value.copyWith(text: widget.viewModel.updateUser.lastName);
      flag = false;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(124, 154, 171, 1.0),
        title: Text("Update User"),
      ),
      body: Container(
        height:MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10.0),
              child:Text("Email"),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child:TextField(
                controller: emailCtr,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  fillColor: Colors.grey,
                  hintStyle: TextStyle(fontWeight: FontWeight.w300, color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                    borderSide:   const BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:   const BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text("Firstname"),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child:TextField(
                controller: fnameCtr,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  fillColor: Colors.grey,
                  hintStyle: TextStyle(fontWeight: FontWeight.w300, color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                    borderSide:   const BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:   const BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child:Text("Lastname"),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child:TextField(
                controller: lnameCtr,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  fillColor: Colors.grey,
                  hintStyle: TextStyle(fontWeight: FontWeight.w300, color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                    borderSide:   const BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:   const BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  border: OutlineInputBorder(),
                ),
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
              widget.viewModel.updateUserInfo(emailCtr.text, fnameCtr.text, lnameCtr.text,widget.viewModel.updateUser.id);
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
                "UPDATE",
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