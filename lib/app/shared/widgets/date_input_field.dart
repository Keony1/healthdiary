import 'package:flutter/material.dart';

class DateInputField extends StatelessWidget {
  final IconData icon;
  final String hint;
  final bool obscure;
  final Function(String) onChanged;
  final Function onTap;
  final String errorText;
  final String imgFolder;

  DateInputField(
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
      onTap: () => _onTap(context),
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

  void _onTap(BuildContext context) {
    showDatePicker(
        context: context,
        firstDate: DateTime.now(),
        initialDate: DateTime.now(),
        lastDate: DateTime.now(),
        locale: const Locale('pt'));
  }
}
