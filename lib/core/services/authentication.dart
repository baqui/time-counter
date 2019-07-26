import 'dart:async';

import 'package:time_counter/core/models/user.dart';

import '../../locator.dart';
import 'api.dart';

class Authentication {
  Api _api = locator<Api>();

  StreamController<User> userController = StreamController<User>();

  Future<bool> login(String login) async {
    var fetchedUser = await _api.getUserProfile(login);

    var hasUser = fetchedUser != null;
    if(hasUser) {
      userController.add(fetchedUser);
    }

    return hasUser;
  }
}