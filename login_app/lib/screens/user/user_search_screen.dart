import 'package:flutter/material.dart';
import 'package:login_app/models/user/user.dart';
import 'package:login_app/models/user/user_view_model.dart';
import 'package:login_app/screens/user/userListItem.dart';
import 'package:login_app/navigator_key.dart' as navigatorKey;

class UserSearchScreen extends StatefulWidget{
  final UserViewModel viewModel;

  UserSearchScreen(this.viewModel);

  @override
  _UserSearchScreenState createState() => _UserSearchScreenState();
}

class _UserSearchScreenState extends State<UserSearchScreen>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(124, 154, 171, 1.0),
        title: Text("Search Result"),
      ),
      body: Container(
        padding:EdgeInsets.only(top: 5.0, left: 5.0, right: 5.0,bottom: 10.0),
        height:MediaQuery.of(context).size.height,
        child: UserListItem(
          id: widget.viewModel.searchUser.id,
          email: widget.viewModel.searchUser.email,
          firstName: widget.viewModel.searchUser.firstName,
          lastName: widget.viewModel.searchUser.lastName,
          avatarURL: widget.viewModel.searchUser.avatar,
          updateBtn: FlatButton(
              child: Text(
                  "Update"
              ),
              onPressed: (){
                widget.viewModel.prepareUpdateUser(widget.viewModel.searchUser);
                navigatorKey.rootNavigatorKey.currentState.pushNamed("/update");
              }
          ),
          deleteBtn: FlatButton(
            child: Text(
                "Delete"
            ),
            onPressed: (){
               _showMaterialDialog(widget.viewModel.searchUser);
            },
          ),
        ),
      ),
    );
  }

  //delete dialog to confirm
  void _showMaterialDialog(User user) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Login App'),
            content: Text('Attention:Delete User. Please confirm to delete.'),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    widget.viewModel.deleteUser(user);
                    Navigator.pop(context);
                  },
                  child: Text('Confirm')),
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                  //print('HelloWorld!');
                },
                child: Text('Cancel'),
              )
            ],
          );
        });
  }

}