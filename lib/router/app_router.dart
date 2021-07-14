import 'package:flutter/material.dart';
import '../home_screen.dart';
import '../sgin_screens/main_register_screen.dart';

class AppRouter {
  AppRouter._();
  static AppRouter router = AppRouter._();

  GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

  pushFunction(Widget widget){
    navKey.currentState.push(MaterialPageRoute(builder: (context){
      return widget;
    },),);
  }
  pushNamedFunction(String route){
    navKey.currentState.pushNamed(route);
  }



  Route onGenerateRoute(RouteSettings routeSittings) {

    switch (routeSittings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => MainRegister(),
        );
        break;
      case '/home':
        return MaterialPageRoute(
          builder: (_) => HomeScreen(),
        );
        break;
      default:
        return MaterialPageRoute(
            builder: (context) => Scaffold(
                  body: Center(
                    child: Text(
                      '404',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 50,
                      ),
                    ),
                  ),
                ));
    }
  }
}
