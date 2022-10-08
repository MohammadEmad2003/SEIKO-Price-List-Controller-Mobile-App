// @dart = 2.9
import 'package:flutter/material.dart';
import 'button.dart';

class dropdown extends StatelessWidget {
  final items;
  Function onChanged;
  String dpValue;
  String title = "";
  dropdown({this.dpValue, this.items, this.onChanged, this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 10),
        Row(
          children: <Widget>[
            SizedBox(width: 20),
            Text(title,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 35)),
          ],
        ),
        SizedBox(height: 10),
        Row(
          children: <Widget>[
            SizedBox(width: 20),
            Center(
              child: DropdownButton<String>(
                value: dpValue,
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                style: const TextStyle(
                    color: Color.fromRGBO(210, 140, 0, 100), fontSize: 22),
                underline: Container(
                  height: 2,
                  color: Color.fromRGBO(210, 140, 0, 100),
                ),
                onChanged: onChanged,
                items: items.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
