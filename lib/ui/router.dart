import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:time_counter/ui/scenes/home/home_view.dart';
import 'package:time_counter/ui/scenes/login/login_view.dart';

const String initialRoute = "login";

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeView( background: Color.fromRGBO(51, 51, 255, 1.0) ));
      case 'login':
        return MaterialPageRoute(builder: (_) => LoginView());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
