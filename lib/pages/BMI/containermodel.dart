import 'package:flutter/material.dart';

class Cusomcontainer extends StatelessWidget {
  final Color color;
  final Widget newChild;
  final Function tapFunction;
  Cusomcontainer({@required this.color, this.newChild, this.tapFunction});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tapFunction,
      child: Container(
        child: newChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
