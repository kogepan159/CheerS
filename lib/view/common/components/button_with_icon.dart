import 'package:cheers_app/style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ButtonWithIcon extends StatelessWidget {
  final IconData iconData;
  final VoidCallback onPressed;
  final String label;

  ButtonWithIcon({@required this.onPressed, this.iconData, @required this.label});

  @override
  Widget build(BuildContext context) {
    return RaisedButton.icon(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
        onPressed: onPressed,
        icon: FaIcon(iconData),
        label: Text(label, style: buttonWithIconTextStyle,),
    );
  }
}
