// @dart = 2.9
import 'package:flutter/material.dart';

class button extends StatelessWidget {
  button({this.text, this.onPressed});

  String text;
  Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      width: double.infinity,
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.transparent),
              shadowColor:
                  MaterialStateProperty.all(Color.fromRGBO(210, 140, 0, 100))),
          child: Text(
            text,
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          onPressed: onPressed),
      decoration: BoxDecoration(
        color: Color.fromRGBO(210, 140, 0, 100),
        borderRadius: BorderRadius.circular(20.0),
      ),
    );
  }
}
