import 'package:time_counter/core/enums.dart';
import 'package:time_counter/core/services/authentication.dart';
import 'package:time_counter/core/base/base_viewmodel.dart';
import 'package:time_counter/locator.dart';

class LoginViewModel extends BaseModel {
  final Authentication _authentication = locator<Authentication>();

  String errorMessage;

  Future<bool> login(String login) async {
    setState(ViewState.Busy);

    if(login == null) {
      errorMessage = 'Please provide valid login';
      setState(ViewState.Idle);
      return false;
    }

    var success = await _authentication.login(login);

    // Handle potential error here too. 

    setState(ViewState.Idle);
    return success;
  }
}
