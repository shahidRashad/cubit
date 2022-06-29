import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomdButton extends StatelessWidget {
  
  String text;
  Function onpress;
  Color? color;

  CustomdButton({Key? key, required this.text, required this.onpress, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (){onpress();}, 
      child: Text(text),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 20),
        primary: color,
        textStyle: TextStyle(color: Colors.white, fontSize: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),)
      ),
    );
  }
}