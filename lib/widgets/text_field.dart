import 'package:flutter/material.dart';

import '../constants/colors.dart';

Widget buildTextField({
  required String label,
  required FormFieldSetter<String> onSaved,
  required FormFieldValidator<String> validator,
  TextInputType keyboardType = TextInputType.text,
}) {
  return TextFormField(
    decoration: inputDecoration(label),
    onSaved: onSaved,
    validator: validator,
    keyboardType: keyboardType,
  );
}

InputDecoration inputDecoration(String label) {
  return InputDecoration(
    labelText: label,
    border: OutlineInputBorder(
      borderSide: BorderSide(color: kPrimaryColorDarkBlue),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: kPrimaryColorDarkBlue),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: kPrimaryColorDarkBlue),
    ),
  );
}
