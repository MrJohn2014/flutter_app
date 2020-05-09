import 'package:login_app/models/user/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:login_app/navigator_key.dart' as navigatorKey;

class UpdateResultScreen extends StatefulWidget{
  final UserViewModel viewModel;
  UpdateResultScreen(this.viewModel);

  _UpdateResultScreenState createState() => _UpdateResultScreenState();
}

class _UpdateResultScreenState extends State<UpdateResultScreen> {

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(124, 154, 171, 1.0),
        title: Text("Update Result"),
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
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Container(
             decoration: BoxDecoration(
                 border: Border(
                  bottom: BorderSide(
                        color: Colors.grey,
                        width: 0.2,
                  ),
             )),
              child: Row(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "Email:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      widget.viewModel.updatedUser.email,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),

                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey,
                      width: 0.2,
                    ),
                  )),
              child: Row(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "Firstname:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      widget.viewModel.updatedUser.firstName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),

                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey,
                      width: 0.2,
                    ),
                  )),
              child: Row(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "Lastname:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      widget.viewModel.updatedUser.lastName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),

                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey,
                      width: 0.2,
                    ),
                  )),
              child: Row(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "Updated At:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      widget.viewModel.updatedUser.updatedAt.substring(0,19),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}