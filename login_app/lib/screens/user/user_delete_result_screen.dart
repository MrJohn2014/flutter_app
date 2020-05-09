import 'package:login_app/models/user/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:login_app/navigator_key.dart' as navigatorKey;

class UserDeleteResultScreen extends StatefulWidget{
  final UserViewModel viewModel;
  UserDeleteResultScreen(this.viewModel);

  _UserDeleteResultScreenState createState() => _UserDeleteResultScreenState();
}

class _UserDeleteResultScreenState extends State<UserDeleteResultScreen>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(124, 154, 171, 1.0),
        title: Text("Delete Result"),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                navigatorKey.rootNavigatorKey.currentState.pushNamed("/home");
              },
            );
          },
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                      "Status Code:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                      ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    widget.viewModel.deleteResult.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 19,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

}