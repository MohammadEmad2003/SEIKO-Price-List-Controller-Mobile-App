// @dart = 2.9
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class costumTF extends StatelessWidget {
  TextEditingController controller;
  String hint;
  String name;
  IconData icon;
  bool isEnable;
  FocusNode focus;
  double fs;
  costumTF({
    this.fs,
    this.controller,
    this.hint,
    this.name,
    this.focus,
    this.icon,
    this.isEnable = true,
  });

  double wid = 350;
  double hi = 50;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.0),
      width: wid,
      height: hi,
      child: TextField(
        focusNode: focus,
        textAlign: TextAlign.center,
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          contentPadding: EdgeInsets.symmetric(horizontal: 12),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: Colors.white, width: 2)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                  color: Color.fromRGBO(210, 140, 0, 100), width: 2)),
        ),
        style: TextStyle(color: Colors.white, fontSize: 18.0),
      ),
    );
  }
}
