import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_counter/core/services/authentication.dart';
import 'package:time_counter/locator.dart';
import 'package:time_counter/ui/router.dart';

import 'core/models/user.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  StreamProvider<User>(
          initialData: User.initial(),
          builder: (context) => locator<Authentication>().userController,
          child: MaterialApp(
            title: 'Time counter',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              textTheme: TextTheme(
                body1: TextStyle(color: Colors.black, fontSize: 28.0),
                body2: TextStyle(color: Colors.white54, fontSize: 14.0),
                display1: TextStyle(color: Colors.black87, fontSize: 36.0),
                caption: TextStyle(
                  color: Colors.white,
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold
                ),
                subhead: TextStyle(color: Colors.black54, fontSize: 12.0)
              )
            ),
            initialRoute: 'login',
            onGenerateRoute: Router.generateRoute,
            debugShowCheckedModeBanner: false
          ),
    );
  }
}
