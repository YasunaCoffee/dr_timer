import 'package:flutter/material.dart';

class addButton extends StatelessWidget {
  addButton(
      {@required this.setNumbers,
      @required this.setHours,
      @required this.onPressed});
  final String setNumbers;
  final String setHours;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: Color(0xFF374240),
      padding: EdgeInsets.all(5.0),
      onPressed: onPressed,
      child: Column(
        children: [
          Text(
            setNumbers,
            style: TextStyle(fontSize: 40.0, fontFamily: 'FredokaOne'),
          ),
          Text(
            setHours,
            style: TextStyle(fontSize: 15.0, fontFamily: 'FredokaOne'),
          ),
        ],
      ),
    );
  }
}
