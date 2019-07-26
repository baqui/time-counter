import 'dart:convert';

import 'package:time_counter/core/models/user.dart';
import 'package:time_counter/core/models/project.dart';
import 'package:http/http.dart' as http;

/// The service responsible for networking requests
class Api {
  // TODO: switch to http://my-json-server.typicode.com/baqui/time_counter_data/
  //static const endpoint = 'https://jsonplaceholder.typicode.com';
  static const endpoint = 'http://my-json-server.typicode.com/baqui/time_counter_data';

  var client = new http.Client();

  Future<User> getUserProfile(String login) async {
    var response = await client.get('$endpoint/users');
    var parsed = json.decode(response.body);
    var users = parsed.where((f) => f['login'] == login).toList(); //apples
    // Convert and return - select user by login
    return User.fromJson(users.length > 0 ? users[0] : parsed[0]);
  }

  Future<List<Project>> getProjectsForUser(String login) async {
    var projects = List<Project>();
    // Get projects
    var response = await client.get('$endpoint/projects');

    // parse into List
    var parsed = json.decode(response.body) as List<dynamic>;

    // loop and convert each item to Post
    for (var project in parsed) {
      projects.add(Project.fromJson(project));
    }

    return projects;
  }
}
