import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_app/models/app_state.dart';
import 'package:login_app/models/login/login_view_model.dart';
import 'package:login_app/models/user/user_view_model.dart';
import 'package:login_app/redux/account/account_middleware.dart';
import 'package:login_app/redux/user/user_middleware.dart';
import 'package:login_app/screens/home/home_screen.dart';
import 'package:login_app/screens/login/login_screen.dart';
import 'package:login_app/screens/user/update_result_screen.dart';
import 'package:login_app/screens/user/user_create_result_screen.dart';
import 'package:login_app/screens/user/user_create_screen.dart';
import 'package:login_app/screens/user/user_delete_result_screen.dart';
import 'package:login_app/screens/user/user_list_screen.dart';
import 'package:login_app/screens/user/user_search_notFound_screen.dart';
import 'package:login_app/screens/user/user_search_screen.dart';
import 'package:login_app/screens/user/user_update_screen.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:login_app/redux/app_reducer.dart';
import 'package:login_app/navigator_key.dart' as navigatorKey;
import 'package:shared_preferences/shared_preferences.dart';

String initRoute = "";
Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var email = prefs.getString('email');
  print(email);
  initRoute = email == null? "/login" : "/home";
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final Store<AppState> store = Store<AppState>(
     appStateReducer,
     initialState: AppState.initial(),
     middleware: [
       accountActionMiddleware(),
       userActionMiddleware(),
     ]
  );


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: StoreBuilder<AppState>(
          builder: (BuildContext context, Store<AppState> store) => MyHomePage(store:store),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final Store<AppState> store;

  MyHomePage({Key key, this.title, this.store}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Navigator(
      initialRoute: initRoute,
      key: navigatorKey.rootNavigatorKey,
      onGenerateRoute: (RouteSettings settings){
        switch (settings.name) {
          case '/login':
            return CupertinoPageRoute(
              builder:(context) => StoreConnector<AppState, LoginViewModel>(
                  converter: (store) => LoginViewModel.fromStore(store),
                  builder:
                      (BuildContext context,LoginViewModel loginView) => LoginScreen(loginView)
              ),
            );
          case '/home':
            return CupertinoPageRoute(
                builder:(context) => StoreConnector<AppState, UserViewModel>(
                  converter: (store) => UserViewModel.fromStore(store),
                  builder:
                    (BuildContext context,UserViewModel userView) => HomeScreen(userView)
                ),
            );
          case '/users':
            return CupertinoPageRoute(
              builder:(context) => StoreConnector<AppState, UserViewModel>(
                  converter: (store) => UserViewModel.fromStore(store),
                  builder:
                      (BuildContext context,UserViewModel userView) => UserListScreen(userView)
              ),
            );
          case '/search':
            return CupertinoPageRoute(
              builder:(context) => StoreConnector<AppState, UserViewModel>(
                converter: (store) => UserViewModel.fromStore(store),
                builder:
                   (BuildContext context, UserViewModel userView) => UserSearchScreen(userView)
              ),
            );
          case '/searchNotFound':
            return CupertinoPageRoute(
              builder:(context) => StoreConnector<AppState, UserViewModel>(
                  converter: (store) => UserViewModel.fromStore(store),
                  builder:
                      (BuildContext context, UserViewModel userView) => UserSearchNotFoundScreen(userView)
              ),
            );
          case '/update':
            return CupertinoPageRoute(
              builder:(context) => StoreConnector<AppState, UserViewModel>(
                  converter: (store) => UserViewModel.fromStore(store),
                  builder:
                      (BuildContext context, UserViewModel userView) => UserUpdateScreen(userView)
              ),
            );
          case '/updateResult':
            return CupertinoPageRoute(
              builder:(context) => StoreConnector<AppState, UserViewModel>(
                  converter: (store) => UserViewModel.fromStore(store),
                  builder:
                      (BuildContext context, UserViewModel userView) => UpdateResultScreen(userView)
              ),
            );
          case '/deleteResult':
            return CupertinoPageRoute(
              builder:(context) => StoreConnector<AppState, UserViewModel>(
                  converter: (store) => UserViewModel.fromStore(store),
                  builder:
                      (BuildContext context, UserViewModel userView) => UserDeleteResultScreen(userView)
              ),
            );
          case '/create':
            return CupertinoPageRoute(
              builder:(context) => StoreConnector<AppState, UserViewModel>(
                  converter: (store) => UserViewModel.fromStore(store),
                  builder:
                      (BuildContext context, UserViewModel userView) => UserCreateScreen(userView)
              ),
          );
          case '/createResult':
            return CupertinoPageRoute(
              builder:(context) => StoreConnector<AppState, UserViewModel>(
                  converter: (store) => UserViewModel.fromStore(store),
                  builder:
                      (BuildContext context, UserViewModel userView) => CreateResultScreen(userView)
              ),
            );
           default:
            return null;
        }
      },
    );
  }
}
