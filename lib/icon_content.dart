import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class InsideChildCard extends StatelessWidget {
  InsideChildCard({@required this.textname , @required this.icon});
  final String textname;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          textname,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}