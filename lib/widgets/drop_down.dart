import 'package:flutter/material.dart';
import 'package:moyeser_academy_web/widgets/text_field.dart';

Widget buildDropdown({
  required String label,
  required List<String> items,
  required String? value,
  required ValueChanged<String?> onChanged,
  required FormFieldValidator<String?> validator,
}) {
  return DropdownButtonFormField<String>(
    decoration: inputDecoration(label),
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
