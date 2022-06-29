import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomTextField extends StatelessWidget {

  Color? color;
  TextEditingController? controller;
  TextInputType? keyboardType;
  bool? obscure;
  String? hint;
  String label;
  Validator? validator;

  CustomTextField({Key? key, this.color, this.controller, this.keyboardType, this.hint, required this.label, this.obscure, this.validator}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: TextStyle(color: color),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: keyboardType,
      obscureText: obscure ?? false,
      decoration: InputDecoration(
        hintText: hint,
        label: Text(label),
      ),
      validator: (value){
        switch(validator){
          case Validator.none :
            return noValidation(value.toString()
            );
          case Validator.empty :
            return emptyvalidation(value.toString());
          case Validator.password :
            return passwordValidation(value.toString());
          default:
            return noValidation(value);
        }
      },
    );
  }

dynamic noValidation(String? value) {
    return null;
  }
  
  dynamic emptyvalidation(String? value) {
    if(value == ""){
      return "Required filed";
    }
  }
  
  dynamic passwordValidation(String value) {
    if (value.isEmpty) {
      return 'Password can\'t be empty';
    } else if (value.length < 6) {
      return 'Enter a password with length at least 6';
    }
    return null;
  }
}

enum Validator{
  empty, none, password
}