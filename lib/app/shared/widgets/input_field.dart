import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final IconData icon;
  final String hint;
  final bool obscure;
  final Function(String) onChanged;
  final Function onTap;
  final String errorText;

  InputField({
    this.hint,
    this.icon,
    this.obscure = false,
    this.onChanged,
    this.onTap,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      onTap: onTap,
      decoration: InputDecoration(
        icon: Icon(
          icon,
          color: Color.fromRGBO(248, 80, 50, 0.8),
        ),
        hintText: hint,
        hintStyle: TextStyle(color: Color.fromRGBO(248, 80, 50, 0.8)),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromRGBO(248, 80, 50, 0.8),
          ),
        ),
        contentPadding:
            EdgeInsets.only(left: 5, right: 30, top: 30, bottom: 30),
        errorText: errorText,
        errorStyle: TextStyle(
          color: Color.fromRGBO(248, 80, 50, 0.8),
        ),
      ),
      style: TextStyle(
        color: Color.fromRGBO(248, 80, 50, 0.8),
      ),
      obscureText: obscure,
    );
  }
}
