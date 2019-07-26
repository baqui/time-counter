import 'package:flutter/material.dart';
import 'package:time_counter/core/enums.dart';
import 'package:time_counter/ui/styles/colors.dart';
import 'package:time_counter/ui/widgets/login_header.dart';

import './login_viewmodel.dart';
import 'package:time_counter/core/base/base_view.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
        builder: (context, model, child) => Scaffold(
          backgroundColor: Color.fromRGBO(255, 193, 7, 1.0),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            LoginHeader(
              validationMessage: model.errorMessage,
              controller: _controller),
            model.state == ViewState.Busy
            ? CircularProgressIndicator()
            : FlatButton(
              color: Colors.black,
              child: Text(
                'Login',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async { 
                var loginSuccess = await model.login(_controller.text);
                if(loginSuccess){
                  Navigator.pushNamed(context, '/');
                }
              },
            )
          ],),
        ),
    );
  }
}
