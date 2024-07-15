import 'package:flutter/material.dart';

Widget buildDropdown({
  required String label,
  required List<String> items,
  required String? value,
  required ValueChanged<String?> onChanged,
  required FormFieldValidator<String?> validator,
}) {
  return DropdownButtonFormField<String>(
    decoration: InputDecoration(
      labelText: label,
      border: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.green),
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.green),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.green),
      ),
    ),
    items: items.map((item) {
      return DropdownMenuItem(
        value: item,
        child: Text(
          item,
        ),
      );
    }).toList(),
    value: value,
    onChanged: onChanged,
    validator: validator,
  );
}
