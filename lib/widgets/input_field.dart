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
        icon: Icon(icon, color: Colors.red[900]),
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red[900])),
        contentPadding:
            EdgeInsets.only(left: 5, right: 30, top: 30, bottom: 30),
        errorText: errorText,
      ),
      style: TextStyle(color: Colors.grey),
      obscureText: obscure,
    );
  }
}
