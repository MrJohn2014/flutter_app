import 'package:flutter/material.dart';
import 'package:login_app/models/user/user_view_model.dart';


class UserSearchNotFoundScreen extends StatefulWidget{
  final UserViewModel viewModel;

  UserSearchNotFoundScreen(this.viewModel);

  @override
  _UserSearchNotFoundScreenState createState() => _UserSearchNotFoundScreenState();
}

class _UserSearchNotFoundScreenState extends State<UserSearchNotFoundScreen>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(124, 154, 171, 1.0),
        title: Text("Search Result"),
      ),
      body: Container(
        alignment: Alignment.center,
        padding:EdgeInsets.only(top: 15.0, left: 5.0, right: 5.0,bottom: 10.0),
        height:MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            Text(
              "Cannot find this user",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}