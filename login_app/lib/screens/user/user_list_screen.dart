import 'package:flutter/material.dart';
import 'package:login_app/models/user/user.dart';
import 'package:login_app/models/user/user_view_model.dart';
import 'package:login_app/screens/user/userListItem.dart';
import 'package:login_app/navigator_key.dart' as navigatorKey;

class UserListScreen extends StatefulWidget {
  final UserViewModel viewModel;

  UserListScreen(this.viewModel);

  @override
  _UserListScreenState createState() => _UserListScreenState();
}


class _UserListScreenState extends State<UserListScreen>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(124, 154, 171, 1.0),
        title: Text("Users"),
      ),
      body: Container(
          height:MediaQuery.of(context).size.height,
          child: ListView(
            children: _getAllUserWidgets(widget.viewModel.users),
          ),
      ),
    );
  }

  List<Widget> _getAllUserWidgets(List<User> users){
    print(widget.viewModel.users.length);
    List<Widget> widgets = [];
    for(var i=0; i < users.length; i++){
      widgets.add(
        UserListItem(
          id: users[i].id,
          email: users[i].email,
          firstName: users[i].firstName,
          lastName: users[i].lastName,
          avatarURL: users[i].avatar == null? "https://cdn.shopify.com/s/files/1/0075/9988/2276/t/12/assets/notAvailable.png" : users[i].avatar,
          updateBtn: FlatButton(
              textColor: Colors.grey[600],
              disabledColor: Colors.grey,
              disabledTextColor: Colors.black,
              padding: EdgeInsets.all(8.0),
              splashColor: Colors.blueAccent,
            child: Text(
              "Update"
            ),
            onPressed: (){
              print(users[i].email);
              widget.viewModel.prepareUpdateUser(users[i]);
              navigatorKey.rootNavigatorKey.currentState.pushNamed("/update");
            }
          ),
          deleteBtn: FlatButton(
            textColor: Colors.grey[600],
            disabledColor: Colors.grey,
            disabledTextColor: Colors.black,
            padding: EdgeInsets.all(8.0),
            splashColor: Colors.blueAccent,
            child: Text(
              "Delete"
            ),
            onPressed: (){
              _showMaterialDialog(users[i]);
            },
          ),
        ),
      );
    }
    return widgets;
  }


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