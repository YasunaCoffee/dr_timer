import 'package:flutter/material.dart';
import 'package:the_count_down/constants.dart';

class iconButton extends StatelessWidget {
  iconButton({@required this.awesomeIcon, @required this.onPressed});
  final IconData awesomeIcon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0.0,
      child: Icon(
        awesomeIcon,
        size: 45.0,
        color: kBackgroundColor,
      ),
      constraints: BoxConstraints.tightFor(
        width: 100.0,
        height: 100.0,
      ),
      shape: CircleBorder(),
      fillColor: kAccentColor,
      onPressed: onPressed,
    );
  }
}
