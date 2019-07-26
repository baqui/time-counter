import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_counter/core/enums.dart';
import 'package:time_counter/core/models/project.dart';
import 'package:time_counter/core/models/user.dart';
import './home_viewmodel.dart';
import 'package:time_counter/ui/styles/colors.dart';
import 'package:time_counter/ui/styles/text_styles.dart';
import 'package:time_counter/ui/styles/ui_helpers.dart';
import 'package:time_counter/core/base/base_view.dart';
import 'package:time_counter/ui/widgets/bottom_navigation.dart';
import 'package:time_counter/ui/widgets/circular_image.dart';
import 'package:snaplist/snaplist.dart';

class HomeView extends StatefulWidget {
  final Color background;
  const HomeView({ this.background });
  
  @override
  State createState() => _HomeViewState();
}



class _HomeViewState extends State<HomeView> {
  ColorTween backgroundTween;
  Color backgroundColor;

  @override
  void initState() {
    backgroundColor = widget.background;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return BaseView<HomeViewModel>(
      onModelReady: (model) => model.getProjects(Provider.of<User>(context).login),
      builder: (context, model, child) => Scaffold(
        backgroundColor: backgroundColor,
        bottomNavigationBar: BottomNavigation(),
        body: model.state == ViewState.Busy
        ? Center(child: CircularProgressIndicator())
        : Container(
            child: SafeArea(
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      UIHelper.verticalSpaceMedium(),
                      CircularImage(
                        path: Provider.of<User>(context).avatar,
                        width: 50.0,
                        height: 50.0,
                        shadows: true
                      ),
                      SizedBox(
                        height: 24.0,
                      ),
                      Text("Hello, ${Provider.of<User>(context).name}",
                        style: Theme.of(context).textTheme.body1),
                      SizedBox(
                        height: 16.0,
                      ),
                      Text("Lorem ipsum dolor sit amet.",
                        style: Theme.of(context).textTheme.body2),
                    ],
                  )
                ),
                Expanded(child: renderProjectsList(context, model.projects)),
            ],)
          )
        )
      ),
    );
  }

  Widget renderProjectsList(BuildContext context, List<Project> projects) {
    final Size itemSize = Size(280.0, 330.0);

    final screenWidth = MediaQuery.of(context).size.width;
    final horizontalPadding = (screenWidth - itemSize.width) / 2;

    return SnapList(
      sizeProvider: (index, data) => itemSize,
      separatorProvider: (index, data) => Size(20.0, 20.0),
      padding: EdgeInsets.only(left: horizontalPadding, right: horizontalPadding),
      progressUpdate: (progress, center, next) {
        setState(() {
          backgroundTween = ColorTween(
              begin: UIHelper.hexToColor(projects[center].color),
              end: UIHelper.hexToColor(projects[next].color)
          );
          backgroundColor =
              backgroundTween.transform(progress / 100);
        });
      },
      builder: (context, index, data) => Container(
        width: itemSize.width,
        height: itemSize.height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black54, blurRadius: 8.0, offset: Offset(0.0, 12.0))
          ],
        ),
        child: InkWell(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        left: 0,
                        child: CircularImage(
                          path: projects[index].logo,
                          width: 50.0,
                          height: 50.0,
                          border: true
                        )
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Time spent: ${projects[index].timeSpent}", style: Theme.of(context).textTheme.subhead),
                            Text(projects[index].name,
                              style: Theme.of(context).textTheme.display1
                            ),
                          ]
                        )
                      )
                    ]
                  )
                )
              ],
            )
          )
        )
      ),
      count: projects.length
    );
  }
    
}