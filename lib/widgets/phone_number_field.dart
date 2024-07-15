
  import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

Widget buildPhoneNumberField() {
    return IntlPhoneField(
      decoration: InputDecoration(
        labelText: 'Phone',
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
      initialCountryCode: 'US',
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly
      ], // Only numbers allowed
      onCountryChanged: (country) {
        print('Country changed to: ${country.name}');
      },
      onSaved: (phone) => phone = phone?.completeNumber as PhoneNumber?,
      validator: (value) {
        if (value == null) {
          return 'Please enter your phone number';
        }
        return null;
      },
    );
  }
