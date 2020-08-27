import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateInputField extends StatelessWidget {
  final String hint;
  final bool obscure;
  final Function(String) onChanged;
  final Function onTap;
  final String errorText;
  final String imgFolder;
  final TextEditingController controller = TextEditingController();

  DateInputField(
      {this.hint,
      this.obscure = false,
      this.onChanged,
      this.onTap,
      this.errorText,
      this.imgFolder});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      keyboardType: TextInputType.datetime,
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
            helpText: "Selecione uma data",
            context: context,
            confirmText: "CONFIRMAR",
            firstDate: DateTime(1950),
            initialDate: DateTime.now(),
            lastDate: DateTime.now(),
            locale: const Locale('pt'))
        .then((date) {
      DateFormat formatter = new DateFormat('dd/MM/yyyy');
      controller.text = formatter.format(date);
    });
  }
}
