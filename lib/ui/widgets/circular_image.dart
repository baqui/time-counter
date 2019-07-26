import 'package:flutter/material.dart';

class CircularImage extends StatelessWidget {
  final double width;
  final double height;
  final String path;
  final bool shadows;
  final bool border;

  CircularImage({
    Key key,
    @required this.path,
    @required this.width,
    @required this.height,
    this.shadows = false,
    this.border = false
  }) : super(key: key) {
    assert(this.path != null);
    assert(this.width != null);
    assert(this.height != null);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: NetworkImage(path),
        ),
        boxShadow: shadows ? <BoxShadow>[
          BoxShadow(
            color: Colors.black54,
            offset: Offset(0.0, 5.0),
            blurRadius: 5.0,
          )
        ] : null,
        border: border ? Border.all( width: 1, color:  Color.fromRGBO(238, 238, 238, 0.5)) : null
      ),
      width: width,
      height: height,
    );
  }
}
