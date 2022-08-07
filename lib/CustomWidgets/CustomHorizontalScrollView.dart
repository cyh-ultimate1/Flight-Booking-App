import 'package:flutter/material.dart';

class CustomHorizontalScrollView extends StatelessWidget {
  const CustomHorizontalScrollView({Key? key, this.widgets = const <Widget>[]})
      : super(key: key);
  final List<Widget> widgets;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          ...widgets,
        ],
      ),
    );
  }
}
