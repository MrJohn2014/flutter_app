import 'package:login_app/models/app_state.dart';
import 'package:login_app/redux/account/account_actions.dart';
import 'package:redux/redux.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:login_app/navigator_key.dart' as navigatorKey;
import 'package:login_app/config.dart' as config;


class accountActionMiddleware extends MiddlewareClass<AppState> {

  @override
  void call(Store<AppState> store, dynamic action, NextDispatcher next) async{
    if(action is LoginAccountAction){
      _loginAccount(action.email, action.pwd, action.onSuccess, next);
    }
    next(action);
  }

  void _loginAccount(String email, String pwd, Function() onSuccess,NextDispatcher next) async{
    Map<String, String> header = {"Content-type":"application/json"};
    Map<String, String> requestBody = {
      "email": email,
      "password": pwd
    };
    print(requestBody);
    var url = "${config.serverURL}/login";
    var response = await http.post(url, headers: header, body: convert.jsonEncode(requestBody));
    if(response.statusCode == 200){
      try{
         Map<String, dynamic> responseJson = convert.jsonDecode(response.body);
         String token = responseJson["token"];
         print(token);
         next(new StoreLoginTokenAction(token));
         next(UpdateLoginErrorAction(""));
         next(StoreAccountEmailAction(email));
         onSuccess();
         //navigatorKey.rootNavigatorKey.currentState.pushNamed("/home");
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
      next(new UpdateLoginErrorAction(err));
    }
  }
}