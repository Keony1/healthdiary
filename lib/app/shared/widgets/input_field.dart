import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final IconData icon;
  final String hint;
  final bool obscure;
  final Function(String) onChanged;
  final Function onTap;
  final String errorText;
  final String imgFolder;

  InputField(
      {this.hint,
      this.icon,
      this.obscure = false,
      this.onChanged,
      this.onTap,
      this.errorText,
      this.imgFolder});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      onTap: onTap,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          color: Colors.grey[700],
          fontSize: 14,
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
        errorText: errorText,
        errorStyle: TextStyle(
          color: Color.fromRGBO(248, 80, 50, 0.8),
        ),
      ),
      style: TextStyle(
        color: Colors.grey[700],
        fontSize: 14,
      ),
      obscureText: obscure,
    );
  }
}
