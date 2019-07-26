import 'package:time_counter/core/enums.dart';
import 'package:time_counter/core/models/project.dart';
import 'package:time_counter/core/services/api.dart';
import 'package:time_counter/locator.dart';
import 'package:time_counter/core/base/base_viewmodel.dart';

class HomeViewModel extends BaseModel {
  Api _api = locator<Api>();

  List<Project> projects;

  Future getProjects(String login) async {
    setState(ViewState.Busy);
    projects = await _api.getProjectsForUser(login);
    setState(ViewState.Idle);
  }
}