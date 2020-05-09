import 'package:login_app/models/app_state.dart';
import 'package:login_app/models/user/user.dart';
import 'package:login_app/models/user/userList.dart';
import 'package:login_app/redux/user/user_actions.dart';
import 'package:redux/redux.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:login_app/navigator_key.dart' as navigatorKey;
import 'package:login_app/config.dart' as config;

class userActionMiddleware extends MiddlewareClass<AppState> {

  @override
  void call(Store<AppState> store, dynamic action, NextDispatcher next) async {
    if(action is FetchAllUsersAction){
       _fetchAllUsers(action.onSuccess, next);
    }
    if(action is SearchUserByIDAction){
      _searchUserByID(action.onSuccess,action.id,next);
    }
    if(action is UpdateUserInfoAction){
      _updateUserInfo(action.email, action.firstname, action.lastname,action.id,next);
    }
    if(action is DeleteUserAction){
      _deleteUser(action.deleteUser,next);
    }
    if(action is CreateUserAction){
      _createUser(action.email,action.firstname,action.lastname,next);
    }

    next(action);
  }

  _fetchAllUsers(Function() onSuccess, NextDispatcher next) async {
    Map<String, String> header = {"Content-type":"application/json"};
    List<User> users = [];
    num totalPage = await getTotalPage();
    var url;
    var response;

    for(int pageNum = 1; pageNum <= totalPage; pageNum++){
      url = "${config.serverURL}/users?page=${pageNum}";
      print(url);
      response = await http.get(url, headers: header);

      if(response.statusCode == 200){
        try{
          Map<String, dynamic> responseJson = convert.jsonDecode(response.body);
          List<dynamic> usersJsonData = responseJson["data"];
          List<User> userList = usersJsonData.map((data) => User.fromJson(data)).toList();
          users = List.from(users)..addAll(userList);
        }
        catch(e){
          print(e);
          return null;
        }
      }
      else{
        Map<String, dynamic> responseJson = convert.jsonDecode(response.body);
        String err = responseJson["error"];
        print(err);
      }
    }

    next(StoreListUsersAction(users));
    onSuccess();
  }

  //help method to get total pages of user list
  getTotalPage() async{
    Map<String, String> header = {"Content-type":"application/json"};
    var url = "${config.serverURL}/users";
    var response = await http.get(url, headers: header);
    if(response.statusCode == 200){
      try{
        Map<String, dynamic> responseJson = convert.jsonDecode(response.body);
        num totalPage = responseJson["total_pages"];
        return totalPage;
      }
      catch(e){
        print(e);
        return null;
      }
    }
    else{
      Map<String, dynamic> responseJson = convert.jsonDecode(response.body);
      String err = responseJson["error"];
      print(err);
    }
  }


  _searchUserByID(Function() onSuccess,num id, NextDispatcher next) async{
    Map<String, String> header = {"Content-type":"application/json"};
    var url = "${config.serverURL}/users/${id}";
    var response = await http.get(url, headers: header);

    if(response.statusCode == 200){
      try{
        Map<String, dynamic> responseJson = convert.jsonDecode(response.body);
        User searchUser = User.fromJson(responseJson["data"]);
        next(StoreSearchUserAction(searchUser));
        onSuccess();
      }
      catch(e){
        print(e);
        return null;
      }
    }
    else{
      Map<String, dynamic> responseJson = convert.jsonDecode(response.body);
      String err = responseJson["error"];
      print(err);
      navigatorKey.rootNavigatorKey.currentState.pushNamed("/searchNotFound");
    }
  }


  _updateUserInfo(String email, String firstname, String lastname,num id, NextDispatcher next) async{
    Map<String, String> header = {"Content-type":"application/json"};
    var url = "${config.serverURL}/users/${id}";
    String name = firstname + lastname;
    Map<String, String> requestBody = {
      "name": name,
      "email": email,
      "first_name":firstname,
      "last_name":lastname
    };
    print(requestBody);
    var response = await http.put(url, headers: header, body: convert.jsonEncode(requestBody));

    if(response.statusCode == 200){
      try{
        Map<String, dynamic> responseJson = convert.jsonDecode(response.body);
        User updatedUser = User.fromJson(responseJson);
        print(updatedUser.email);
        print("**");
        next(StoreUpdatedUserAction(updatedUser));
        navigatorKey.rootNavigatorKey.currentState.pushNamed("/updateResult");
      }
      catch(e){
        print(e);
        return null;
      }
    }
    else{
      Map<String, dynamic> responseJson = convert.jsonDecode(response.body);
      String err = responseJson["error"];
      print(err);
    }

  }


  _deleteUser(User user, NextDispatcher next) async{
    Map<String, String> header = {"Content-type":"application/json"};
    var url = "${config.serverURL}/users/${user.id}";
    var response = await http.delete(url, headers: header);

    //delete successfully
    if(response.statusCode == 204){
      try{
         next(StoreDeleteUserResultAction(response.statusCode));
         navigatorKey.rootNavigatorKey.currentState.pushNamed("/deleteResult");
      }
      catch(e){
        print(e);
        return null;
      }
    }
    else{
      Map<String, dynamic> responseJson = convert.jsonDecode(response.body);
      String err = responseJson["error"];
      print(err);
    }
  }


  _createUser(String email,String firstname,String lastname,NextDispatcher next) async{
    Map<String,String> header = {"content-type":"application/json"};
    var url = "${config.serverURL}/users";
    String name = firstname + lastname;
    Map<String,String> requestBody ={
      "name":name,
      "email": email,
      "first_name": firstname,
      "last_name": lastname,
    };
    var response = await http.post(url, headers: header, body: convert.jsonEncode(requestBody));
    //create user successfully
    if(response.statusCode == 201){
      try{
          Map<String, dynamic> responseJson = convert.jsonDecode(response.body);
          User user = new User(
            email: responseJson["email"],
            firstName: responseJson["first_name"],
            lastName: responseJson["last_name"],
            createdAt: responseJson["createdAt"],
          );
          next(StoreCreatedUserAction(user));
          navigatorKey.rootNavigatorKey.currentState.pushNamed("/createResult");
      }
      catch(e){
        print(e);
        return null;
      }
    }
    else{
      Map<String, dynamic> responseJson = convert.jsonDecode(response.body);
      String err = responseJson["error"];
      print(err);
    }
  }

}