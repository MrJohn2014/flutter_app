import 'package:flutter/material.dart';
import 'package:login_app/models/user/user_view_model.dart';
import 'package:login_app/navigator_key.dart' as navigatorKey;
import 'package:shared_preferences/shared_preferences.dart';
class HomeScreen extends StatefulWidget {
  final UserViewModel viewModel;
  HomeScreen(this.viewModel);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context){
     return Scaffold(
       appBar: AppBar(
         backgroundColor: Color.fromRGBO(124, 154, 171, 1.0),
         title: Text("Login App"),
       ),
       drawer: Drawer(
         child: ListView(
           children: <Widget>[
             UserAccountsDrawerHeader(
               decoration: BoxDecoration(
                 color: Color.fromRGBO(124, 154, 171, 1.0),
               ),
               accountEmail: Text(widget.viewModel.email == null? "" : widget.viewModel.email),
               currentAccountPicture: CircleAvatar(
                 backgroundColor: Colors.white,
                 child: Icon(
                   Icons.person,
                   size: 50,
                 ),
               ),
             ),
             InkWell(
               onTap: () async{
                 SharedPreferences prefs = await SharedPreferences.getInstance();
                 prefs.remove('email');
                 navigatorKey.rootNavigatorKey.currentState.pushNamed("/login");
               },
               child: ListTile(
                 title: Text(
                     "Logout",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                 ),
                 leading: Icon(Icons.mouse,color: Colors.blue),
               ),
             ),
           ],
         ),
       ),
       body: Container(
           alignment: Alignment.center,
           padding: const EdgeInsets.all(15.0),
           child: Column(
               //mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
                 Container(
                   height: 80.0,
                   padding: const EdgeInsets.all(16.0),
                   margin: const EdgeInsets.only(top:20.0,bottom: 20.0),
                   child: TextField(
                     onSubmitted: (String value){
                       widget.viewModel.searchUserByID((){
                         navigatorKey.rootNavigatorKey.currentState.pushNamed("/search");
                       },int.parse(value));
                     },
                     controller: searchController,
                     decoration: InputDecoration(
                         labelText: "Search",
                         hintText: "Search By User ID",
                         prefixIcon: Icon(Icons.search),
                         border: OutlineInputBorder(
                             borderRadius: BorderRadius.all(Radius.circular(5.0)))),
                   ),
                 ),
                 Text("Choose the action that you want to perform"),
                 //const SizedBox(height:30),
                 Container(
                   margin: const EdgeInsets.only(top:30.0),
                   child: ButtonTheme(
                     padding:const EdgeInsets.all(16.0),
                     minWidth: 130,
                     height: 50,
                     child: RaisedButton(
                       textColor: Colors.white,
                       padding: const EdgeInsets.all(10.0),
                       child: Text(
                           "All Users",
                           style: TextStyle(fontSize: 19)
                       ),
                       onPressed:() {
                          widget.viewModel.getAllUsers((){
                            navigatorKey.rootNavigatorKey.currentState.pushNamed("/users");
                          });
                       },
                     ),
                   ),
                 ),
                 //const SizedBox(height:30),
                 Container(
                   margin: const EdgeInsets.only(top:30.0),
                   child: ButtonTheme(
                     minWidth: 130,
                     height: 50,
                     child: RaisedButton(
                       textColor: Colors.white,
                       padding: const EdgeInsets.all(10.0),
                       child: Text(
                           "Create User",
                           style: TextStyle(fontSize: 19)
                       ),
                       onPressed: () {
                         navigatorKey.rootNavigatorKey.currentState.pushNamed("/create");
                       },
                     ),
                   ),
                 ),
               ],
             ),
         ),
     );
  }
}